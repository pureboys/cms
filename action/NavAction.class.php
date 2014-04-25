<?php

class NavAction extends Action
{
    public function __construct(&$_tpl)
    {
        Validate::checkSession();
        parent::__construct($_tpl, new NavModel());
        $this->_action();
        $this->_tpl->display('nav.tpl');
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
            if (Validate::checkNull($_POST['nav_name'])) Tool::alertBack("警告：导航不得为空");
            if (Validate::checkLength($_POST['nav_name'], 2, 'min')) Tool::alertBack("警告：导航不得小于2位");
            if (Validate::checkLength($_POST['nav_name'], 20, 'max')) Tool::alertBack("警告：导航不得大于20位");
            if (Validate::checkLength($_POST['nav_info'], 200, 'max')) Tool::alertBack("警告：介绍不得大于200位");
            $this->_model->nav_name = $_POST['nav_name'];
            $this->_model->nav_info = $_POST['nav_info'];
            if ($this->_model->getOneNav()) Tool::alertBack('警告！导航已经有了！');
            $this->_model->addNav() ? Tool::alertLocation("恭喜新增导航成功!", 'nav.php?action=show') : Tool::alertBack("很遗憾，添加导航失败!");
        }
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增导航');
        $this->_tpl->assign('prev_url',PREV_URL);
    }


    private function show()
    {

        parent::page($this->_model->getNavTotal());
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '导航列表');
        $this->_tpl->assign('AllNav', $this->_model->getAllNav());
    }


    private function update()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkNull($_POST['nav_name'])) Tool::alertBack("警告：导航不得为空");
            if (Validate::checkLength($_POST['nav_name'], 2, 'min')) Tool::alertBack("警告：导航不得小于2位");
            if (Validate::checkLength($_POST['nav_name'], 20, 'max')) Tool::alertBack("警告：导航不得大于20位");
            if (Validate::checkLength($_POST['nav_info'], 200, 'max')) Tool::alertBack("警告：介绍不得大于200位");
            $this->_model->id = $_POST['id'];
            $this->_model->nav_name = $_POST['nav_name'];
            $this->_model->nav_info = $_POST['nav_info'];
            $this->_model->updateNav() ? Tool::alertLocation('恭喜修改导航成功！', $_POST['prev_url']) : Tool::alertBack('很遗憾，修改导航失败');
        }
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $_nav = $this->_model->getOneNav();
            is_object($_nav) ? true : Tool::alertBack('导航传值id有误');
            $this->_tpl->assign('id', $_nav->id);
            $this->_tpl->assign('nav_name', $_nav->nav_name);
            $this->_tpl->assign('nav_info', $_nav->nav_info);
            $this->_tpl->assign('prev_url',PREV_URL);
            $this->_tpl->assign('update', true);
            $this->_tpl->assign('show', false);
            $this->_tpl->assign('add', false);
            $this->_tpl->assign('title', '修改等级');
        } else {
            Tool::alertBack('非法操作！');
        }
    }

    private function delete()
    {
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $this->_model->deleteNav() ? Tool::alertLocation('恭喜你，删除导航成功！', PREV_URL) : Tool::alertBack('很遗憾，删除导航失败！');
        } else {
            Tool::alertBack('非法操作！');
        }
    }
}