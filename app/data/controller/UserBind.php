<?php

namespace app\data\controller;

use app\data\model\DataUserBind;
use think\admin\Controller;
use think\admin\helper\QueryHelper;
use think\facade\Config;

/**
 * 用户绑定管理
 * Class UserBind
 * @package app\data\controller
 */
class UserBind extends Controller
{
    /**
     * 用户绑定管理
     * @auth true
     * @menu true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index()
    {
        DataUserBind::mQuery()->layTable(function () {
            $this->title = '用户绑定管理';
        }, function (QueryHelper $query) {
            $query->where(['deleted' => 0]);
            $query->like('openid|unionid#openid')->equal('app_id,user_id,status')->dateBetween('create_at')->order('id desc');
        });
    }

    /**
     * 编辑用户绑定
     * @auth true
     */
    public function edit()
    {
        DataUserBind::mForm('form');
    }

    /**
     * 修改用户绑定状态
     * @auth true
     */
    public function state()
    {
        DataUserBind::mSave($this->_vali([
            'status.in:0,1'  => '状态值范围异常！',
            'status.require' => '状态值不能为空！',
        ]));
    }

    /**
     * 删除用户绑定
     * @auth true
     */
    public function remove()
    {
        DataUserBind::mDelete();
    }
}
