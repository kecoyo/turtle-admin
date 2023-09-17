<?php

namespace app\butler\model;

use think\admin\Model;

/**
 * 图标分类模型
 * Class ButlerIconType
 * @package app\butler\model
 */
class ButlerIconType extends Model
{
    /**
     * 获取图标数据
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function items(): array
    {
        $query = static::mk()->where(['status' => 1, 'deleted' => 0]);
        return $query->field('id,name')->order('sort asc,id desc')->select()->toArray();
    }

    /**
     * 格式化创建时间
     * @param string $value
     * @return string
     */
    public function getCreateAtAttr(string $value): string
    {
        return format_datetime($value);
    }
}