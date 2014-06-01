<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(12,'您的权限不足，无法管理友情链接');
global $_tpl;
$_link = new LinkAction($_tpl);
$_link->_action();
$_tpl->display('link.tpl');
