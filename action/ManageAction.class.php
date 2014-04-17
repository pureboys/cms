<?php

class ManageAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new ManageModel());
        $this->_action();
        $this->_tpl->display('manage.tpl');
    }

    private function _action()
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
            if (Validate::checkNull($_POST['admin_user'])) Tool::alertBack("警告：用户名不得为空");
            if (Validate::checkLength($_POST['admin_user'], 2, 'min')) Tool::alertBack("警告：用户名不得小于2位");
            if (Validate::checkLength($_POST['admin_user'], 20, 'max')) Tool::alertBack("警告：用户名不得大于20位");
            if (Validate::checkNull($_POST['admin_pass'])) Tool::alertBack("警告：密码不得为空");
            if (Validate::checkLength($_POST['admin_pass'], 6, 'min')) Tool::alertBack("警告：用户名不得小于6位");
            if (Validate::checkEquals($_POST['admin_pass'], $_POST['admin_notpass'])) Tool::alertBack('警告：密码和密码确认必须一致');
            $this->_model->_admin_user = $_POST['admin_user'];
            if($this->_model->getOneManage()) Tool::alertBack('此用户已经被号占用！');
            $this->_model->_admin_pass = sha1($_POST['admin_pass']);
            $this->_model->_level = $_POST['level'];
            $this->_model->addManage() ? Tool::alertLocation("恭喜新增成功!", 'manage.php?action=show') : Tool::alertBack("很遗憾，添加管理员失败!");
        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增管理员');
        $_level = new LevelModel();
        $this->_tpl->assign('AllLevel', $_level->getAllLevel());
    }


    private function show()
    {
        $_page = new Page($this->_model->getManageTotal(),PAGE_SIZE);
        $this->_model->_limit = $_page->limit;
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '管理员列表');
        $this->_tpl->assign('AllManage', $this->_model->getAllManage());
        $this->_tpl->assign('page',$_page->showpage());
    }


    private function update()
    {
        if (isset($_POST['send'])) {
            $this->_model->id = $_POST['id'];
            if (trim($_POST['admin_pass']) == "") {
                $this->_model->_admin_pass = $_POST['pass'];
            } else {
                if(Validate::checkLength($_POST['admin_pass'],6,'min')) Tool::alertBack('警告密码不得小于6位');
                $this->_model->_admin_pass = sha1($_POST['admin_pass']);
            }
            $this->_model->_level = $_POST['level'];
            $this->_model->updateManage() ? Tool::alertLocation('恭喜修改管理员成功！', 'manage.php?action=show') : Tool::alertBack('很遗憾，修改失败');
        }
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            is_object($this->_model->getOneManage()) ? true : Tool::alertBack('管理员传值id有误');
            $this->_tpl->assign('id', $this->_model->getOneManage()->id);
            $this->_tpl->assign('admin_user', $this->_model->getOneManage()->admin_user);
            $this->_tpl->assign('level', $this->_model->getOneManage()->level);
            $this->_tpl->assign('admin_pass', $this->_model->getOneManage()->admin_pass);
            $this->_tpl->assign('update', true);
            $this->_tpl->assign('show', false);
            $this->_tpl->assign('add', false);
            $this->_tpl->assign('title', '修改管理员');
            $_level = new LevelModel();
            $this->_tpl->assign('AllLevel', $_level->getAllLevel());
        } else {
            Tool::alertBack('非法操作！');
        }
    }

    private function delete()
    {
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $this->_model->deleteManage() ? Tool::alertLocation('恭喜你，删除管理员成功！', 'manage.php?action=show') : Tool::alertBack('很遗憾，删除失败！');
        } else {
            Tool::alertBack('非法操作！');
        }
    }
}