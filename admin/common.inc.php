<?php
//后台缓存，不得开启
define('IS_CACHE', false);
//判断是否开启缓存
IS_CACHE ? ob_start() : null;