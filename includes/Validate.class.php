<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 14-4-15
 * Time: 上午9:56
 */
class Validate
{
//    是否为空
    static public function checkNull($_date)
    {
        if ("" == trim($_date)) return true;
        return false;
    }

//数据是否为数字
    static public function checkNum($_date)
    {
        if (!is_numeric($_date)) return true;
        return false;
    }

//    长度是否合法
    static public function checkLength($_date, $_length, $_flag)
    {
        if ($_flag == 'min') {
            if (mb_strlen(trim($_date), 'utf8') < $_length) return true;
            return false;
        } else if ($_flag == 'max') {
            if (mb_strlen(trim($_date), 'utf8') > $_length) return true;
            return false;
        } else if ($_flag == 'equals') {
            if (mb_strlen(trim($_date), 'utf8') != $_length) return true;
            return false;
        } else {
            Tool::alertBack('ERROR:参数传递错误，必须是min,max');
        }
        return true;
    }

//    数据是否一致
    static public function checkEquals($_date, $_other_date)
    {
        if (trim($_date) != trim($_other_date)) return true;
        return false;
    }

    //session验证
    static public function checkSession()
    {
        if (!isset($_SESSION['admin'])) Tool::alertBack('警告：非法登录;');
    }

} 