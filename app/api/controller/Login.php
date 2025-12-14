<?php
namespace app\api\controller;

use app\butler\model\ButlerUser;
use think\admin\Controller;
use think\admin\extend\JwtExtend;
use think\exception\HttpResponseException;

class Login extends Controller
{

    /**
     * 用户ID登录（测试用）
     * @return void
     */
    public function loginById()
    {
        try {
            $user_id = input('user_id');
            if (empty($user_id)) {
                $this->error('缺少user_id参数');
            }

            $user = ButlerUser::mk()->find($user_id);
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
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('登录失败：' . $e->getMessage());
        }
    }

    /**
     * 小程序授权登录
     * @return void
     */
    public function miniProgram()
    {
        try {
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
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('登录失败：' . $e->getMessage());
        }
    }

}

