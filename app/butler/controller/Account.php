<?php

namespace app\butler\controller;

use app\butler\model\ButlerAccount;
use app\butler\model\ButlerCategory;
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
        /*
        $this->title = '账号管理';

        // 分类列表
        $this->clist = $this->app->db->name('ButlerCategory')->where(['is_deleted' => 0])->order('sort asc,id desc')->column('id,name', 'id');
        // 统计分类账号个数
        $this->app->db->name($this->table)->fieldRaw('category_id,count(1) total')->where(['is_deleted' => 0])->group('category_id')->select()->map(function ($vo) {
            if (isset($this->clist[$vo['category_id']])) {
                $this->clist[$vo['category_id']]['total'] = $vo['total'];
            }
        });

        // 默认选中第一个分类
        $first = current($this->clist);
        $this->category_id = input('category_id', $first ? $first['id'] : '');

        // 账号列表
        $this->list = $this->app->db->name($this->table)->where(['is_deleted' => 0, 'category_id' => $this->category_id])->order('sort asc,id desc')->select()->toArray();

        foreach ($this->list as &$vo) {
            // 是否有图片
            $pictures = str2arr($vo['pictures'] ?? '', '|');
            $vo['picture_num'] = count($pictures);
            // 显示第一个属性
            $properties = json_decode($vo['properties'] ?? '[]', true);
            $vo['first_property'] = current($properties);
        }

        $this->fetch();
        */

        // 账号类目分组
        [$ts, $ls] = [[], ButlerCategory::items()];
        foreach ($ls as $k => $v) $ts["t{$v['id']}"] = ['id' => $v['id'], 'name' => $v['name'], 'count' => 0,];
        // 等级分组统计
        foreach (ButlerAccount::mk()->field('category_id,count(1) count')->group('category_id')->cursor() as $v) {
            [$name, $count] = ["t{$v['category_id']}", $v['count']];
            if (isset($ts[$name])) {
                $ts[$name]['count'] += $count;
            }
        }
        $this->total = $ts;

        // 设置页面标题
        $this->title = '账号管理';

        // 创建查询对象
        $query = ButlerAccount::mQuery();

        // 数据筛选选项
        $this->type = ltrim(input('type', 'ta'), 't');
        if (is_numeric($this->type)) $query->where(['category_id' => $this->type]);
        elseif ($this->type === 'o') $query->whereNotIn('category_id', array_keys($ls));

        // 数据查询分页
        $query->where(['is_deleted' => 0])->like('name,remark')->dateBetween('create_at')->order('id desc')->page();
    }

    /**
     * 添加账号
     * @auth true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function add()
    {
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
        $this->_form($this->table, 'form');
    }

    /**
     * 表单数据处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function _form_filter(array &$data)
    {
        if ($this->request->isGet()) {
            if (!isset($data['id'])) {
                $data['category_id'] = intval($data['category_id'] ?? input('category_id', '0'));
                $data['icon'] = '//cdn.kecoyo.com/upload/butler_icon/60/73c09bbc4f2b3c0bbef121c216bb96.png';
                $data['properties'] = '[{"name":"账号","value":"kecoyo"}]';
            }
        }
    }

    /**
     * 修改账号分类
     * @auth true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function move()
    {
        $this->_form($this->table, 'move');
    }

    /**
     * 表单数据处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function _move_form_filter(array &$data)
    {
        if ($this->request->isPost()) {
            $to_category_id = input('to_category_id', '0');
            $ids = str2arr(input('id', ''));

            if (!$to_category_id) {
                $this->error('请选择目标分类！');
            }

            $result = $this->app->db->name('ButlerAccount')->where('id', 'in', $ids)->update([
                'category_id'  => $to_category_id,
            ]);

            if ($result !== false) {
                $this->success(lang('think_library_form_success'));
            } else {
                $this->error(lang('think_library_form_error'));
            }
        } else {
            $this->clist = $this->app->db->name('ButlerCategory')->where(['is_deleted' => 0, 'status' => 1])->order('sort asc,id desc')->select()->toArray();
            $this->category_id = input('category_id', '0');
        }
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

    /**
     * 调整账号顺序
     * @auth true
     * @throws \think\db\exception\DbException
     */
    public function sort()
    {
        $category_id = intval($this->app->request->post('category_id', 0));
        $id = intval($this->app->request->post('id', 0));
        $sort = intval($this->app->request->post('sort', 0));

        if (!$category_id || !$id || !$sort) {
            $this->error(lang('think_library_sort_error'));
        }

        // 账号列表
        $list = $this->app->db->name($this->table)->where(['is_deleted' => 0, 'category_id' => $category_id])->order('sort asc,id desc')->select()->toArray();

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
