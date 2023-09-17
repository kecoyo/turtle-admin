<?php

// +----------------------------------------------------------------------
// | Admin Plugin for ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2023 ThinkAdmin [ thinkadmin.top ]
// +----------------------------------------------------------------------
// | 官方网站: https://thinkadmin.top
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// | 免责声明 ( https://thinkadmin.top/disclaimer )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/think-plugs-admin
// | github 代码仓库：https://github.com/zoujingli/think-plugs-admin
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\admin\Controller;
use think\admin\helper\QueryHelper;
use think\admin\service\AdminService;
use think\admin\Storage;
use app\admin\model\SystemApp;

/**
 * 系统应用管理
 * @class App
 * @package app\admin\controller
 */
class App extends Controller
{
    /**
     * 存储类型
     * @var array
     */
    protected $types;

    /**
     * 控制器初始化
     * @return void
     */
    protected function initialize()
    {
        $this->types = Storage::types();
    }

    /**
     * 系统应用管理
     * @auth true
     * @menu true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index()
    {
        SystemApp::mQuery()->layTable(function () {
            $this->title = '系统应用管理';
        }, function (QueryHelper $query) {
            $query->like('name,remark')->where(['deleted' => 0]);
        });
    }

    /**
     * 编辑系统应用
     * @auth true
     * @return void
     */
    public function edit()
    {
        SystemApp::mForm('form');
    }

    /**
     * 删除系统应用
     * @auth true
     * @return void
     */
    public function remove()
    {
        SystemApp::mDelete();
    }

    /**
     * 修改数据状态
     * @auth true
     */
    public function state()
    {
        SystemApp::mSave($this->_vali([
            'status.in:0,1'  => '状态值范围异常！',
            'status.require' => '状态值不能为空！',
        ]));
    }
}