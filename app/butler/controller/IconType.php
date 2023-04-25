<?php

namespace app\butler\controller;

use think\admin\Controller;
use think\admin\extend\DataExtend;

/**
 * 图标分类管理
 * Class IconType
 * @package app\butler\controller
 */
class IconType extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    private $table = 'ButlerIconType';

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
        $this->title = "图标分类管理";
        $query = $this->_query($this->table)->like('name')->dateBetween('create_at');
        $query->equal('status')->where(['is_deleted' => 0])->order('sort asc,id desc')->page(false);
    }

    /**
     * 添加图标分类
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
     * 编辑图标分类
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
     * 删除图标分类
     * @auth true
     * @throws \think\db\exception\DbException
     */
    public function remove()
    {
        $this->_delete($this->table);
    }

    /**
     * 修改图标分类状态
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

    /**
     * 修改图标分类顺序
     * @auth true
     * @throws \think\db\exception\DbException
     */
    public function sort()
    {
        $id = intval($this->app->request->post('id', 0));
        $sort = intval($this->app->request->post('sort', 0));

        if (!$id || !$sort) {
            $this->error(lang('think_library_sort_error'));
        }

        // 账号列表
        $list = $this->app->db->name($this->table)->where(['is_deleted' => 0])->order('sort asc,id desc')->select()->toArray();

        // 查找原位置
        $index = array_search($id, array_column($list, 'id'));

        // 数组排序
        array_splice($list, $sort - 1, 0, array_splice($list, $index, 1));

        // 修改有变化排序号
        foreach ($list as $key => $vo) {
            $new_sort = $key + 1;
            if ($new_sort !== $vo['sort']) {
                $this->app->db->name($this->table)->where(['id' => $vo['id']])->update(['sort' => $new_sort]);
            }
        }

        $this->success(lang('think_library_sort_success'));
    }
}
