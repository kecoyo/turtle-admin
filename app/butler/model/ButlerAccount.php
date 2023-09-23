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
     * 格式化属性
     * @param mixed $value
     * @return mixed
     */
    public function getPropertiesAttr($value)
    {
        return empty($value) ? [] : json_decode($value, true);
    }

    /**
     * 格式化图片
     * @param mixed $value
     * @return mixed
     */
    public function getPicturesAttr($value)
    {
        return empty($value) ? [] : json_decode($value, true);
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