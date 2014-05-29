<?php
//前台缓存
define('IS_CACHE', false);
//模版句柄
global $_tpl, $_cache;
//判断是否开启缓存
if (IS_CACHE && !$_cache->noCache()) {
    ob_start();
    $_tpl->cache(Tool::tplName() . '.tpl');
}
$_nav = new NavAction($_tpl);
$_nav->showfront(); //列出主导航

if (IS_CACHE) {
    $_tpl->assign('header', '<script>getHeader();</script>');
} else {
    $_cookie = new Cookie('user');
    if ($_cookie->getCookie()) {
        $_tpl->assign('header', $_cookie->getCookie() . ' 您好！<a href="/register.php?action=logout">退出</a>');
    } else {
        $_tpl->assign('header', '<a href="/register.php?action=reg" class="user">注册</a>
    <a href="/register.php?action=login" class="user">登录</a>');
    }
}

//footer页的友情链接
$_link = new FriendLinkAction($_tpl);
$_link->index();
//头部的tag
$_tag = new TagAction($_tpl);
$_tag->getFiveTag();



