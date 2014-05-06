<?php
header('Content-Type:text/html;charset=utf-8');
//模版根目录
define('ROOT_PATH', substr(dirname(__FILE__), 0, -7));
//引入模版类
require ROOT_PATH . '/config/profile.inc.php';
if (!FRONT_CACHE) exit;
//自动加载类
function __autoload($_className)
{
    if (substr($_className, -6) == 'Action') {
        require ROOT_PATH . '/action/' . $_className . '.class.php';
    } elseif (substr($_className, -5) === 'Model') {
        require ROOT_PATH . '/model/' . $_className . '.class.php';
    } else {
        require ROOT_PATH . '/includes/' . $_className . '.class.php';
    }
}

$_cache = new Cache();
switch ($_GET['type']) {
    case 'details':
        $_cache->details();
        break;
    case 'list':
        $_cache->listc();
        break;
}