<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
global $_tpl;
$_vote = new VoteAction($_tpl);
$_vote->_action();
$_tpl->display('vote.tpl');
