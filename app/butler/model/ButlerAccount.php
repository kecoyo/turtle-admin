<?php

namespace app\butler\model;

use think\admin\Model;

/**
 * 账号模型
 * Class ButlerAccount
 * @package app\butler\model
 */
class ButlerAccount extends Model
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