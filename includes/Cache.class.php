<?php

/**
 * Class Cache
 * 静态页面，局部不缓存
 */
class Cache
{
    private $flag;

    public function __construct($_noCache)
    {
        $this->flag = in_array(Tool::tplName(), $_noCache);
    }

    //返回不使用缓存的页面的布尔值
    public function noCache()
    {
        return $this->flag;
    }

    //_action
    public function _action()
    {
        switch ($_GET['type']) {
            case 'details':
                $this->details();
                break;
            case 'header':
                $this->header();
                break;
            case 'index':
                $this->index();
                break;
        }
    }

    //统计点击量,details
    public function details()
    {
        $_content = new ContentModel();
        $_content->id = $_GET['id'];
        $this->setContentCount($_content);
        $this->getContentCount($_content);
        $_comment = new CommentModel();
        $_comment->cid = $_content->id;
        $this->getComment($_comment);
    }



    //header
    public function header()
    {
        $_cookie = new Cookie('user');
        if ($_cookie->getCookie()) {
            echo "function getHeader(){
             document.write('{$_cookie->getCookie()} 您好！<a href=\"/register.php?action=logout\">退出<\/a>');
            }";
        } else {
            echo "function getHeader(){
             document.write('<a href=\"/register.php?action=reg\" class=\"user\">注册</a> <a href=\"register.php?action=login\" class=\"user\">登录</a>');
            }";
        }
    }

    public function index()
    {
        $_cookie = new Cookie('user');
        $user = $_cookie->getCookie();
        $_cookie = new Cookie('face');
        $face = $_cookie->getCookie();
        $_member = '';
        if ($user && $face) {
            $_member .= '<h2>会员信息</h2>';
            $_member .= '<div class="a">您好, <strong>' . Tool::subStr($user, null, 2, 'utf8') . '</strong> 欢迎光临</div>';
            $_member .= '<div class="b">';
            $_member .= '<img src="/images/' . $face . '" alt="' . $user . '"/>';
            $_member .= '<a href="###">个人中心</a>';
            $_member .= '<a href="###">我的评论</a>';
            $_member .= '<a href="/register.php?action=logout">退出登录</a>';
            $_member .= '</div>';
        } else {
            $_member .= '<h2>会员登录</h2>';
            $_member .= '<form action="/register.php?action=login" method="post" name="login">';
            $_member .= '<label for="">用户名：<input type="text" name="user" class="text"/></label>';
            $_member .= '<label for="">密　码：<input type="password" name="pass" class="text"/></label>';
            $_member .= '<label for="" class="yzm">验证码：<input type="text" name="code" class="text code"/>';
            $_member .= ' <img src="/config/code.php" onclick=javascript:this.src="/config/code.php?tm="+Math.random(); class="code"/>';
            $_member .= '</label>';
            $_member .= '<p><input type="submit" name="send" value="登录" class="submit" onclick="return checkLogin();"/> <a href="register.php?action=reg">注册会员</a> <a href="###">忘记密码</a></p>';
            $_member .= '</form>';
        }
        echo "function getIndexLogin(){
             document.write('$_member');
        }";
    }


    //累计
    private function setContentCount(&$_content)
    {
        $_content->setContentCount();
    }

    //获取点击数
    private function getContentCount(&$_content)
    {
        $_count = $_content->getOneContent()->count;
        echo "function getContentCount(){
             document.write('$_count');
        }";
    }

    //获取评论总量
    private function getComment(&$_comment)
    {
        $_count = $_comment->getCommentTotal();
        echo "function getComment(){
             document.write('$_count');
        }";
    }


}