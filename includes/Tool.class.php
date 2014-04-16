<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 14-4-10
 * Time: 上午11:01
 */
class Tool
{
    //弹窗跳转
    static public function alertLocation($_info, $_url)
    {
        echo "<script type='text/javascript'>alert('$_info');location.href='$_url';</script>";
        exit();
    }

//    弹窗返回
    static public function alertBack($_info)
    {
        echo "<script type='text/javascript'>alert('$_info');history.back();</script>";
        exit();
    }

}