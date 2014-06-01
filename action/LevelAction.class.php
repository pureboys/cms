<?php

class LevelAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new LevelModel());
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
            if (Validate::checkNull($_POST['level_name'])) Tool::alertBack("警告：等级不得为空");
            if (Validate::checkLength($_POST['level_name'], 2, 'min')) Tool::alertBack("警告：等级不得小于2位");
            if (Validate::checkLength($_POST['level_name'], 20, 'max')) Tool::alertBack("警告：等级不得大于20位");
            if (Validate::checkLength($_POST['level_info'], 200, 'max')) Tool::alertBack("警告：介绍不得大于200位");
            $this->_model->level_name = $_POST['level_name'];
            if ($this->_model->getOneLevel()) Tool::alertBack('警告！等级已经有了！');
            $this->_model->level_info = $_POST['level_info'];
            if (!empty($_POST['permission'])) {
                $this->_model->permission = implode(',', $_POST['permission']);
            }
            $this->_model->addLevel() ? Tool::alertLocation("恭喜新增等级成功!", 'level.php?action=show') : Tool::alertBack("很遗憾，添加等级失败!");
        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增等级');
        $this->_tpl->assign('prev_url', PREV_URL);

        $_permission = new PermissionModel();
        $this->_tpl->assign('AllNoLimitPermission', $_permission->getAllNoLimitPermission());

    }


    private function show()
    {
        parent::page($this->_model->getLevelTotal());
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '等级列表');
        $this->_tpl->assign('AllLevel', $this->_model->getAllLimitLevel());
    }


    private function update()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkNull($_POST['level_name'])) Tool::alertBack("警告：等级不得为空");
            if (Validate::checkLength($_POST['level_name'], 2, 'min')) Tool::alertBack("警告：等级不得小于2位");
            if (Validate::checkLength($_POST['level_name'], 20, 'max')) Tool::alertBack("警告：等级不得大于20位");
            if (Validate::checkLength($_POST['level_info'], 200, 'max')) Tool::alertBack("警告：介绍不得大于200位");
            $this->_model->id = $_POST['id'];
            $this->_model->level_name = $_POST['level_name'];
            $this->_model->level_info = $_POST['level_info'];
            $this->_model->permission = implode(',', $_POST['permission']);
            $this->_model->updateLevel() ? Tool::alertLocation('恭喜修改等级成功！', $_POST['prev_url']) : Tool::alertBack('很遗憾，修改等级失败');
        }
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $_level = $this->_model->getOneLevel();
            //获取本用户组下权限
            $arr_permission = explode(',', $_level->permission);
            //获取所有权限
            $_permission = new PermissionModel();
            $_object = $_permission->getAllNoLimitPermission();
            $_html = '';
            foreach ($_object as $key => $_value) {
                if (in_array($_value->id, $arr_permission))
                    $_html .= '<input checked type="checkbox" name="permission[]" value="' . $_value->id . '">' . $_value->name;
                else
                    $_html .= '<input type="checkbox" name="permission[]" value="' . $_value->id . '">' . $_value->name;
            }
            $this->_tpl->assign('AllNoLimitPermission', $_html);

            $this->_model->id = $_GET['id'];
            $_level = $this->_model->getOneLevel();
            is_object($_level) ? true : Tool::alertBack('等级传值id有误');
            $this->_tpl->assign('id', $_level->id);
            $this->_tpl->assign('level_name', $_level->level_name);
            $this->_tpl->assign('level_info', $_level->level_info);
            $this->_tpl->assign('prev_url', PREV_URL);
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
            $_manage = new ManageModel();
            $_manage->_level = $this->_model->id = $_GET['id'];
            if ($_manage->getOneManage()) Tool::alertBack('警告，此等级已经被管理员使用，无法删除！请删除相关用户');
            $this->_model->deleteLevel() ? Tool::alertLocation('恭喜你，删除等级成功！', PREV_URL) : Tool::alertBack('很遗憾，删除等级失败！');
        } else {
            Tool::alertBack('非法操作！');
        }
    }
}