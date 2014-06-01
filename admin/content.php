<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(7,'您的权限不足，无法管理文档');
global $_tpl;
$_content = new ContentAction($_tpl);
$_content->_action();
$_tpl->display('content.tpl');
