<?php
namespace app\api\controller;

use app\butler\model\ButlerAccount;
use app\butler\model\ButlerCategory;
use think\exception\HttpResponseException;

class Category extends Base
{
    /**
     * 获取账号分类列表
     * @return void
     */
    public function list()
    {
        $user_id = $this->requireAuth();

        try {
            // 获取用户的分类列表
            $categories = ButlerCategory::mk()
                ->where(['deleted' => 0, 'status' => 1, 'user_id' => $user_id])
                ->field('id,name,icon')
                ->order('sort asc,id desc')
                ->select()
                ->toArray();

            // 统计每个分类下的账号数量
            $counts = ButlerAccount::mk()
                ->where(['deleted' => 0, 'user_id' => $user_id])
                ->field('category_id,count(1) as count')
                ->group('category_id')
                ->select()
                ->toArray();

            $countMap = [];
            foreach ($counts as $count) {
                $countMap[$count['category_id']] = $count['count'];
            }

            // 处理icon URL并添加count
            foreach ($categories as &$category) {
                $category['count'] = $countMap[$category['id']] ?? 0;
                if (!empty($category['icon'])) {
                    $category['icon'] = res_url() . $category['icon'];
                }
            }

            $this->success('获取成功', $categories);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            trace_file($e);
            $this->error('获取失败：' . $e->getMessage());
        }
    }

    /**
     * 获取账号分类信息
     * @return void
     */
    public function info()
    {
        $user_id = $this->requireAuth();

        $id = input('id');
        if (empty($id)) {
            $this->error('分类ID不能为空');
        }

        try {
            $category = ButlerCategory::mk()
                ->where(['id' => $id, 'deleted' => 0, 'user_id' => $user_id])
                ->field('id,name,icon')
                ->find();

            if ($category->isEmpty()) {
                $this->error('分类不存在或无权限访问');
            }

            $categoryData = $category->toArray();
            if (!empty($categoryData['icon'])) {
                $categoryData['icon'] = res_url() . $categoryData['icon'];
            }

            $this->success('获取成功', $categoryData);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }

    /**
     * 添加账号分类
     * @return void
     */
    public function add()
    {
        $user_id = $this->requireAuth();

        $data = $this->request->post();
        if (empty($data['name'])) {
            $this->error('分类名称不能为空');
        }

        try {
            // 获取最大排序值
            $maxSort = ButlerCategory::mk()
                ->where(['user_id' => $user_id])
                ->max('sort') ?: 0;

            $categoryData = [
                'user_id' => $user_id,
                'name' => $data['name'],
                'icon' => !empty($data['icon']) ? remove_res_url($data['icon']) : '',
                'remark' => $data['remark'] ?? '',
                'sort' => $maxSort + 1,
                'status' => 1,
                'deleted' => 0,
                'create_at' => date('Y-m-d H:i:s'),
            ];

            $category = ButlerCategory::mk()->create($categoryData);
            $categoryData['id'] = $category->id;
            if (!empty($categoryData['icon'])) {
                $categoryData['icon'] = res_url() . $categoryData['icon'];
            }

            $this->success('添加成功', $categoryData);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('添加失败：' . $e->getMessage());
        }
    }

    /**
     * 修改账号分类
     * @return void
     */
    public function update()
    {
        $user_id = $this->requireAuth();

        $data = $this->request->post();
        if (empty($data['id'])) {
            $this->error('分类ID不能为空');
        }
        if (empty($data['name'])) {
            $this->error('分类名称不能为空');
        }

        try {
            // 验证分类是否属于当前用户
            $category = ButlerCategory::mk()
                ->where(['id' => $data['id'], 'deleted' => 0, 'user_id' => $user_id])
                ->find();

            if ($category->isEmpty()) {
                $this->error('分类不存在或无权限访问');
            }

            $updateData = [
                'name' => $data['name'],
            ];

            if (isset($data['icon'])) {
                $updateData['icon'] = !empty($data['icon']) ? remove_res_url($data['icon']) : '';
            }

            if (isset($data['remark'])) {
                $updateData['remark'] = $data['remark'];
            }

            $result = ButlerCategory::mk()
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
     * 删除账号分类
     * @return void
     */
    public function delete()
    {
        $user_id = $this->requireAuth();

        $id = input('id');
        if (empty($id)) {
            $this->error('分类ID不能为空');
        }

        try {
            $result = ButlerCategory::mk()
                ->where(['id' => $id, 'user_id' => $user_id])
                ->update(['deleted' => 1]);

            if ($result) {
                $this->success('删除成功', ['affected_rows' => $result]);
            } else {
                $this->error('删除失败，分类不存在或无权限');
            }
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('删除失败：' . $e->getMessage());
        }
    }

    /**
     * 排序账号分类（拖拽排序）
     * @return void
     */
    public function sort()
    {
        $user_id = $this->requireAuth();

        $ids = input('ids');
        if (empty($ids)) {
            $this->error('分类ID数组不能为空');
        }

        if (is_string($ids)) {
            $ids = json_decode($ids, true);
        }

        if (!is_array($ids) || empty($ids)) {
            $this->error('分类ID数组格式错误');
        }

        try {
            $affectedRows = 0;
            foreach ($ids as $index => $id) {
                $result = ButlerCategory::mk()
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
}

