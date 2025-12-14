<?php

// +----------------------------------------------------------------------
// | Static Plugin for ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2023 ThinkAdmin [ thinkadmin.top ]
// +----------------------------------------------------------------------
// | 官方网站: https://thinkadmin.top
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// | 免责声明 ( https://thinkadmin.top/disclaimer )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/think-plugs-static
// | github 代码仓库：https://github.com/zoujingli/think-plugs-static
// +----------------------------------------------------------------------

namespace app\index\controller;

use app\butler\model\ButlerUser;
use think\admin\Controller;
use think\admin\extend\JwtExtend;

class Login extends Controller
{

    /**
     * 根据用户ID登录（测试用）
     * @return void
     */
    public function loginById()
    {
        $userId = input('user_id');
        if (empty($userId)) {
            $this->error('缺少user_id参数');
        }

        $user = ButlerUser::mk()->find($userId);
        if ($user->isEmpty()) {
            $this->error('用户不存在');
        }

        // 生成JWT token
        $payload = [
            'iss' => 'turtle-admin',
            'aud' => 'test-login',
            'iat' => time(),
            'exp' => time() + 3600 * 24 * 7, // 7天过期
            'user_id' => $user['id'],
            'openid' => $user['openid'] ?? '',
        ];

        $token = JwtExtend::token($payload);

        $this->success('登录成功', [
            'token' => $token,
            'user' => [
                'id' => $user['id'],
                'nickname' => $user['nickname'],
                'avatar' => $user['avatar'],
            ]
        ]);
    }

    /**
     * 小程序授权登录
     * @return void
     */
    public function mini()
    {
        // try {
            $code = input('code');
            if (empty($code)) {
                $this->error('缺少code参数');
            }

            // 使用微信小程序API获取openid
            $config = [
                'appid' => 'wxd37ee325ea6b530c',
                'appsecret' => 'ed1342031ce03f72feba69b3829ae42c',
            ];

            $weMini = new \WeMini\Crypt($config);
            $result = $weMini->session($code);

            if (isset($result['errcode'])) {
                $this->error('微信授权失败：' . $result['errmsg']);
            }

            $openid = $result['openid'];

            // 检查用户是否存在
            $user = ButlerUser::mk()->where(['openid' => $openid])->find();

            if ($user->isEmpty()) {
                // 创建新用户
                $user = ButlerUser::mk()->create([
                    'openid' => $openid,
                    'nickname' => '微信用户',
                    'create_at' => date('Y-m-d H:i:s'),
                ]);
            }

            // 生成JWT token
            $payload = [
                'iss' => 'turtle-admin',
                'aud' => 'mini-program',
                'iat' => time(),
                'exp' => time() + 3600 * 24 * 7, // 7天过期
                'user_id' => $user['id'],
                'openid' => $openid,
            ];

            $token = JwtExtend::token($payload);

            $this->success('登录成功', [
                'token' => $token,
                'user' => [
                    'id' => $user['id'],
                    'nickname' => $user['nickname'],
                    'avatar' => $user['avatar'],
                ]
            ]);

        // } catch (\Exception $e) {
        //     $this->error('登录失败：' . $e->getMessage());
        // }
    }

    /**
     * 获取用户信息
     * @return void
     */
    public function userInfo()
    {
        // try {
            $token = $this->app->request->header('Authorization');
            if (empty($token)) {
                $this->error('缺少token');
            }

            // 移除Bearer前缀
            if (strpos($token, 'Bearer ') === 0) {
                $token = substr($token, 7);
            }

            // 验证token
            $decoded = JwtExtend::verify($token);

            $userId = $decoded['user_id'] ?? null;

            $user = ButlerUser::mk()->find($userId);
            if ($user->isEmpty()) {
                $this->error('用户不存在');
            }

            $this->success('获取成功', [
                'user' => [
                    'id' => $user['id'],
                    'nickname' => $user['nickname'],
                    'avatar' => $user['avatar'],
                    'birthday' => $user['birthday'],
                    'gender' => $user['gender'],
                    'phone' => $user['phone'],
                ]
            ]);

        // } catch (\Exception $e) {
        //     $this->error('获取失败：' . $e->getMessage());
        // }
    }

}
