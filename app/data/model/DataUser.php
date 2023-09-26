<?php

namespace app\data\model;

use think\admin\Model;

/**
 * 账号类目模型
 * Class DataUser
 * @package app\data\model
 */
class DataUser extends Model
{

    /**
     * 格式化生日日期
     * @param string $value
     * @return string
     */
    public function getBirthdayAttr($value): string
    {
        return empty($value) ? '' : format_datetime($value, 'Y-m-d');
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