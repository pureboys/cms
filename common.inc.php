<?php
//模版句柄
global $_tpl;
//判断是否开启缓存
if(FRONT_CACHE){
    ob_start();
    $_tpl->cache(Tool::tplName());
}
$_nav = new NavAction($_tpl);
$_nav->showfront(); //列出主导航