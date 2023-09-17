<?php

namespace app\butler\controller;

use app\butler\model\ButlerIconType;
use think\admin\Controller;
use think\admin\helper\QueryHelper;

/**
 * 图标分类管理
 * Class IconType
 * @package app\butler\controller
 */
class IconType extends Controller
{
    /**
     * 图标分类管理
     * @auth true
     * @menu true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index()
    {
        ButlerIconType::mQuery()->layTable(function () {
            $this->title = '图标分类管理';
        }, function (QueryHelper $query) {
            $query->where(['deleted' => 0]);
            $query->like('name,remark')->equal('status')->dateBetween('create_at')->order('sort asc,id desc');
        });
    }

    /**
     * 添加图标分类
     * @auth true
     */
    public function add()
    {
        ButlerIconType::mForm('form');
    }

    /**
     * 编辑图标分类
     * @auth true
     */
    public function edit()
    {
        ButlerIconType::mForm('form');
    }

    /**
     * 修改图标分类状态
     * @auth true
     */
    public function state()
    {
        ButlerIconType::mSave($this->_vali([
            'status.in:0,1'  => '状态值范围异常！',
            'status.require' => '状态值不能为空！',
        ]));
    }

    /**
     * 删除图标分类
     * @auth true
     */
    public function remove()
    {
        ButlerIconType::mDelete();
    }

}
