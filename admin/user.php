<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(13,'您的权限不足，无法管理会员');
global $_tpl;
$_user = new UserAction($_tpl);
$_user->_action();
$_tpl->display('user.tpl');
