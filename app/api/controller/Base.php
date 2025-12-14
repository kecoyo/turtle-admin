<?php
namespace app\api\controller;

use think\admin\Controller;
use think\admin\extend\JwtExtend;
use think\exception\HttpResponseException;

/**
 * 前端接口基类控制器
 * 提供JWT验证和用户ID获取等公共方法
 * @class Base
 * @package app\api\controller
 */
class Base extends Controller
{
    /**
     * 当前登录用户ID
     * @var int|null
     */
    protected $user_id = null;

    /**
     * 当前登录用户的JWT数据
     * @var array|null
     */
    protected $jwtData = null;

    /**
     * 初始化方法
     * 可以在这里进行一些公共的初始化操作
     */
    protected function initialize()
    {
        parent::initialize();
    }

    /**
     * 获取JWT Token
     * @return string|null
     */
    protected function getToken()
    {
        $token = $this->app->request->header('Authorization');
        if (empty($token)) {
            return null;
        }

        // 移除Bearer前缀
        if (strpos($token, 'Bearer ') === 0) {
            $token = substr($token, 7);
        }

        return $token;
    }

    /**
     * 验证JWT Token并获取用户ID
     * @param bool $throwException 是否抛出异常，默认false返回null
     * @return int|null
     */
    protected function getUserId($throwException = false)
    {
        // 如果已经获取过，直接返回
        if ($this->user_id !== null) {
            return $this->user_id;
        }

        $token = $this->getToken();
        if (empty($token)) {
            if ($throwException) {
                $this->error('未登录，请先登录');
            }
            return null;
        }

        try {
            // 验证token
            $decoded = JwtExtend::verify($token);
            $this->jwtData = $decoded;
            $this->user_id = $decoded['user_id'] ?? null;

            if (empty($this->user_id) && $throwException) {
                $this->error('token无效，用户ID不存在');
            }

            return $this->user_id;
        } catch (\Exception $e) {
            if ($throwException) {
                $this->error('token验证失败：' . $e->getMessage());
            }
            return null;
        }
    }

    /**
     * 获取JWT数据（包含user_id、openid等）
     * @return array|null
     */
    protected function getJwtData()
    {
        if ($this->jwtData === null) {
            $this->getUserId();
        }
        return $this->jwtData;
    }

    /**
     * 要求必须登录（验证token，未登录则直接返回错误）
     * @return int 返回用户ID
     */
    protected function requireAuth()
    {
        $user_id = $this->getUserId(true);
        if (empty($user_id)) {
            $this->error('未登录或token无效');
        }
        return $user_id;
    }

    /**
     * 检查用户是否已登录
     * @return bool
     */
    protected function isLogin()
    {
        return $this->getUserId() !== null;
    }

    /**
     * 返回成功的操作（重写父类方法，将info改为msg）
     * @param mixed $msg 消息内容
     * @param mixed $data 返回数据
     * @param mixed $code 返回代码
     */
    public function success($msg, $data = '{-null-}', $code = 0): void
    {
        if ($data === '{-null-}') $data = new \stdClass();
        $result = ['code' => $code, 'msg' => $msg, 'data' => $data];
        if (JwtExtend::isRejwt()) $result['token'] = JwtExtend::token();
        throw new HttpResponseException(json($result));
    }

    /**
     * 返回失败的操作（重写父类方法，将info改为msg）
     * @param mixed $msg 消息内容
     * @param mixed $data 返回数据
     * @param mixed $code 返回代码
     */
    public function error($msg, $data = '{-null-}', $code = 1): void
    {
        if ($data === '{-null-}') $data = new \stdClass();
        throw new HttpResponseException(json([
            'code' => $code, 'msg' => $msg, 'data' => $data,
        ]));
    }

}

