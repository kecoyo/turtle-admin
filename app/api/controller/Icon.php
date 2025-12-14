<?php
namespace app\api\controller;

use app\butler\model\ButlerIcon;
use app\butler\model\ButlerIconType;
use think\exception\HttpResponseException;

class Icon extends Base
{
    
    /**
     * 获取图标列表
     * 根据图标分类ID查询该分类下的所有图标（不带分组）
     * @return void
     */
    public function list()
    {
        try {
            // 获取分类ID参数
            $typeId = input('type_id', 0);
            
            if (empty($typeId) || !is_numeric($typeId)) {
                $this->error('请指定有效的分类ID');
            }

            // 验证分类是否存在
            $iconType = ButlerIconType::mk()
                ->where(['id' => $typeId, 'deleted' => 0, 'status' => 1])
                ->find();
            
            if (empty($iconType)) {
                $this->error('分类不存在或已禁用');
            }

            // 获取该分类下的所有图标
            $icons = ButlerIcon::mk()
                ->where(['type_id' => $typeId, 'deleted' => 0, 'status' => 1])
                ->field('url')
                ->order('sort asc,id desc')
                ->select()
                ->toArray();

            // 处理图标URL
            $result = [];
            foreach ($icons as $icon) {
                if (!empty($icon['url'])) {
                    $result[] = res_url() . $icon['url'];
                }
            }

            $this->success('获取成功', $result);
        } catch (HttpResponseException $e) {
            // HttpResponseException 是 success/error 方法抛出的正常异常，直接重新抛出
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }

    /**
     * 获取图标列表（分组）
     * 用于图标选择加载按图标分类把所有图标分组
     * @return void
     */
    public function listGroup()
    {
        try {
            // 获取图标分类列表
            $iconTypes = ButlerIconType::mk()
                ->where(['deleted' => 0, 'status' => 1])
                ->field('id,name')
                ->order('sort asc,id desc')
                ->select()
                ->toArray();

            // 获取所有图标
            $icons = ButlerIcon::mk()
                ->where(['deleted' => 0, 'status' => 1])
                ->field('type_id,url')
                ->select()
                ->toArray();

            // 按分类分组图标
            $iconTypeMap = [];
            foreach ($iconTypes as $iconType) {
                $iconTypeMap[$iconType['id']] = [
                    'id' => $iconType['id'],
                    'name' => $iconType['name'],
                    'icons' => [],
                ];
            }

            foreach ($icons as $icon) {
                $typeId = $icon['type_id'];
                if (isset($iconTypeMap[$typeId])) {
                    $iconUrl = !empty($icon['url']) ? res_url() . $icon['url'] : '';
                    if (!empty($iconUrl)) {
                        $iconTypeMap[$typeId]['icons'][] = $iconUrl;
                    }
                }
            }

            // 过滤掉没有图标的分类
            $result = array_values(array_filter($iconTypeMap, function ($item) {
                return !empty($item['icons']);
            }));

            $this->success('获取成功', $result);
        } catch (HttpResponseException $e) {
            // HttpResponseException 是 success/error 方法抛出的正常异常，直接重新抛出
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }

}

