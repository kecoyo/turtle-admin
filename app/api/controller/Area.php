<?php
namespace app\api\controller;

use app\butler\model\ButlerArea;
use think\exception\HttpResponseException;

class Area extends Base
{
    /**
     * 获取全部区域列表，包含省市区县
     * @return void
     */
    public function list()
    {
        try {
            $data = ButlerArea::mk()
                ->field('id,name,level,pid')
                ->select()
                ->toArray();

            $this->success('获取成功', $data);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }

}
