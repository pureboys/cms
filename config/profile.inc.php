<?php
//配置文件
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '123456');
define('DB_NAME', 'cms');

//系统配置文件
define('GPC', get_magic_quotes_gpc());                       //sql转义功能是否打开
define('PAGE_SIZE', 10);                                     //每页条数
@define('PREV_URL', $_SERVER['HTTP_REFERER']);               //上一页地址
define('NAV_SIZE', 10);                                     //主导航在前台显示个数
define('UPDIR', '/uploads/');                              //上传路径地址

//模版文件目录
define('TPL_DIR', ROOT_PATH . '/templates/');
//编译文件目录
define('TPL_C_DIR', ROOT_PATH . '/templates_c/');
//缓存文件目录
define('CACHE', ROOT_PATH . '/cache/');