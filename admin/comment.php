<?php
require substr(dirname(__FILE__), 0, -6) . '/init.inc.php';
Validate::checkSession();
Validate::checkPermission(8,'您的权限不足，无法管理网站评论');
global $_tpl;
$_comment = new CommentAction($_tpl);
$_comment->_action();
$_tpl->display('comment.tpl');
