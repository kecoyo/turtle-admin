<?php

namespace app\butler\controller;

use think\admin\Controller;
use think\admin\extend\DataExtend;

/**
 * 账号分类管理
 * Class Category
 * @package app\butler\controller
 */
class Category extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    private $table = 'ButlerCategory';

    /**
     * 账号分类管理
     * @auth true
     * @menu true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index()
    {
        $this->title = "账号分类管理";
        $query = $this->_query($this->table)->like('name')->dateBetween('create_at');
        $query->equal('status')->where(['is_deleted' => 0])->order('sort desc,id desc')->page(false);
    }

    /**
     * 添加账号分类
     * @auth true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function add()
    {
        $this->_applyFormToken();
        $this->_form($this->table, 'form');
    }

    /**
     * 编辑账号分类
     * @auth true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function edit()
    {
        $this->_applyFormToken();
        $this->_form($this->table, 'form');
    }

    /**
     * 删除账号分类
     * @auth true
     * @throws \think\db\exception\DbException
     */
    public function remove()
    {
        $this->_delete($this->table);
    }

    /**
     * 修改账号分类状态
     * @auth true
     * @throws \think\db\exception\DbException
     */
    public function state()
    {
        $this->_save($this->table, $this->_vali([
            'status.in:0,1'  => '状态值范围异常！',
            'status.require' => '状态值不能为空！',
        ]));
    }
}
