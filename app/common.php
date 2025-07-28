<?php

use think\Collection;
use think\Request;


if (!function_exists('res_url')) {

    /**
     * 获取资源访问域名
     * @return string
     */
    function res_url()
    {
        $type = sysconf('storage.type');
        if ($type === 'local') {
            return request()->scheme() . '://' . request()->host() . '/';
        } elseif ($type === 'alioss') {
            return sysconf('storage.alioss_http_protocol') . '://' . sysconf('storage.alioss_http_domain') . '/';
        }
        return "";
    }
}

if (!function_exists('remove_res_url')) {

    /**
     * 删除资源访问域名前缀
     * @param string $url
     * @return string
     */
    function remove_res_url($url)
    {
        $baseUrl = res_url();
        if (strpos($url, $baseUrl) === 0) {
            return substr($url, strlen($baseUrl));
        }
        return $url;
    }

}
