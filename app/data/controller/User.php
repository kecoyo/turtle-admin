<?php

namespace app\data\controller;

use app\data\model\DataUser;
use think\admin\Controller;
use think\admin\helper\QueryHelper;
use think\facade\Config;

/**
 * 用户管理
 * Class User
 * @package app\data\controller
 */
class User extends Controller
{
    /**
     * 用户管理
     * @auth true
     * @menu true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index()
    {
        DataUser::mQuery()->layTable(function () {
            $this->title = '用户管理';
        }, function (QueryHelper $query) {
            $query->where(['deleted' => 0]);
            $query->like('name|phone|username#username,remark')->equal('status')->dateBetween('create_at')->order('id desc');
        });
    }

    /**
     * 添加用户
     * @auth true
     */
    public function add()
    {
        DataUser::mForm('form');
    }

    /**
     * 编辑用户
     * @auth true
     */
    public function edit()
    {
        DataUser::mForm('form');
    }

    /**
     * 表单数据处理
     * @param array $data
     */
    protected function _form_filter(array &$data)
    {
        if ($this->request->isGet()) {
            // if (!isset($data['id'])) {
            //     $iconInfo = ButlerIcon::mk()->where(['deleted' => 0, 'status' => 1])->order('sort desc,id desc')->find();
            //     if (!empty($iconInfo)) {
            //         $data['icon'] = $iconInfo['url'];
            //     }
            // }
        } else {
            $data['avatar'] = str_replace(Config::get('app.upload_base_url'), '', $data['avatar']);
            $data['birthday'] = $data['birthday'] != '' ? $data['birthday'] : null;
        }
    }

    /**
     * 修改用户状态
     * @auth true
     */
    public function state()
    {
        DataUser::mSave($this->_vali([
            'status.in:0,1'  => '状态值范围异常！',
            'status.require' => '状态值不能为空！',
        ]));
    }

    /**
     * 删除用户
     * @auth true
     */
    public function remove()
    {
        DataUser::mDelete();
    }
}
