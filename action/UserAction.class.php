<?php

class UserAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new UserModel());
    }

    public function _action()
    {
        switch ($_GET['action']) {
            case  'show':
                $this->show();
                break;
            case  'add':
                $this->add();
                break;
            case 'update':
                $this->update();
                break;
            case 'delete':
                $this->delete();
                break;
            default:
                Tool::alertBack('非法操作！');
        }
    }

    private function add()
    {
        if (isset($_POST['send'])) {
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
            $this->_model->state = $_POST['state'];
            $this->_model->time = '';

            if ($this->_model->checkUser()) Tool::alertBack('用户名已经被注册！');
            if ($this->_model->checkEmail()) Tool::alertBack('Email已经被使用!');

            if ($this->_model->addUser()) {
                Tool::alertLocation('恭喜你注册成功', 'user.php?action=show');
            } else {
                Tool::alertBack('很遗憾，注册失败!');
            }

        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增会员');
        $this->_tpl->assign('prev_url', PREV_URL);
        $this->_tpl->assign('OptionFaceOne', range(1, 9));
        $this->_tpl->assign('OptionFaceTwo', range(10, 24));
    }


    private function show()
    {
        parent::page($this->_model->getUserTotal());
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '会员列表');
        $_object = $this->_model->getAllUser();
        foreach ($_object as $_value) {
            switch ($_value->state) {
                case 0:
                    $_value->state = '被封杀会员';
                    break;
                case 1:
                    $_value->state = '待审核的会员';
                    break;
                case 2:
                    $_value->state = '初级会员';
                    break;
                case 3:
                    $_value->state = '中级会员';
                    break;
                case 4:
                    $_value->state = '高级会员';
                    break;
                case 5:
                    $_value->state = 'vip会员';
                    break;
            }
        }
        $this->_tpl->assign('AllUser', $_object);
    }


    private function update()
    {
        if (isset($_POST['send'])) {

            if (Validate::checkNull($_POST['pass'])) {
                $this->_model->pass = $_POST['ppass'];
            } else {
                if (Validate::checkLength($_POST['pass'], 6, 'min')) Tool::alertBack("警告：密码不得小于6位");
                $this->_model->pass = sha1($_POST['pass']);
            }
            if (Validate::checkNull($_POST['email'])) Tool::alertBack("警告：电子邮件不得为空");
            if (Validate::checkEmail($_POST['email'])) Tool::alertBack('警告：电子邮件格式不正确！');

            if (!Validate::checkNull($_POST['question']) && !Validate::checkNull($_POST['answer'])) {
                $this->_model->question = $_POST['question'];
                $this->_model->answer = $_POST['answer'];
            } else {
                $this->_model->question = '';
                $this->_model->answer = '';
            }
            $this->_model->id = $_POST['id'];
            $this->_model->email = $_POST['email'];
            $this->_model->face = $_POST['face'];
            $this->_model->state = $_POST['state'];

            $this->_model->updateUser() ? Tool::alertLocation('恭喜你,修改成功！', $_POST['prev_url']) : Tool::alertBack('修改失败');

        }
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $_user = $this->_model->getOneUser();
            if ($_user) {
                $this->_tpl->assign('update', true);
                $this->_tpl->assign('show', false);
                $this->_tpl->assign('add', false);
                $this->_tpl->assign('title', '修改会员');

                $this->_tpl->assign('id', $_user->id);
                $this->_tpl->assign('user', $_user->user);
                $this->_tpl->assign('email', $_user->email);
                $this->_tpl->assign('answer', $_user->answer);
                $this->_tpl->assign('facesrc', $_user->face);
                $this->_tpl->assign('pass', $_user->pass);

                $this->face($_user->face);
                $this->question($_user->question);
                $this->state($_user->state);

                $this->_tpl->assign('prev_url', PREV_URL);
                $this->_tpl->assign('OptionFaceOne', range(1, 9));
                $this->_tpl->assign('OptionFaceTwo', range(10, 24));
            } else {
                Tool::alertBack('警告：不存在此会员');
            }
        } else {
            Tool::alertBack('警告：非法操作！');
        }
    }

    private function delete()
    {
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $this->_model->deleteUser() ? Tool::alertLocation('恭喜你，删除会员成功！', PREV_URL) : Tool::alertBack('很遗憾，删除会员失败！');
        } else {
            Tool::alertBack('非法操作！');
        }
    }

    //头像
    private function face($_face)
    {
        $_one = range(1, 9);
        $_two = range(10, 24);
        $_html = '';
        foreach ($_one as $_value) {
            $selected = '';
            if ('0' . $_value . '.gif' == $_face) $selected = 'selected';
            $_html .= '<option ' . $selected . ' value="0' . $_value . '.gif">0' . $_value . '.gif</option>';
        }
        foreach ($_two as $_value) {
            $selected = '';
            if ($_value . '.gif' == $_face) $selected = 'selected';
            $_html .= '<option ' . $selected . ' value="' . $_value . '.gif">' . $_value . '.gif</option>';
        }
        $this->_tpl->assign('face', $_html);
    }

    //提问
    private function question($_question)
    {
        $_questionArr = array('您父亲的姓名', '您母亲的职业', '您配偶的性别');
        $_html = '';
        foreach ($_questionArr as $_value) {
            $selected = '';
            if ($_value == $_question) $selected = 'selected';
            $_html .= '<option ' . $selected . ' value="' . $_value . '">' . $_value . '</option>';
        }
        $this->_tpl->assign('question', $_html);
    }

    //状态
    private function state($_state)
    {
        $_stateArr = array('被封杀会员', '待审核会员', '初级会员', '中级会员', '高级会员', 'vip会员');
        $_html = '';
        foreach ($_stateArr as $_key => $_value) {
            $selected = '';
            if ($_key == $_state) $selected = 'checked';
            $_html .= '<input type="radio" name="state" ' . $selected . ' value="' . $_key . '" />' . $_value;
        }
        $this->_tpl->assign('state', $_html);
    }


}