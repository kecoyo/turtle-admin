<?php

namespace app\butler\controller\api;

use app\butler\model\ButlerIcon;
use app\butler\model\ButlerIconType;
use think\admin\Controller;

/**
 * 通用插件管理
 * Class Plugs.
 */
class Plugs extends Controller
{
    /**
     * 图标选择器.
     *
     * @login true
     */
    public function icon()
    {
        $this->title = '图标选择器';
        $this->field = $this->app->request->get('field', 'icon');

        // 分类数据
        $this->clist = ButlerIconType::mk()
            ->where(['is_deleted' => 0, 'status' => 1])
            ->order('sort asc,id desc')
            ->column('id,name', 'id');

        // 分类数据统计
        ButlerIcon::mk()
            ->fieldRaw('type_id,count(1) total')
            ->where(['is_deleted' => 0, 'status' => 1])
            ->group('type_id')
            ->select()
            ->map(function ($vo) {
                if (isset($this->clist[$vo['type_id']])) {
                    $this->clist[$vo['type_id']]['total'] = $vo['total'];
                }
            });

        // 默认选中第一个分类
        $first = current($this->clist);

        $this->type_id = input('type_id', $first ? $first['id'] : '');

        // 图标列表查询
        $this->list = ButlerIcon::mk()
            ->where(['is_deleted' => 0, 'status' => 1, 'type_id' => $this->type_id])
            ->order('sort asc,id desc')
            ->select();

        $this->fetch(realpath(__DIR__.'/../../view/api/icon.html'));
    }
}
