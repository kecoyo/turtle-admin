## 大道至简 · 原生框架

### 项目介绍

**ThinkAdmin** 是一款遵循 **MIT** 协议开源的快速开发框架，基于最新版本 **ThinkPHP6** 的极简后台管理系统，在使用 **ThinkAdmin** 前请认真阅读[《免责声明》](https://thinkadmin.top/disclaimer)并同意该声明。


## 系统安装

下载并进入 **ThinkAdmin** 根目录，运行指令安装依赖组件。

打开命令行窗口（ Windows 用户 ）或控制台（ Linux 和 Mac 用户 ）并执行如下命令：

**1. 通过 Composer 安装：**( 推荐方式，仅安装 admin 模块 )

```shell
### 创建项目（ 需要在英文目录下面执行 ）
composer create-project zoujingli/thinkadmin

### 进入项目根目录
cd thinkadmin

### 数据库初始化并安装 
### 默认使用 Sqlite 数据库，若使用其他数据库请修改配置后再执行
php think migrate:run

### 开启PHP内置WEB服务
### 默认后台登录账号及密码都是 admin
php think run --host 127.0.0.1
```

**2. 通过源码安装：**（ 安装 admin、wechat、data 三个模块 ）

```shell
### 下载项目（ 需要在英文目录下面执行 ）
git clone https://github.com/zoujingli/ThinkAdmin

### 进入项目根目录
cd ThinkAdmin

### 安装项目依赖组件
composer install --optimize-autoloader

### 数据库初始化并安装
### 默认使用 Sqlite 数据库，若使用其他数据库请修改配置后再执行
php think migrate:run

### 开启PHP内置WEB服务
### 默认后台登录账号及密码都是 admin
php think run --host 127.0.0.1
```

## 数据库安装

1. 创建空的数据库并将参数配置到 **config/database.php** 文件；
2. 导入数据库 **SQL** 文件或执行数据库初始化操作，视版本情况操作；

**温馨提示：** 当前下载的代码已经是 **v6.1** 版本！

* 版本是 **v6.0** 的项目需要导入项目根目录下的 `SQL01-数据表结构.sql` 和 `SQL02-数据初始化.sql` 文件；
* 版本是 **v6.1** 的项目不需要导入数据库 `SQL` 文件，修改数据库配置后执行 `php think migrate:run` 即可；

## 注解权限

注解权限是指通过方法注释来实现后台 **RBAC** 授权管理，用注解来管理功能节点。

开发人员只需要写好注释，会自动生成功能的节点，只需要配置角色及用户就可以使用 **RBAC** 权限。

* 此版本的权限使用注解实现
* 注释必须是标准的块注释，案例如下展示
* 其中 `@auth true` 表示访问需要权限验证
* 其中 `@menu true` 菜单编辑显示可选节点
* 其中 `@login true` 需要强制登录才可访问

```php
/**
 * 操作的名称
 * @auth true  # 表示访问需要权限验证
 * @menu true  # 菜单编辑显示可选节点
 * @login true # 需要强制登录才可访问 
 */
public function index(){
   // @todo
}
```

## 框架指令

* 执行 `php think run` 启用本地开发环境，访问 `http://127.0.0.1:8000`
* 执行 `php think xadmin:package` 将现有 `MySQL` 数据库打包为 `Phinx` 数据库脚本
* 执行 `php think xadmin:sysmenu` 重写系统菜单并生成新编号，同时会清理已禁用的菜单数据
* 执行 `php think xadmin:fansall` 同步微信粉丝数据，依赖于 `ThinkPlugsWechat` 应用插件
* 执行 `php think xadmin:replace` 可以批量替换数据库指定字符字段内容，通常用于文件地址替换
* 执行 `php think xadmin:database` 对数据库的所有表 `repair|optimize` 操作，优化并整理数据库碎片
* 执行 `php think xadmin:publish` 可自动安装现在模块或已安装应用插件，增加 `--migrate` 参数执行数据库脚本

#### 1. 守护进程管理（可自建定时任务去守护监听主进程）

* 执行 `php think xadmin:queue listen` [监听]启动异步任务监听服务
* 执行 `php think xadmin:queue start`  [控制]检查创建任务监听服务（建议定时任务执行）
* 执行 `php think xadmin:queue query`  [控制]查询当前任务相关的进程
* 执行 `php think xadmin:queue status`  [控制]查看异步任务监听状态
* 执行 `php think xadmin:queue stop`   [控制]平滑停止所有任务进程

#### 2. 本地调试管理（可自建定时任务去守护监听主进程）

* 执行 `php think xadmin:queue webstop` [调试]停止本地调试服务
* 执行 `php think xadmin:queue webstart` [调试]开启本地调试服务（建议定时任务执行）
* 执行 `php think xadmin:queue webstatus` [调试]查看本地调试状态
