<?php
//前台专用
//是否开启缓冲区
define('IS_CACHE', false);
//判断是否开启缓存
IS_CACHE ? ob_start() : null;
