<?php
namespace app\api\controller;

use think\admin\model\SystemFile;
use think\admin\Storage;
use think\admin\storage\LocalStorage;
use think\exception\HttpResponseException;
use think\file\UploadedFile;
use think\facade\Filesystem;

class Upload extends Base
{
    /**
     * 检查上传文件的状态
     * @return void
     */
    public function query()
    {
        try {
            $user_id = $this->requireAuth();
            
            $hash = input('post.hash');
            $tags = input('post.tags', '');
            
            if (empty($hash)) {
                $this->error('参数错误：hash 不能为空');
            }
            
            // 先根据 tags 和 hash 查找文件
            $where = ['hash' => $hash];
            if (!empty($tags)) {
                $where['tags'] = $tags;
            }
            $file = SystemFile::mk()->where($where)->find();
            
            if (!empty($file)) {
                // 文件记录存在
                if ($file->status == 2) {
                    // 文件已完成上传
                    $url = !empty($file->xurl) ? $file->xurl : res_url() . $file->xkey;
                    $this->success('文件已存在', ['url' => $url], 0);
                } elseif ($file->status == 1) {
                    // 文件未完成上传，需要断点续传
                    $position = $this->getFileLength($file);
                    $this->success('文件不完整，需要继续上传', ['position' => $position], 1);
                } else {
                    $this->error('文件状态异常');
                }
            } else {
                // 文件记录不存在，根据 hash 查找是否有已完成的上传（秒传）
                $existFile = SystemFile::mk()->where(['hash' => $hash, 'status' => 2])->find();
                if (!empty($existFile)) {
                    // 已上传过了，复制一份（秒传）
                    $newFile = $this->copyFileUpload($existFile, $hash, $tags, $user_id);
                    $url = !empty($newFile->xurl) ? $newFile->xurl : res_url() . $newFile->xkey;
                    $this->success('文件已存在', ['url' => $url], 0);
                } else {
                    // 文件不存在，需要上传
                    $this->success('需要上传', ['position' => 0], 1);
                }
            }
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('查询失败：' . $e->getMessage());
        }
    }
    
    /**
     * 获取文件长度（用于断点续传）
     * @param SystemFile $file
     * @return int
     */
    private function getFileLength($file)
    {
        $type = strtolower($file->type ?: sysconf('storage.type|raw'));
        
        if ($type === 'local') {
            // 本地存储，直接获取文件大小
            $local = LocalStorage::instance();
            $filePath = $local->path($file->xkey, $file->issafe == 1);
            if (file_exists($filePath)) {
                return filesize($filePath);
            }
        } else {
            // 云存储，尝试通过 HTTP HEAD 请求获取文件大小
            $url = !empty($file->xurl) ? $file->xurl : res_url() . $file->xkey;
            $headers = get_headers($url, 1);
            if ($headers && isset($headers['Content-Length'])) {
                $length = is_array($headers['Content-Length']) 
                    ? end($headers['Content-Length']) 
                    : $headers['Content-Length'];
                return intval($length);
            }
        }
        
        // 如果无法获取，返回文件记录中的 size 字段，否则返回 0
        return $file->size ?: 0;
    }
    
