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
                ->field('id,nickname,avatar,birthday,gender,phone,email,remark,province,city,county,create_at')
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

    /**
     * 更新用户信息
     * @return void
     */
    public function update()
    {
        $user_id = $this->requireAuth();

        try {
            $data = input('post.');
            
            // 获取当前用户信息
            $user = ButlerUser::mk()->where(['id' => $user_id])->find();
            if ($user->isEmpty()) {
                $this->error('用户不存在');
            }
            
            // 允许更新的字段
            $fieldMap = [
                'nickname' => 'nickname',
                'avatar' => 'avatar',
                'gender' => 'gender',
                'birthday' => 'birthday',
                'email' => 'email',
                'remark' => 'remark',
                'province' => 'province',
                'city' => 'city',
                'county' => 'county',
            ];
            
            $updateData = [];
            
            foreach ($fieldMap as $frontendField => $backendField) {
                if (isset($data[$frontendField])) {
                    // 处理头像URL（移除完整URL，只保留相对路径）
                    if ($frontendField === 'avatar' && !empty($data[$frontendField])) {
                        $updateData[$backendField] = remove_res_url($data[$frontendField]);
                    } 
                    // 处理生日字段
                    elseif ($frontendField === 'birthday' && !empty($data[$frontendField])) {
                        $updateData[$backendField] = $data[$frontendField];
                    }
                    // 其他字段直接更新
                    else {
                        $updateData[$backendField] = $data[$frontendField];
                    }
                }
            }

            if (empty($updateData)) {
                $this->error('没有需要更新的数据');
            }

            // 更新用户信息
            $user->save($updateData);

            // 返回更新后的用户信息
            $updatedUser = ButlerUser::mk()
                ->where(['id' => $user_id])
                ->field('id,nickname,avatar,birthday,gender,phone,email,remark,province,city,county,create_at')
                ->find();

            $userData = $updatedUser->toArray();

            // 处理头像URL
            if (!empty($userData['avatar'])) {
                $userData['avatar'] = res_url() . $userData['avatar'];
            }

            $this->success('更新成功', $userData);
        } catch (HttpResponseException $e) {
            throw $e;
        } catch (\Exception $e) {
            $this->error('更新失败：' . $e->getMessage());
        }
    }
}

