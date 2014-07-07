<?php

class FriendLinkAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new LinkModel());
    }

    public function _action()
    {
        switch ($_GET['action']) {
            case  'frontshow':
                $this->frontshow();
                break;
            case  'frontadd':
                $this->frontadd();
                break;
            default:
                Tool::alertBack('非法操作！');
        }
    }


    //front show
    private function frontshow()
    {
        $this->_tpl->assign('Alltext', $this->_model->getAllTextLink());
        $this->_tpl->assign('Alllogo', $this->_model->getAllLogoLink());

        $this->_tpl->assign('frontadd', false);
        $this->_tpl->assign('frontshow', true);
    }

    //front add
    private function frontadd()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkLength($_POST['code'], 4, 'equals')) Tool::alertBack('验证码必须是4位');
            if (Validate::checkEquals(strtolower($_POST['code']), $_SESSION['code'])) Tool::alertBack('验证码不正确！');
            if (Validate::checkNull($_POST['webname'])) Tool::alertBack("警告：网站名称不得为空");
            if (Validate::checkLength($_POST['webname'], 20, 'max')) Tool::alertBack("警告：网站名称不得大于20位");
            if (Validate::checkNull($_POST['weburl'])) Tool::alertBack("警告：网站地址不得为空");
            if (Validate::checkLength($_POST['weburl'], 100, 'max')) Tool::alertBack("警告：网站地址不得大于100位");
            if ($_POST['type'] == 2) {
                if (Validate::checkNull($_POST['logourl'])) Tool::alertBack("警告：Logo地址不得为空");
                if (Validate::checkLength($_POST['logourl'], 100, 'max')) Tool::alertBack("警告：Logo地址不得大于100位");
            }
            if (Validate::checkLength($_POST['user'], 20, 'max')) Tool::alertBack("警告：站长名称不得大于20位");

            $this->_model->webname = $_POST['webname'];
            $this->_model->weburl = $_POST['weburl'];
            $this->_model->logourl = $_POST['logourl'];
            $this->_model->user = $_POST['user'];
            $this->_model->type = $_POST['type'];
            $this->_model->user = $_POST['user'];
            $this->_model->state = $_POST['state'];

            $this->_model->addLink() ? Tool::alertClose('恭喜您，申请友情连接成功！等待管理员审核') : Tool::alertBack('申请友情连接失败！');

        }

        $this->_tpl->assign('frontadd', true);
        $this->_tpl->assign('frontshow', false);
    }

    //index footer
    public function index()
    {
        $this->text();
        $this->logo();
    }

    //text
    private function text()
    {
        $this->_tpl->assign('text', $this->_model->getTwentyTextLink());
    }

    //logo
    private function logo()
    {
        $this->_tpl->assign('logo', $this->_model->getNineLogoLink());
    }


}