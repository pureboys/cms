<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(4,'您的权限不足，无法管理等级');
global $_tpl;
$_level = new LevelAction($_tpl);
$_level->_action();
$_tpl->display('level.tpl');
