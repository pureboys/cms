<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(10,'您的权限不足，无法管理广告');
global $_tpl;
$_adver = new AdverAction($_tpl);
$_adver->_action();
$_tpl->display('adver.tpl');
