<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
global $_tpl;
$_level = new LevelAction($_tpl);
$_level->_action();
$_tpl->display('level.tpl');
