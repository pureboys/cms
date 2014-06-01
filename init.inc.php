<?php
//开启session
session_start();
header('Content-Type:text/html;charset=utf-8');
//模版根目录
define('ROOT_PATH', dirname(__FILE__));
//引入模版类
require ROOT_PATH . '/config/profile.inc.php';
//设置中国时区
date_default_timezone_set('Asia/Shanghai');
//自动加载类
function __autoload($_className)
{
    if (substr($_className, -6) == 'Action') {
        require ROOT_PATH . '/action/' . $_className . '.class.php';
    } elseif (substr($_className, -5) === 'Model') {
        require ROOT_PATH . '/model/' . $_className . '.class.php';
    } else {
        if(!file_exists(ROOT_PATH . '/includes/' . $_className . '.class.php') && $_className=='mysqli')
            exit('警告：服务器不支持mysqli');
        require ROOT_PATH . '/includes/' . $_className . '.class.php';
    }
}

//设置不缓存
$_cache = new Cache(array('code', 'ckeup', 'static', 'upload', 'register','feedback','cast','friendlink','search'));

//实例化模版类
$_tpl = new Templates($_cache);
//初始化
require 'common.inc.php';

