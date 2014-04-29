<?php
require dirname(__FILE__) . '/init.inc.php';
global $_tpl;
$_list = new ListAction($_tpl);
$_list->getNav();
$_tpl->display('list.tpl');