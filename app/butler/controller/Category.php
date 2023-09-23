<?php

namespace app\butler\controller;

use app\butler\model\ButlerCategory;
use app\butler\model\ButlerIcon;
use app\data\service\UserAdminService;
use think\admin\Controller;
use think\admin\helper\QueryHelper;
use think\facade\Config;

/**
 * 账号分类管理
 * Class Category
 * @package app\butler\controller
 */
class Category extends Controller
{
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
        ButlerCategory::mQuery()->layTable(function () {
            $this->title = '账号分类管理';
            $this->user_id = input('user_id', '1');
        }, function (QueryHelper $query) {
            $query->where(['deleted' => 0, 'user_id' => input('user_id', '1')]);
            $query->like('name,remark')->equal('status')->dateBetween('create_at')->order('sort asc,id desc');
        });
    }

    /**
     * 数据列表处理
     * @param array $data
     */
    protected function _index_page_filter(array &$data)
    {
        UserAdminService::buildByUid($data);
    }

    /**
     * 添加账号分类
     * @auth true
     */
    public function add()
    {
        ButlerCategory::mForm('form');
    }

    /**
     * 编辑账号分类
     * @auth true
     */
    public function edit()
    {
        ButlerCategory::mForm('form');
    }

    /**
     * 表单数据处理
     * @param array $data
     */
    protected function _form_filter(array &$data)
    {
        if ($this->request->isGet()) {
            $data['user_id'] = input('user_id', '1');
            // if (!isset($data['id'])) {
            //     $iconInfo = ButlerIcon::mk()->where(['deleted' => 0, 'status' => 1])->order('sort desc,id desc')->find();
            //     if (!empty($iconInfo)) {
            //         $data['icon'] = $iconInfo['url'];
            //     }
            // }
        } else {
            $data['icon'] = str_replace(Config::get('app.upload_base_url'), '', $data['icon']);
        }
    }

    /**
     * 修改账号分类状态
     * @auth true
     */
    public function state()
    {
        ButlerCategory::mSave($this->_vali([
            'status.in:0,1'  => '状态值范围异常！',
            'status.require' => '状态值不能为空！',
        ]));
    }

    /**
     * 删除账号分类
     * @auth true
     */
    public function remove()
    {
        ButlerCategory::mDelete();
    }
}
