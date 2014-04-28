<?php
//前台专用
//是否开启缓冲区
define('IS_CACHE', false);
//判断是否开启缓存
IS_CACHE ? ob_start() : null;
//模版句柄
global $_tpl;
$_nav = new NavAction($_tpl);
$_nav->showfront(); //列出主导航