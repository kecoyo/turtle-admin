<?php

namespace app\butler\controller;

use think\admin\Controller;
use think\exception\HttpResponseException;

/**
 * 图标管理
 * Class Icon
 * @package app\butler\controller
 */
class Icon extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    private $table = 'ButlerIcon';

    /**
     * 图标管理
     * @auth true
     * @menu true
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index()
    {
        $this->title = '图标管理';
        // 分类数据统计

        $this->clist = $this->app->db->name('ButlerIconType')->where(['is_deleted' => 0])->order('sort asc,id desc')->column('id,name', 'id');

        $this->app->db->name($this->table)->fieldRaw('type_id,count(1) total')->where(['is_deleted' => 0, 'status' => 1])->group('type_id')->select()->map(function ($vo) {
            if (isset($this->clist[$vo['type_id']])) {
                $this->clist[$vo['type_id']]['total'] = $vo['total'];
            }
        });

        $first = current($this->clist);

        $this->type_id = input('type_id', $first ? $first['id'] : '');

        $this->img_url = 'http://cdn.kecoyo.com/';

        // 订单列表查询
        $query = $this->_query($this->table);

        // 列表选项卡
        if (is_numeric($this->type_id)) $query->where(['type_id' => $this->type_id]);

        $query->where(['is_deleted' => 0])->order('sort asc,id desc')->page(false);
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
        $this->title = '添加图标';
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
            $data['type_id'] = intval($data['type_id'] ?? input('type_id', '0'));
        } elseif ($this->request->isPost()) {
            if (empty($data['urls'])) $this->error('图标不能为空！');
            // 图标保存
            $urls = explode('|', $data['urls']);
            $result = true;

            foreach ($urls as $url) {
                $result = data_save('ButlerIcon', [
                    'type_id'   => $data['type_id'],
                    'url'       => $url,
                ]);
                if ($result === false) break;
            }

            if ($result !== false) {
                $this->success(lang('think_library_form_success'), 'javascript:history.back()');
            } else {
                $this->error(lang('think_library_form_error'));
            }
            return false;
        }
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
}