    /**
     * 复制文件上传（秒传功能）
     * @param SystemFile $sourceFile 源文件
     * @param string $hash 文件hash
     * @param string $tags 文件标签
     * @param int $user_id 用户ID
     * @return SystemFile
     */
    private function copyFileUpload($sourceFile, $hash, $tags, $user_id)
    {
        // 生成新的保存文件名：upload/{$tags}/{$hash}.{$ext}
        $tagsDir = !empty($tags) ? trim($tags, '/\\') : 'default';
        $extension = $sourceFile->xext;
        $saveFileName = 'upload/' . $tagsDir . '/' . $hash . '.' . $extension;
        
        $type = strtolower($sourceFile->type ?: sysconf('storage.type|raw'));
        $safeMode = $sourceFile->issafe == 1;
        
        if ($type === 'local') {
            // 本地存储，直接复制文件
            $local = LocalStorage::instance();
            $sourcePath = $local->path($sourceFile->xkey, $safeMode);
            $targetPath = $local->path($saveFileName, $safeMode);
            
            if (file_exists($sourcePath)) {
                $targetDir = dirname($targetPath);
                if (!is_dir($targetDir)) {
                    mkdir($targetDir, 0777, true);
                }
                copy($sourcePath, $targetPath);
                $info = $local->info($saveFileName, $safeMode, $sourceFile->name);
            } else {
                $this->error('源文件不存在');
            }
        } else {
            // 云存储，读取源文件内容并写入新位置
            $storage = Storage::instance($type);
            $fileContent = $storage->get($sourceFile->xkey, $safeMode);
            if (empty($fileContent)) {
                $this->error('读取源文件失败');
            }
            $info = $storage->set($saveFileName, $fileContent, $safeMode, $sourceFile->name);
        }
        
        if (empty($info['url'])) {
            $this->error('文件复制失败');
        }
        
        // 创建新的文件记录
        $fileData = [
            'name' => $sourceFile->name,
            'hash' => $hash,
            'xext' => $extension,
            'size' => $sourceFile->size,
            'mime' => $sourceFile->mime,
            'tags' => $tags,
            'xkey' => $saveFileName,
            'xurl' => $info['url'],
            'type' => $type,
            'uuid' => $user_id,
            'status' => 2,
            'issafe' => $safeMode ? 1 : 0,
        ];
        
        return SystemFile::mk()->create($fileData);
    }

    /**
     * 表单方式上传文件
     * @return void
     */
    public function uploadFile()
    {
        try {
            $user_id = $this->requireAuth();
            
            $tags = input('post.tags', '');
            
            // 获取上传的文件
            $file = $this->request->file('file');
            if (empty($file) || !($file instanceof UploadedFile)) {
                $this->error('未获取到上传的文件');
            }
            
            $extension = strtolower($file->getOriginalExtension());
            
            // 检查文件类型
            $allowExtsStr = sysconf('storage.allow_exts|raw') ?: 'jpg,jpeg,png,gif,bmp,webp';
            $allowExts = explode(',', str_replace(['|', ' '], [',', ''], $allowExtsStr));
            $allowExts = array_map('trim', $allowExts);
            if (!in_array($extension, $allowExts)) {
                $this->error('文件类型不允许上传');
            }
            
            // 禁止上传可执行文件
            if (in_array($extension, ['sh', 'asp', 'bat', 'cmd', 'exe', 'php'])) {
                $this->error('禁止上传可执行文件');
            }
            
            // 计算文件hash
            $hash = md5_file($file->getPathname());
            
            // 生成文件保存名称：upload/{$tags}/{$md5}.{$ext}
            $tagsDir = !empty($tags) ? trim($tags, '/\\') : 'default';
            $saveFileName = 'upload/' . $tagsDir . '/' . $hash . '.' . $extension;
            
            // 检查文件是否已存在（同时检查hash和tags，同目录文件不重复上传）
            $where = ['hash' => $hash, 'tags' => $tags];
            $existFile = SystemFile::mk()->where($where)->find();
            if (!empty($existFile) && $existFile->status == 2) {
                $url = !empty($existFile->xurl) ? $existFile->xurl : res_url() . $existFile->xkey;
                $this->success('上传成功', ['url' => $url]);
            }
            
            // 上传文件
            $type = strtolower(sysconf('storage.type|raw'));
            $safeMode = false;
            
            if ($type === 'local') {
                $local = LocalStorage::instance();
                $distName = $local->path($saveFileName, $safeMode);
                $file->move(dirname($distName), basename($distName));
                $info = $local->info($saveFileName, $safeMode, $file->getOriginalName());
                
                // 图片尺寸检查
                if (in_array($extension, ['jpg', 'gif', 'png', 'bmp', 'jpeg', 'wbmp'])) {
                    [$width, $height] = getimagesize($distName);
                    if ($width < 1 || $height < 1) {
                        $local->del($saveFileName);
                        $this->error('读取图片尺寸失败');
                    }
                }
            } else {
                $bina = file_get_contents($file->getPathname());
                $info = Storage::instance($type)->set($saveFileName, $bina, $safeMode, $file->getOriginalName());
            }
            
            if (empty($info['url'])) {
                $this->error('文件上传失败');
            }
            
            // 保存文件记录
            $fileData = [
                'name' => $file->getOriginalName(),
                'hash' => $hash,
                'xext' => $extension,
                'size' => $file->getSize(),
                'mime' => $file->getMime(),
                'tags' => $tags,
                'xkey' => $saveFileName,
                'xurl' => $info['url'],
                'type' => $type,
                'uuid' => $user_id,
                'status' => 2,
                'issafe' => $safeMode ? 1 : 0,
            ];
            
            if (!empty($existFile)) {
                $existFile->save($fileData);
                $fileRecord = $existFile;
            } else {
                $fileRecord = SystemFile::mk()->create($fileData);
            }
            
            $url = !empty($fileRecord->xurl) ? $fileRecord->xurl : res_url() . $fileRecord->xkey;
            $this->success('上传成功', ['url' => $url]);
            
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('上传失败：' . $e->getMessage());
        }
    }

