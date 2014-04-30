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
        if (!empty($_info)) {
            echo "<script type='text/javascript'>alert('$_info');location.href='$_url';</script>";
            exit();
        } else {
            header('Location:' . $_url);
            exit();
        }

    }

//    弹窗返回
    static public function alertBack($_info)
    {
        echo "<script type='text/javascript'>alert('$_info');history.back();</script>";
        exit();
    }

    //清理session
    static public function unSession()
    {
        if (session_start()) {
            session_destroy();
        }
    }

    //显示过滤
    static public function htmlString($_data)
    {
        if (is_array($_data)) {
            $_string = array();
            foreach ($_data as $_key => $_value) {
                $_string[$_key] = Tool::htmlString($_value);
            }
        } else if (is_object($_data)) {
            $_string = new stdClass();
            foreach ($_data as $_key => $_value) {
                $_string->$_key = Tool::htmlString($_value);
            }
        } else {
            $_string = htmlspecialchars($_data);
        }
        return $_string;
    }

    //数据库输入过滤
    static public function mysqlString($_data)
    {
        if (is_array($_data)) return $_data;
        return !GPC ? mysql_real_escape_string($_data) : $_data;
    }

    //弹窗赋值关闭（上传）
    static public function alertOpenerClose($_info, $_path)
    {
        echo "<script type='text/javascript'>alert('$_info');</script>";
        echo "<script type='text/javascript'>opener.document.content.thumbnail.value='$_path'</script>";
        echo "<script type='text/javascript'>opener.document.content.pic.style.display='block'</script>";
        echo "<script type='text/javascript'>opener.document.content.pic.src='$_path'</script>";
        echo "<script type='text/javascript'>window.close();</script>";
        exit();
    }


}