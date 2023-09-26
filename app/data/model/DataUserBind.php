<?php

namespace app\data\model;

use think\admin\Model;

/**
 * 用户绑定模型
 * Class DataUserBind
 * @package app\data\model
 */
class DataUserBind extends Model
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