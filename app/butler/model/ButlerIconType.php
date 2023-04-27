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
     * 格式化创建时间
     * @param string $value
     * @return string
     */
    public function getCreateAtAttr(string $value): string
    {
        return format_datetime($value);
    }
}