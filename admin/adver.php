<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
global $_tpl;
$_adver = new AdverAction($_tpl);
$_adver->_action();
$_tpl->display('adver.tpl');
