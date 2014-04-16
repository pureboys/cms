<?php
header('Content-Type:text/html;charset=utf-8');
//模版根目录
define('ROOT_PATH', dirname(__FILE__));
//引入模版类
require ROOT_PATH . '/config/profile.inc.php';

//自动加载类
function __autoload($_className)
{
    if (substr($_className, -6) == 'Action') {
        require ROOT_PATH.'/action/'.$_className.'.class.php';
    }elseif(substr($_className, -5) === 'Model'){
        require ROOT_PATH.'/model/'.$_className.'.class.php';
    }else{
        require ROOT_PATH . '/includes/'.$_className.'.class.php';
    }
}

//缓存机制
require 'cache.inc.php';
//实例化模版类
$_tpl = new Templates();

