<?php
namespace app\api\controller;

use app\butler\model\ButlerIconType;
use think\exception\HttpResponseException;

class IconType extends Base
{
    /**
     * 获取图标分类列表
     * @return void
     */
    public function list()
    {
        try {
            // 获取图标分类列表
            $iconTypes = ButlerIconType::mk()
                ->where(['deleted' => 0, 'status' => 1])
                ->field('id,name,remark')
                ->order('sort asc,id desc')
                ->select()
                ->toArray();

            $this->success('获取成功', $iconTypes);
        } catch (HttpResponseException $e) {
            // HttpResponseException 是 success/error 方法抛出的正常异常，直接重新抛出
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }
}
