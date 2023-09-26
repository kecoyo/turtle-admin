<?php

// +----------------------------------------------------------------------
// | Shop-Demo for ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2022~2023 Anyon <zoujingli@qq.com>
// +----------------------------------------------------------------------
// | 官方网站: https://thinkadmin.top
// +----------------------------------------------------------------------
// | 免责声明 ( https://thinkadmin.top/disclaimer )
// | 会员免费 ( https://thinkadmin.top/vip-introduce )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/ThinkAdmin
// | github 代码仓库：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

namespace app\data\service;

use app\data\model\DataUser;
use think\admin\Exception;
use think\admin\Service;

/**
 * 用户数据服务
 * Class UserService
 * @package app\data\service
 */
class UserService extends Service
{
    /**
     * 获取用户查询条件
     * @param string $field 认证字段
     * @param string $openid 用户OPENID值
     * @param string $unionid 用户UNIONID值
     * @return array
     */
    public static function getUserUniMap(string $field, string $openid, string $unionid = ''): array
    {
        if (!empty($unionid)) {
            [$map1, $map2] = [[['unionid', '=', $unionid]], [[$field, '=', $openid]]];
            if ($uuid = DataUser::mk()->whereOr([$map1, $map2])->value('id')) {
                return ['id' => $uuid];
            }
        }
        return [$field => $openid];
    }

    /**
     * 列表绑定用户数据
     * @param array $list 原数据列表
     * @param string $keys 用户UID字段
     * @param string $bind 绑定字段名称
     * @param string $cols 返回用户字段
     * @return array
     */
    public static function buildByUid(array &$list, string $keys = 'user_id', string $bind = 'user', string $cols = '*'): array
    {
        if (count($list) < 1) return $list;
        $uids = array_unique(array_column($list, $keys));
        $users = DataUser::mk()->whereIn('id', $uids)->column($cols, 'id');
        foreach ($list as &$vo) $vo[$bind] = $users[$vo[$keys]] ?? [];
        return $list;
    }
}