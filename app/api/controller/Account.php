<?php
namespace app\api\controller;

use app\butler\model\ButlerAccount;
use app\butler\model\ButlerCategory;
use think\exception\HttpResponseException;

class Account extends Base
{
    /**
     * 获取账号分类列表
     * @return void
     */
    public function categories()
    {
        $user_id = $this->requireAuth();

        try {
            // 获取用户的分类列表
            $categories = ButlerCategory::mk()
                ->where(['deleted' => 0, 'status' => 1, 'user_id' => $user_id])
                ->field('id,name,icon,remark,sort')
                ->order('sort asc,id desc')
                ->select()
                ->toArray();

            // 统计每个分类下的账号数量，并处理icon URL
            foreach ($categories as &$category) {
                $count = ButlerAccount::mk()
                    ->where(['deleted' => 0, 'category_id' => $category['id'], 'user_id' => $user_id])
                    ->count();
                $category['count'] = $count;
                // 处理icon URL
                if (!empty($category['icon'])) {
                    $category['icon'] = res_url() . $category['icon'];
                }
            }

            $this->success('获取成功', [
                'categories' => $categories
            ]);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }

    /**
     * 获取账号列表
     * 根据分类ID获取该分类下的所有账号
     * @return void
     */
    public function list()
    {
        $user_id = $this->requireAuth();

        $category_id = input('category_id');
        if (empty($category_id)) {
            $this->error('缺少category_id参数');
        }

        try {
            // 验证分类是否属于当前用户
            $category = ButlerCategory::mk()
                ->where(['id' => $category_id, 'deleted' => 0, 'user_id' => $user_id])
                ->find();

            if ($category->isEmpty()) {
                $this->error('分类不存在或无权限访问');
            }

            // 获取该分类下的账号列表
            $accounts = ButlerAccount::mk()
                ->where(['deleted' => 0, 'category_id' => $category_id, 'user_id' => $user_id])
                ->field('id,name,icon,remark,properties,pictures,status,sort,create_at')
                ->order('sort asc,id desc')
                ->select()
                ->toArray();

            // 处理图片URL和属性
            foreach ($accounts as &$account) {
                // 解析properties
                if (!empty($account['properties'])) {
                    $properties = is_string($account['properties']) 
                        ? json_decode($account['properties'], true) 
                        : $account['properties'];
                    $account['properties'] = is_array($properties) ? $properties : [];
                } else {
                    $account['properties'] = [];
                }
                
                // 解析pictures
                if (!empty($account['pictures'])) {
                    $pictures = is_string($account['pictures']) 
                        ? json_decode($account['pictures'], true) 
                        : $account['pictures'];
                    if (is_array($pictures)) {
                        foreach ($pictures as &$picture) {
                            if (isset($picture['url']) && !empty($picture['url'])) {
                                $picture['url'] = res_url() . $picture['url'];
                            }
                        }
                        $account['pictures'] = $pictures;
                    } else {
                        $account['pictures'] = [];
                    }
                } else {
                    $account['pictures'] = [];
                }
                
                if (!empty($account['icon'])) {
                    $account['icon'] = res_url() . $account['icon'];
                }
            }

            $this->success('获取成功', $accounts);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }

    /**
     * 获取账号信息
     * @return void
     */
    public function info()
    {
        $user_id = $this->requireAuth();

        $id = input('id');
        if (empty($id)) {
            $this->error('缺少id参数');
        }

        try {
            $account = ButlerAccount::mk()
                ->where(['id' => $id, 'deleted' => 0, 'user_id' => $user_id])
                ->field('id,name,icon,remark,properties,pictures,status,sort,create_at')
                ->find();

            if ($account->isEmpty()) {
                $this->error('账号不存在或无权限访问');
            }

            $accountData = $account->toArray();

            // 解析properties
            if (!empty($accountData['properties'])) {
                $properties = is_string($accountData['properties']) 
                    ? json_decode($accountData['properties'], true) 
                    : $accountData['properties'];
                $accountData['properties'] = is_array($properties) ? $properties : [];
            } else {
                $accountData['properties'] = [];
            }

            // 处理图片URL
            if (!empty($accountData['pictures'])) {
                $pictures = is_string($accountData['pictures']) 
                    ? json_decode($accountData['pictures'], true) 
                    : $accountData['pictures'];
                if (is_array($pictures)) {
                    foreach ($pictures as &$picture) {
                        if (isset($picture['url']) && !empty($picture['url'])) {
                            $picture['url'] = res_url() . $picture['url'];
                        }
                    }
                    $accountData['pictures'] = $pictures;
                } else {
                    $accountData['pictures'] = [];
                }
            } else {
                $accountData['pictures'] = [];
            }
            
            if (!empty($accountData['icon'])) {
                $accountData['icon'] = res_url() . $accountData['icon'];
            }

            $this->success('获取成功', $accountData);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }

    /**
     * 添加账号
     * @return void
     */
    public function add()
    {
        $user_id = $this->requireAuth();

        $data = $this->request->post();
        if (empty($data['name'])) {
            $this->error('账号名称不能为空');
        }
        if (empty($data['icon'])) {
            $this->error('账号图标不能为空');
        }
        if (empty($data['category_id'])) {
            $this->error('分类ID不能为空');
        }

        try {
            // 验证分类是否属于当前用户
            $category = ButlerCategory::mk()
                ->where(['id' => $data['category_id'], 'deleted' => 0, 'user_id' => $user_id])
                ->find();

            if ($category->isEmpty()) {
                $this->error('分类不存在或无权限访问');
            }

            // 处理图片
            $pictures = [];
            if (!empty($data['pictures'])) {
                if (is_string($data['pictures'])) {
                    $pictures = json_decode($data['pictures'], true);
                } else {
                    $pictures = $data['pictures'];
                }
                // 处理图片URL，移除域名前缀
                foreach ($pictures as &$picture) {
                    if (isset($picture['url'])) {
                        $picture['url'] = remove_res_url($picture['url']);
                    }
                }
            }

            // 处理属性
            $properties = [];
            if (!empty($data['properties'])) {
                if (is_string($data['properties'])) {
                    $properties = json_decode($data['properties'], true);
                } else {
                    $properties = $data['properties'];
                }
            }

            // 获取最大排序值
            $maxSort = ButlerAccount::mk()
                ->where(['user_id' => $user_id, 'category_id' => $data['category_id']])
                ->max('sort') ?: 0;

            $accountData = [
                'user_id' => $user_id,
                'category_id' => $data['category_id'],
                'name' => $data['name'],
                'icon' => remove_res_url($data['icon']),
                'remark' => $data['remark'] ?? '',
                'properties' => json_encode($properties, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
                'pictures' => !empty($pictures) ? json_encode($pictures, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) : '',
                'sort' => $maxSort + 1,
                'status' => 1,
                'deleted' => 0,
                'create_at' => date('Y-m-d H:i:s'),
            ];

            $account = ButlerAccount::mk()->create($accountData);
            $accountData['id'] = $account->id;
            $accountData['icon'] = res_url() . $accountData['icon'];
            if (!empty($pictures)) {
                foreach ($pictures as &$pic) {
                    $pic['url'] = res_url() . $pic['url'];
                }
                $accountData['pictures'] = $pictures;
            }
            $accountData['properties'] = $properties;

            $this->success('创建成功', $accountData);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('创建失败：' . $e->getMessage());
        }   
    }

    /**
     * 修改账号
     * @return void
     */
    public function update()
    {
        $user_id = $this->requireAuth();

        $data = $this->request->post();
        if (empty($data['id'])) {
            $this->error('账号ID不能为空');
        }
        if (empty($data['name'])) {
            $this->error('账号名称不能为空');
        }
        if (empty($data['icon'])) {
            $this->error('账号图标不能为空');
        }

        try {
            // 验证账号是否属于当前用户
            $account = ButlerAccount::mk()
                ->where(['id' => $data['id'], 'deleted' => 0, 'user_id' => $user_id])
                ->find();

            if ($account->isEmpty()) {
                $this->error('账号不存在或无权限访问');
            }

            $updateData = [
                'name' => $data['name'],
                'icon' => remove_res_url($data['icon']),
                'remark' => $data['remark'] ?? '',
            ];

            // 处理属性
            if (isset($data['properties'])) {
                $properties = is_string($data['properties']) 
                    ? json_decode($data['properties'], true) 
                    : $data['properties'];
                $updateData['properties'] = json_encode($properties, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            }

            // 处理图片
            if (isset($data['pictures'])) {
                $pictures = [];
                if (!empty($data['pictures'])) {
                    if (is_string($data['pictures'])) {
                        $pictures = json_decode($data['pictures'], true);
                    } else {
                        $pictures = $data['pictures'];
                    }
                    // 处理图片URL，移除域名前缀
                    foreach ($pictures as &$picture) {
                        if (isset($picture['url'])) {
                            $picture['url'] = remove_res_url($picture['url']);
                        }
                    }
                }
                $updateData['pictures'] = !empty($pictures) 
                    ? json_encode($pictures, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) 
                    : '';
            }

            $result = ButlerAccount::mk()
                ->where(['id' => $data['id'], 'user_id' => $user_id])
                ->update($updateData);

            $this->success('修改成功', ['affected_rows' => $result]);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('修改失败：' . $e->getMessage());
        }
    }

    /**
     * 删除账号
     * @return void
     */
    public function delete()
    {
        $user_id = $this->requireAuth();

        $id = input('id');
        if (empty($id)) {
            $this->error('账号ID不能为空');
        }

        try {
            $result = ButlerAccount::mk()
                ->where(['id' => $id, 'user_id' => $user_id])
                ->update(['deleted' => 1]);

            if ($result) {
                $this->success('删除成功', ['affected_rows' => $result]);
            } else {
                $this->error('删除失败，账号不存在或无权限');
            }
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('删除失败：' . $e->getMessage());
        }
    }

    /**
     * 排序账号
     * @return void
     */
    public function sort()
    {
        $user_id = $this->requireAuth();

        $ids = input('ids');
        if (empty($ids)) {
            $this->error('账号ID数组不能为空');
        }

        if (is_string($ids)) {
            $ids = json_decode($ids, true);
        }

        if (!is_array($ids) || empty($ids)) {
            $this->error('账号ID数组格式错误');
        }

        try {
            $affectedRows = 0;
            foreach ($ids as $index => $id) {
                $result = ButlerAccount::mk()
                    ->where(['id' => $id, 'user_id' => $user_id])
                    ->update(['sort' => $index + 1]);
                $affectedRows += $result;
            }

            $this->success('排序成功', ['affected_rows' => $affectedRows]);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('排序失败：' . $e->getMessage());
        }
    }

    /**
     * 移动账号
     * @return void
     */
    public function move()
    {
        $user_id = $this->requireAuth();

        $id = input('id');
        $category_id = input('category_id');

        if (empty($id)) {
            $this->error('账号ID不能为空');
        }
        if (empty($category_id)) {
            $this->error('目标分类ID不能为空');
        }

        try {
            // 验证账号是否属于当前用户
            $account = ButlerAccount::mk()
                ->where(['id' => $id, 'deleted' => 0, 'user_id' => $user_id])
                ->find();

            if ($account->isEmpty()) {
                $this->error('账号不存在或无权限访问');
            }

            // 验证目标分类是否属于当前用户
            $category = ButlerCategory::mk()
                ->where(['id' => $category_id, 'deleted' => 0, 'user_id' => $user_id])
                ->find();

            if ($category->isEmpty()) {
                $this->error('目标分类不存在或无权限访问');
            }

            $result = ButlerAccount::mk()
                ->where(['id' => $id, 'user_id' => $user_id])
                ->update(['category_id' => $category_id]);

            $this->success('移动成功', ['affected_rows' => $result]);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('移动失败：' . $e->getMessage());
        }
    }
}

