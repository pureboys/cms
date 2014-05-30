<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
global $_tpl;
$_permission = new PermissionAction($_tpl);
$_permission->_action();
$_tpl->display('permission.tpl');
