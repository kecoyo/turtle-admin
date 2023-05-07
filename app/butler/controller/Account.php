<?php

namespace app\butler\controller;

use app\butler\model\ButlerAccount;
use app\butler\model\ButlerCategory;
use think\admin\Controller;
use think\admin\extend\DataExtend;
use think\admin\helper\QueryHelper;

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
        ButlerAccount::mQuery()->layTable(function () {
            $this->title = '账号管理';

            // 账号类目分组
            [$ts, $ls] = [[], ButlerCategory::items()];
            foreach ($ls as $k => $v) $ts["{$v['id']}"] = ['id' => $v['id'], 'name' => $v['name'], 'count' => 0,];
            // 等级分组统计
            foreach (ButlerAccount::mk()->where(['is_deleted' => 0])->field('category_id,count(1) count')->group('category_id')->cursor() as $v) {
                [$name, $count] = ["{$v['category_id']}", $v['count']];
                if (isset($ts[$name])) {
                    $ts[$name]['count'] += $count;
                }
            }
            $this->total = $ts;
            $this->category_id = $this->get['category_id'] ?? (array_keys($ts)[0] ?? '-');
        }, function (QueryHelper $query) {
            $query->where(['is_deleted' => 0]);
            $query->like('name,remark')->equal('category_id,status')->dateBetween('create_at')->order('sort asc,id desc');
        });
    }

    /**
     * 添加账号
     * @auth true
     */
    public function add()
    {
        ButlerAccount::mForm('form');
    }

    /**
     * 编辑账号
     * @auth true
     */
    public function edit()
    {
        ButlerAccount::mForm('form');
    }

    /**
     * 表单数据处理
     * @param array $data
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
     * 修改账号
     * @auth true
     */
    public function state()
    {
        ButlerAccount::mSave($this->_vali([
            'status.in:0,1'  => '状态值范围异常！',
            'status.require' => '状态值不能为空！',
        ]));
    }

    /**
     * 删除账号
     * @auth true
     */
    public function remove()
    {
        ButlerAccount::mDelete();
    }

    /**
     * 修改账号分类
     * @auth true
     */
    public function move()
    {
        ButlerAccount::mForm('form');
    }

    /**
     * 表单数据处理
     * @param array $data
     */
    protected function _move_form_filter(array &$data)
    {
        if ($this->request->isGet()) {
            $this->clist = ButlerCategory::mk()->where(['is_deleted' => 0, 'status' => 1])->order('sort asc,id desc')->select()->toArray();
            $this->category_id = input('category_id', '0');
            $this->ids = input('id', '');
        } else {
            $to_category_id = input('to_category_id', '0');
            $ids = str2arr(input('ids', ''));

            if (!$to_category_id) {
                $this->error('请选择目标分类！');
            }

            $result = ButlerAccount::mk()->where('id', 'in', $ids)->update([
                'category_id'  => $to_category_id,
            ]);

            if ($result !== false) {
                $this->success('移动账号成功！');
            } else {
                $this->error('移动账号失败！');
            }
        }
    }
}
