<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(14,'您的权限不足，无法管理系统配置');
global $_tpl;
$_system = new SystemAction($_tpl);
$_system->_action();
$_tpl->display('system.tpl');
