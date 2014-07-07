<?php

class PermissionAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new PermissionModel());
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
            if (Validate::checkNull($_POST['name'])) Tool::alertBack("警告：权限不得为空");
            if (Validate::checkLength($_POST['name'], 2, 'min')) Tool::alertBack("警告：权限不得小于2位");
            if (Validate::checkLength($_POST['name'], 100, 'max')) Tool::alertBack("警告：等级不得大于100位");
            if (Validate::checkLength($_POST['info'], 200, 'max')) Tool::alertBack("警告：介绍不得大于200位");
            $this->_model->name = $_POST['name'];
            if ($this->_model->getOnePermission()) Tool::alertBack('警告！权限已经有了！');
            $this->_model->info = $_POST['info'];
            $this->_model->addPermission() ? Tool::alertLocation("恭喜新增权限成功!", 'permission.php?action=show') : Tool::alertBack("很遗憾，添加权限失败!");
        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增权限');
        $this->_tpl->assign('prev_url', PREV_URL);
    }


    private function show()
    {
        parent::page($this->_model->getPermissionTotal());
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '等级列表');
        $this->_tpl->assign('AllPermission', $this->_model->getAllPermission());
    }


    private function update()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkNull($_POST['name'])) Tool::alertBack("警告：权限不得为空");
            if (Validate::checkLength($_POST['name'], 2, 'min')) Tool::alertBack("警告：权限不得小于2位");
            if (Validate::checkLength($_POST['name'], 100, 'max')) Tool::alertBack("警告：等级不得大于100位");
            if (Validate::checkLength($_POST['info'], 200, 'max')) Tool::alertBack("警告：介绍不得大于200位");
            $this->_model->id = $_POST['id'];
            $this->_model->name = $_POST['name'];
            $this->_model->info = $_POST['info'];
            $this->_model->updatePermission() ? Tool::alertLocation('恭喜修改权限成功！', $_POST['prev_url']) : Tool::alertBack('很遗憾，修改权限失败');
        }
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $_permission = $this->_model->getOnePermission();
            if (!$_permission) Tool::alertBack('不存在此权限！');
            $this->_tpl->assign('id', $_permission->id);
            $this->_tpl->assign('name', $_permission->name);
            $this->_tpl->assign('info', $_permission->info);
            $this->_tpl->assign('prev_url', PREV_URL);
            $this->_tpl->assign('update', true);
            $this->_tpl->assign('show', false);
            $this->_tpl->assign('add', false);
            $this->_tpl->assign('title', '修改权限');
        } else {
            Tool::alertBack('非法操作！');
        }
    }

    private function delete()
    {
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $this->_model->deletePermission() ? Tool::alertLocation('恭喜你，删除权限成功！', PREV_URL) : Tool::alertBack('很遗憾，删除权限失败！');
        } else {
            Tool::alertBack('非法操作！');
        }
    }
}