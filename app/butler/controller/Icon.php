<?php

namespace app\butler\controller;

use app\butler\model\ButlerIcon;
use app\butler\model\ButlerIconType;
use think\admin\Controller;
use think\admin\helper\QueryHelper;
use think\exception\HttpResponseException;
use think\facade\Config;

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
         // 账号类目分组
         [$ts, $ls] = [[], ButlerIconType::items()];
         foreach ($ls as $k => $v) $ts["{$v['id']}"] = ['id' => $v['id'], 'name' => $v['name'], 'count' => 0,];
         // 图标分类统计
         foreach (ButlerIcon::mk()->where(['deleted' => 0])->field('type_id,count(1) count')->group('type_id')->cursor() as $v) {
             [$name, $count] = ["{$v['type_id']}", $v['count']];
             if (isset($ts[$name])) {
                 $ts[$name]['count'] += $count;
             }
         }
         $this->total = $ts;

         // 设置页面标题
         $this->title = '图标管理';

         // 创建查询对象
         $query = ButlerIcon::mQuery();

         // 数据筛选选项
         $this->type_id = ltrim(input('type_id', array_keys($ts)[0]), '');
         if (is_numeric($this->type_id)) {
             $query->where(['type_id' => $this->type_id]);
         }

         // 数据查询
         $query->where(['deleted' => 0])->order('sort asc,id desc')->page(false);

    }

    /**
     * 添加图标分类
     * @auth true
     */
    public function add()
    {
        $this->title = '添加图标';
        ButlerIcon::mForm('form');
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
                    'url'       => str_replace(Config::get('app.upload_base_url'), '', $url),
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
     */
    public function remove()
    {
        ButlerIcon::mDelete();
    }
}
