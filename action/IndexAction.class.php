<?php

class IndexAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new UserModel());
    }

    public function _action()
    {
        $this->login();
        $this->laterUser();
    }

    //登录模块
    private function login()
    {
        $_cookie = new Cookie('user');
        $user = $_cookie->getCookie();
        $_cookie = new Cookie('face');
        $face = $_cookie->getCookie();
        if ($user && $face) {
            $this->_tpl->assign('user', Tool::subStr($user, null, 2, 'utf8'));
            $this->_tpl->assign('face', $face);
            $this->_tpl->assign('login', false);
        } else {
            $this->_tpl->assign('login', true);
        }
        $this->_tpl->assign('cache', IS_CACHE);
        if (IS_CACHE) $this->_tpl->assign('member', '<script>getIndexLogin();</script>');
    }

    //最近登录的会员
    private function laterUser()
    {
        $this->_tpl->assign('AllLaterUser', $this->_model->getLaterUser());
    }


}