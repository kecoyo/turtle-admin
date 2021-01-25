<?php

namespace app\butler\controller;

use think\admin\Controller;
use think\admin\extend\DataExtend;

/**
 * 账号管理
 * Class Account
 * @package app\butler\controller
 */
class Account extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    private $table = 'ButlerAccount';

    /**
     * 账号管理
     * @auth true
     * @menu true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index()
    {
        $this->title = '账号管理';

        // 分类数据统计
        $this->clist = $this->app->db->name('ButlerCategory')->where(['is_deleted' => 0, 'status' => 1])->order('sort desc,id desc')->column('id,name', 'id');

        $this->app->db->name($this->table)->fieldRaw('category_id,count(1) total')->where(['is_deleted' => 0, 'status' => 1])->group('category_id')->select()->map(function ($vo) {
            if (isset($this->clist[$vo['category_id']])) {
                $this->clist[$vo['category_id']]['total'] = $vo['total'];
            }
        });

        $first = current($this->clist);

        $this->category_id = input('category_id', $first ? $first['id'] : '');

        // 账号列表查询
        $query = $this->_query($this->table);

        // 列表选项卡
        if (is_numeric($this->category_id)) $query->where(['category_id' => $this->category_id]);

        $query->where(['is_deleted' => 0])->order('sort desc,id desc')->page(false);
    }

    // public function index()
    // {
    //     $this->title = "账号管理";
    //     $query = $this->_query($this->table)->like('name')->dateBetween('create_at');
    //     $query->equal('status')->where(['is_deleted' => 0])->order('sort desc,id desc')->page(false);
    // }

    /**
     * 添加账号
     * @auth true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function add()
    {
        $this->title = '添加账号';
        $this->_form($this->table, 'form');
    }

    /**
     * 编辑账号
     * @auth true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function edit()
    {
        $this->title = '编辑账号';
        $this->_form($this->table, 'form');
    }

    /**
     * 删除账号
     * @auth true
     * @throws \think\db\exception\DbException
     */
    public function remove()
    {
        $this->_delete($this->table);
    }

    /**
     * 修改账号状态
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
