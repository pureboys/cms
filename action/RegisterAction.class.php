<?php

class RegisterAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new UserModel());
    }

    public function _action()
    {
        switch ($_GET['action']) {
            case 'reg':
                $this->reg();
                break;
            case 'login':
                $this->login();
                break;
            case 'logout':
                $this->logout();
                break;
            default:
                Tool::alertBack('警告：非法操作');
        }
    }

    //注册页面
    private function reg()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkLength($_POST['code'], 4, 'equals')) Tool::alertBack('验证码必须是4位');
            if (Validate::checkEquals(strtolower($_POST['code']), $_SESSION['code'])) Tool::alertBack('验证码不正确！');
            if (Validate::checkNull($_POST['user'])) Tool::alertBack("警告：用户名不得为空");
            if (Validate::checkLength($_POST['user'], 2, 'min')) Tool::alertBack("警告：用户名不得小于2位");
            if (Validate::checkLength($_POST['user'], 20, 'max')) Tool::alertBack("警告：用户名不得大于20位");
            if (Validate::checkNull($_POST['pass'])) Tool::alertBack("警告：密码不得为空");
            if (Validate::checkLength($_POST['pass'], 6, 'min')) Tool::alertBack("警告：密码不得小于6位");
            if (Validate::checkEquals($_POST['pass'], $_POST['notpass'])) Tool::alertBack('警告：密码不一致');
            if (Validate::checkNull($_POST['email'])) Tool::alertBack("警告：电子邮件不得为空");
            if (Validate::checkEmail($_POST['email'])) Tool::alertBack('警告：电子邮件格式不正确！');

            if (!Validate::checkNull($_POST['question']) && !Validate::checkNull($_POST['answer'])) {
                $this->_model->question = $_POST['question'];
                $this->_model->answer = $_POST['answer'];
            } else {
                $this->_model->question = '';
                $this->_model->answer = '';
            }
            $this->_model->user = $_POST['user'];
            $this->_model->pass = sha1($_POST['pass']);
            $this->_model->email = $_POST['email'];
            $this->_model->face = $_POST['face'];
            $this->_model->state = 1;
            $this->_model->time = time();

            if ($this->_model->checkUser()) Tool::alertBack('用户名已经被注册！');
            if ($this->_model->checkEmail()) Tool::alertBack('Email已经被使用!');

            if ($this->_model->addUser()) {
                $_cookie = new Cookie('user', $this->_model->user);
                $_cookie->setCookie();
                $_cookie = new Cookie('face', $this->_model->face);
                $_cookie->setCookie();

                Tool::alertLocation('恭喜你注册成功', '/');
            } else {
                Tool::alertBack('很遗憾，注册失败!');
            }
        }
        $this->_tpl->assign('reg', true);
        $this->_tpl->assign('login', false);
        $this->_tpl->assign('OptionFaceOne', range(1, 9));
        $this->_tpl->assign('OptionFaceTwo', range(10, 24));
    }

    //登录界面
    private function login()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkLength($_POST['code'], 4, 'equals')) Tool::alertBack('验证码必须是4位');
            if (Validate::checkEquals(strtolower($_POST['code']), $_SESSION['code'])) Tool::alertBack('验证码不正确！');
            if (Validate::checkNull($_POST['user'])) Tool::alertBack("警告：用户名不得为空");
            if (Validate::checkLength($_POST['user'], 2, 'min')) Tool::alertBack("警告：用户名不得小于2位");
            if (Validate::checkLength($_POST['user'], 20, 'max')) Tool::alertBack("警告：用户名不得大于20位");
            if (Validate::checkNull($_POST['pass'])) Tool::alertBack("警告：密码不得为空");
            if (Validate::checkLength($_POST['pass'], 6, 'min')) Tool::alertBack("警告：密码不得小于6位");
            $this->_model->user = $_POST['user'];
            $this->_model->pass = sha1($_POST['pass']);
            if ($_user = $this->_model->checkLogin()) {
                //cookie
                $_cookie = new Cookie('user', $_user->user, $_POST['time']);
                $_cookie->setCookie();
                $_cookie = new Cookie('face', $_user->face, $_POST['time']);
                $_cookie->setCookie();
                $this->_model->id = $_user->id;
                $this->_model->time = time();
                $this->_model->setLaterUser();
                Tool::alertLocation(null, '/');
            } else {
                Tool::alertBack('用户名或密码错误!');
            }
        }
        $this->_tpl->assign('reg', false);
        $this->_tpl->assign('login', true);
    }

    //登录退出
    private function logout()
    {
        $_cookie = new Cookie('user');
        $_cookie->unCookie();
        Tool::alertLocation(null, '/register.php?action=login');
    }


}