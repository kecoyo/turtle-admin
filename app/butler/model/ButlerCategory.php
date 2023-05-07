<?php

namespace app\butler\model;

use think\admin\Model;

/**
 * 账号类目模型
 * Class ButlerCategory
 * @package app\butler\model
 */
class ButlerCategory extends Model
{

    /**
     * 获取账号数据
     * @return array
     */
    public static function items(): array
    {
        $query = static::mk()->where(['status' => 1, 'is_deleted' => 0]);
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