<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
global $_tpl;
$_system = new SystemAction($_tpl);
$_system->_action();
$_tpl->display('system.tpl');
