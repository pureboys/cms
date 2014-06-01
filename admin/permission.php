<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(5,'您的权限不足，无法管理权限');
global $_tpl;
$_permission = new PermissionAction($_tpl);
$_permission->_action();
$_tpl->display('permission.tpl');
