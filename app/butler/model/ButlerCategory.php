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
    public static function items($user_id): array
    {
        $query = static::mk()->where(['status' => 1, 'deleted' => 0, 'user_id' => $user_id]);
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