<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(11,'您的权限不足，无法管理网站投票');
global $_tpl;
$_vote = new VoteAction($_tpl);
$_vote->_action();
$_tpl->display('vote.tpl');