    /**
     * 大文件分片上传，支持断点续传
     * @return void
     */
    public function uploadChunk()
    {
        try {
            $user_id = $this->requireAuth();
            
            $tags = input('post.tags', '');
            $hash = input('post.hash');
            $name = input('post.name');
            $size = input('post.size');
            $mime = input('post.mime', '');
            $start = input('post.start', 0);
            $length = input('post.length');
            $content = input('post.content'); // base64编码的内容
            
            if (empty($hash) || empty($name) || empty($size) || empty($length) || empty($content)) {
                $this->error('参数错误：必填参数不能为空');
            }
            
            // 解码base64内容
            $chunkData = base64_decode($content);
            if ($chunkData === false) {
                $this->error('base64解码失败');
            }
            
            // 检查文件类型
            $extension = strtolower(pathinfo($name, PATHINFO_EXTENSION));
            $allowExtsStr = sysconf('storage.allow_exts|raw') ?: 'jpg,jpeg,png,gif,bmp,webp';
            $allowExts = explode(',', str_replace(['|', ' '], [',', ''], $allowExtsStr));
            $allowExts = array_map('trim', $allowExts);
            if (!in_array($extension, $allowExts)) {
                $this->error('文件类型不允许上传');
            }
            
            // 禁止上传可执行文件
            if (in_array($extension, ['sh', 'asp', 'bat', 'cmd', 'exe', 'php'])) {
                $this->error('禁止上传可执行文件');
            }
            
            // 生成临时文件路径用于分片合并
            $runtimePath = $this->app->getRootPath() . 'runtime' . DIRECTORY_SEPARATOR;
            if (!function_exists('runtime_path')) {
                // 如果 runtime_path 函数不存在，使用默认路径
                $tempDir = $runtimePath . 'upload' . DIRECTORY_SEPARATOR . $hash . DIRECTORY_SEPARATOR;
            } else {
                $tempDir = runtime_path() . 'upload' . DIRECTORY_SEPARATOR . $hash . DIRECTORY_SEPARATOR;
            }
            if (!is_dir($tempDir)) {
                mkdir($tempDir, 0777, true);
            }
            
            // 保存当前分片
            $chunkFile = $tempDir . 'chunk_' . $start;
            file_put_contents($chunkFile, $chunkData);
            
            // 记录已上传的分片位置
            $chunkInfoFile = $tempDir . 'chunks.json';
            $chunks = [];
            if (file_exists($chunkInfoFile)) {
                $chunks = json_decode(file_get_contents($chunkInfoFile), true) ?: [];
            }
            if (!in_array($start, $chunks)) {
                $chunks[] = $start;
                sort($chunks);
                file_put_contents($chunkInfoFile, json_encode($chunks));
            }
            
            // 计算总需要的分片数
            $chunkSize = 1048576; // 1MB
            $totalChunks = ceil($size / $chunkSize);
            
            // 检查是否所有分片都已上传
            if (count($chunks) < $totalChunks) {
                // 还有分片未上传，返回下一个位置
                $nextPosition = $start + $length;
                // 确保不超过文件大小
                if ($nextPosition >= $size) {
                    $nextPosition = $size;
                }
                $this->success('分片上传成功，继续上传', ['position' => $nextPosition], 1);
            }
            
            // 所有分片已上传，合并文件
            $finalFile = $tempDir . 'final_' . $name;
            $fp = fopen($finalFile, 'wb');
            if (!$fp) {
                $this->error('创建最终文件失败');
            }
            
            // 按顺序合并所有分片
            foreach ($chunks as $chunkStart) {
                $chunkFile = $tempDir . 'chunk_' . $chunkStart;
                if (file_exists($chunkFile)) {
                    $chunkData = file_get_contents($chunkFile);
                    fwrite($fp, $chunkData);
                }
            }
            fclose($fp);
            
            // 验证文件hash
            $finalHash = md5_file($finalFile);
            if ($finalHash !== $hash) {
                unlink($finalFile);
                $this->error('文件hash验证失败');
            }
            
            // 生成保存文件名：upload/{$tags}/{$md5}.{$ext}
            $tagsDir = !empty($tags) ? trim($tags, '/\\') : 'default';
            $saveFileName = 'upload/' . $tagsDir . '/' . $hash . '.' . $extension;
            
            // 上传到存储
            $type = strtolower(sysconf('storage.type|raw'));
            $safeMode = false;
            
            if ($type === 'local') {
                $local = LocalStorage::instance();
                $distName = $local->path($saveFileName, $safeMode);
                $distDir = dirname($distName);
                if (!is_dir($distDir)) {
                    mkdir($distDir, 0777, true);
                }
                rename($finalFile, $distName);
                $info = $local->info($saveFileName, $safeMode, $name);
                
                // 图片尺寸检查
                if (in_array($extension, ['jpg', 'gif', 'png', 'bmp', 'jpeg', 'wbmp'])) {
                    [$width, $height] = getimagesize($distName);
                    if ($width < 1 || $height < 1) {
                        $local->del($saveFileName);
                        $this->error('读取图片尺寸失败');
                    }
                }
            } else {
                $bina = file_get_contents($finalFile);
                $info = Storage::instance($type)->set($saveFileName, $bina, $safeMode, $name);
            }
            
            // 清理临时文件
            $this->deleteDir($tempDir);
            
            if (empty($info['url'])) {
                $this->error('文件上传失败');
            }
            
            // 保存文件记录
            $fileData = [
                'name' => $name,
                'hash' => $hash,
                'xext' => $extension,
                'size' => $size,
                'mime' => $mime ?: Storage::mime($extension),
                'tags' => $tags,
                'xkey' => $saveFileName,
                'xurl' => $info['url'],
                'type' => $type,
                'uuid' => $user_id,
                'status' => 2,
                'issafe' => $safeMode ? 1 : 0,
            ];
            
            $existFile = SystemFile::mk()->where(['hash' => $hash])->find();
            if (!empty($existFile)) {
                $existFile->save($fileData);
                $fileRecord = $existFile;
            } else {
                $fileRecord = SystemFile::mk()->create($fileData);
            }
            
            $url = !empty($fileRecord->xurl) ? $fileRecord->xurl : res_url() . $fileRecord->xkey;
            $this->success('上传成功', ['url' => $url]);
            
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('上传失败：' . $e->getMessage());
        }
    }

    /**
     * 删除目录
     * @param string $dir
     * @return bool
     */
    private function deleteDir(string $dir): bool
    {
        if (!is_dir($dir)) {
            return false;
        }
        
        $files = array_diff(scandir($dir), ['.', '..']);
        foreach ($files as $file) {
            $path = $dir . DIRECTORY_SEPARATOR . $file;
            is_dir($path) ? $this->deleteDir($path) : unlink($path);
        }
        
        return rmdir($dir);
    }
}
