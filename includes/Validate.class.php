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
    static public function checkNull($_data)
    {
        if ("" == trim($_data)) return true;
        return false;
    }

//数据是否为数字
    static public function checkNum($_data)
    {
        if (!is_numeric($_data)) return true;
        return false;
    }

//    长度是否合法
    static public function checkLength($_data, $_length, $_flag)
    {
        if ($_flag == 'min') {
            if (mb_strlen(trim($_data), 'utf8') < $_length) return true;
            return false;
        } else if ($_flag == 'max') {
            if (mb_strlen(trim($_data), 'utf8') > $_length) return true;
            return false;
        } else if ($_flag == 'equals') {
            if (mb_strlen(trim($_data), 'utf8') != $_length) return true;
            return false;
        } else {
            Tool::alertBack('ERROR:参数传递错误，必须是min,max');
        }
        return true;
    }

//    数据是否一致
    static public function checkEquals($_data, $_other_date)
    {
        if (trim($_data) != trim($_other_date)) return true;
        return false;
    }

    //session验证
    static public function checkSession()
    {
        if (!isset($_SESSION['admin'])) Tool::alertBack('警告：非法登录;');
    }

    //验证电子邮件
    static public function checkEmail($_data)
    {
        $preg = '/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/';
        if (!preg_match($preg, $_data)) return true;
        return false;
    }


} 