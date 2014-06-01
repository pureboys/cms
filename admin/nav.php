<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(6,'您的权限不足，无法管理网站导航');
global $_tpl;
$_nav = new NavAction($_tpl);
$_nav->_action();
$_tpl->display('nav.tpl');

