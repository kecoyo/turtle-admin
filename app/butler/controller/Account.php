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
     * 移动账号
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
    protected function _form_filter(array &$data)
    {
        if ($this->request->action() === 'move') {
            if ($this->request->isGet()) {
                $this->category_id = input('category_id', '0');
                $this->account_ids = input('id', '');
                $this->clist = $this->app->db->name('ButlerCategory')->where(['is_deleted' => 0, 'status' => 1])->order('sort desc,id desc')->select()->toArray();
            } else {
                $category_id = input('category_id', '0');
                $account_ids_str = input('account_ids', '0');

                // 图标保存
                $account_ids = explode(',', $account_ids_str);
                $result = true;

                $result = $this->app->db->name('ButlerAccount')->where('id', 'in', $account_ids)->update([
                    'category_id'  => $category_id,
                ]);

                if ($result !== false) {
                    $this->success(lang('think_library_form_success'), 'javascript:history.back()');
                } else {
                    $this->error(lang('think_library_form_error'));
                }
                return false;
            }
        } else {
            if ($this->request->isGet()) {
                if (!isset($data['id'])) {
                    $data['category_id'] = intval($data['category_id'] ?? input('category_id', '0'));
                    $data['icon'] = '//cdn.kecoyo.com/upload/butler_icon/60/73c09bbc4f2b3c0bbef121c216bb96.png';
                    $data['properties'] = '[{"name":"账号","value":"kecoyo"}]';
                }
            }
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
}
