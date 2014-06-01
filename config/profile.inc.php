<?php

//配置文件
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '123456');
define('DB_NAME', 'cms');
define('DB_PORT', '3306');

//系统配置文件
define('GPC', get_magic_quotes_gpc()); //sql转义功能是否打开
@define('PREV_URL', $_SERVER['HTTP_REFERER']); //上一页地址
define('MARK', ROOT_PATH . '/images/yc.png'); //水印图片

//模版文件目录
define('TPL_DIR', ROOT_PATH . '/templates/');
//编译文件目录
define('TPL_C_DIR', ROOT_PATH . '/templates_c/');
//缓存文件目录
define('CACHE', ROOT_PATH . '/cache/');

//后台自定义配置
require_once 'sys_profile.inc.php';


