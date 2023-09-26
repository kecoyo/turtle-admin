<?php

namespace app\butler\controller;

use app\butler\model\ButlerAccount;
use app\butler\model\ButlerCategory;
use app\butler\model\ButlerIcon;
use app\data\service\UserService;
use think\admin\Controller;
use think\admin\extend\DataExtend;
use think\admin\helper\QueryHelper;
use think\facade\Config;

/**
 * 账号管理
 * Class Account
 * @package app\butler\controller
 */
class Account extends Controller
{
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
            $this->user_id = input('user_id', '1');

            // 账号类目分组
            [$ts, $ls] = [[], ButlerCategory::items($this->user_id)];
            foreach ($ls as $k => $v) $ts["{$v['id']}"] = ['id' => $v['id'], 'name' => $v['name'], 'count' => 0,];
            // 等级分组统计
            foreach (ButlerAccount::mk()->where(['deleted' => 0, 'user_id' => $this->user_id])->field('category_id,count(1) count')->group('category_id')->cursor() as $v) {
                [$name, $count] = ["{$v['category_id']}", $v['count']];
                if (isset($ts[$name])) {
                    $ts[$name]['count'] += $count;
                }
            }
            $this->total = $ts;
            $this->category_id = $this->get['category_id'] ?? (array_keys($ts)[0] ?? '-');
        }, function (QueryHelper $query) {
            $user_id = input('user_id', '1');
            $query->where(['deleted' => 0, 'user_id' => $user_id]);
            $query->like('name,remark')->equal('category_id,status')->dateBetween('create_at')->order('sort asc,id desc');
        });
    }

    /**
     * 数据列表处理
     * @param array $data
     */
    protected function _index_page_filter(array &$data)
    {
        UserService::buildByUid($data);
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
                $data['user_id'] = input('user_id', '1');
                $data['category_id'] = intval($data['category_id'] ?? input('category_id', '0'));

                $butler_icon = ButlerIcon::mk()->where(['deleted' => 0, 'status' => 1])->order('id asc')->find();
                if (!empty($butler_icon)) {
                    $data['icon'] = $butler_icon['url'];
                }

                $data['properties_str'] = '[{"name":"账号","value":"kecoyo"}]';
                $data['pictures_str'] = '';
            } else {
                $data['properties_str'] = json_encode($data['properties'], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
                $data['pictures_str'] = '';

                if (isset($data['pictures'])) {
                    $urls = [];
                    foreach ($data['pictures'] as $picture) {
                        $urls[] = Config::get('app.upload_base_url').$picture['url'];
                    }
                    $data['pictures_str'] = implode("|", $urls);
                }
            }
        } else {
            $data['icon'] = str_replace(Config::get('app.upload_base_url'), '', $data['icon']);

            // 数据转换
            if ($data['pictures']) {
                $pictures = [];
                $urls = explode("|", $data['pictures']);
                foreach ($urls as $url) {
                    $pictures[] = ['url' => str_replace(Config::get('app.upload_base_url'), '', $url)];
                }
                $data['pictures'] = json_encode($pictures, JSON_UNESCAPED_SLASHES);
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
        ButlerAccount::mForm('move');
    }

    /**
     * 表单数据处理
     * @param array $data
     */
    protected function _move_form_filter(array &$data)
    {
        if ($this->request->isGet()) {
            $this->user_id = input('user_id', '1');
            $this->clist = ButlerCategory::mk()->where(['deleted' => 0, 'status' => 1, 'user_id' => $this->user_id])->order('sort asc,id desc')->select()->toArray();
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
