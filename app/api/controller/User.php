<?php
namespace app\api\controller;

use app\butler\model\ButlerUser;
use think\exception\HttpResponseException;

class User extends Base
{
    /**
     * 获取用户信息
     * @return void
     */
    public function info()
    {
        $user_id = $this->requireAuth();

        try {
            $user = ButlerUser::mk()
                ->where(['id' => $user_id])
                ->field('id,nickname,avatar,birthday,gender,phone,create_at')
                ->find();

            if ($user->isEmpty()) {
                $this->error('用户不存在');
            }

            $userData = $user->toArray();

            // 处理头像URL
            if (!empty($userData['avatar'])) {
                $userData['avatar'] = res_url() . $userData['avatar'];
            }

            $this->success('获取成功', $userData);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('获取失败：' . $e->getMessage());
        }
    }
}

