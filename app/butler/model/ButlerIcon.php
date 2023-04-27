<?php

namespace app\butler\model;

use think\admin\Model;

/**
 * 图标模型
 * Class ButlerIcon
 * @package app\butler\model
 */
class ButlerIcon extends Model
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