<?php

class RotationAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new RotationModel());
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
            case 'state':
                $this->state();
                break;
            case 'xml':
                $this->xml();
                break;
            default:
                Tool::alertBack('非法操作！');
        }
    }

    private function add()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkNull($_POST['thumbnail'])) Tool::alertBack("警告：轮播图不得为空");
            if (Validate::checkNull($_POST['link'])) Tool::alertBack("警告：连接不得为空");
            if (Validate::checkLength($_POST['title'], 20, 'max')) Tool::alertBack("警告：标题不得大于20位");
            if (Validate::checkLength($_POST['info'], 200, 'max')) Tool::alertBack("警告：简介不得大于200位");
            $this->_model->link = $_POST['link'];
            $this->_model->thumbnail = $_POST['thumbnail'];
            $this->_model->info = $_POST['info'];
            $this->_model->title = $_POST['title'];
            $this->_model->addRotation() ? Tool::alertLocation('新增轮播器成功', '?action=show') : Tool::alertBack('轮播器新增失败');
        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增轮播器');
        $this->_tpl->assign('prev_url', PREV_URL);
    }


    private function show()
    {
        parent::page($this->_model->getRotationTotal());
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '轮播器列表');
        $_object = $this->_model->getAllRotation();
        if ($_object) {
            Tool::subStr($_object, 'title', 20, 'utf8');
            Tool::subStr($_object, 'link', 100, 'utf8');
            foreach ($_object as $_value) {
                if (empty($_value->state))
                    $_value->state = '<span class="red">否</span> | <a href="rotation.php?action=state&type=ok&id=' . $_value->id . '">通过</a>';
                else
                    $_value->state = '<span class="green">是</span> | <a href="rotation.php?action=state&type=cancel&id=' . $_value->id . '">取消</a>';
            }

        }
        $this->_tpl->assign('AllRotation', $_object);
    }


    //state
    private function state()
    {
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            if (!$this->_model->getOneRotation()) Tool::alertBack('不存在此轮播！');
            if ($_GET['type'] == 'ok') {
                $this->_model->setStateOK() ? Tool::alertLocation(null, PREV_URL) : Tool::alertBack('警告：通过失败！');
            } else if ($_GET['type'] == 'cancel') {
                $this->_model->setStateCancel() ? Tool::alertLocation(null, PREV_URL) : Tool::alertBack('警告：取消通过失败！');
            } else {
                Tool::alertBack('警告:非法操作');
            }
        } else {
            Tool::alertBack('警告：非法操作!');
        }
    }


    private function update()
    {
        if (isset($_POST['send'])) {
            if (Validate::checkNull($_POST['thumbnail'])) Tool::alertBack("警告：轮播图不得为空");
            if (Validate::checkNull($_POST['link'])) Tool::alertBack("警告：连接不得为空");
            if (Validate::checkLength($_POST['title'], 20, 'max')) Tool::alertBack("警告：标题不得大于20位");
            if (Validate::checkLength($_POST['info'], 200, 'max')) Tool::alertBack("警告：简介不得大于200位");
            $this->_model->id = $_POST['id'];
            $this->_model->thumbnail = $_POST['thumbnail'];
            $this->_model->link = $_POST['link'];
            $this->_model->title = $_POST['title'];
            $this->_model->info = $_POST['info'];
            $this->_model->state = $_POST['state'];
            $this->_model->updateRotation() ? Tool::alertLocation('恭喜修改轮播器成功！', $_POST['prev_url']) : Tool::alertBack('很遗憾，修改轮播器失败');
        }
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $_rotation = $this->_model->getOneRotation();
            if (!$_rotation) Tool::alertBack('警告，此轮播器不存在!');
            $this->_tpl->assign('id', $_rotation->id);
            $this->_tpl->assign('titlec', $_rotation->title);
            $this->_tpl->assign('thumbnail', $_rotation->thumbnail);
            $this->_tpl->assign('info', $_rotation->info);
            $this->_tpl->assign('link', $_rotation->link);
            $this->_tpl->assign('prev_url', PREV_URL);
            $this->_tpl->assign('update', true);
            $this->_tpl->assign('show', false);
            $this->_tpl->assign('add', false);
            $this->_tpl->assign('title', '修改轮播器');
            if (empty($_rotation->state)) {
                $this->_tpl->assign('left_state', '');
                $this->_tpl->assign('right_state', 'checked');
            } else {
                $this->_tpl->assign('left_state', 'checked');
                $this->_tpl->assign('right_state', '');
            }
        } else {
            Tool::alertBack('非法操作！');
        }
    }

    private function delete()
    {
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $this->_model->deleteRotation() ? Tool::alertLocation('恭喜你，删除轮播器成功！', PREV_URL) : Tool::alertBack('很遗憾，删除失败！');
        } else {
            Tool::alertBack('非法操作！');
        }
    }

    //生成xml文件
    private function xml()
    {
        $_object = $this->_model->getNewRotation();
        if ($_object) {
            //创建xml表
            $_xml = '';
            $_xml .= '<?xml version="1.0" encoding="utf-8"?>' . "\r\n";
            $_xml .= '<bcaster autoPlayTime="' . RO_TIME . '">' . "\r\n";
            foreach ($_object as $_value) {
                $_xml .= '<item item_url="' . $_value->thumbnail . '" link="' . $_value->link . '" itemtitle=""/>' . "\r\n";
            }
            $_xml .= '</bcaster>';
            $_sxe = new SimpleXMLElement($_xml);
            $_sxe->asXML(ROOT_PATH . '/bcastr.xml');
            Tool::alertLocation('生成轮播xml文件成功！', '?action=show');
        } else {
            Tool::alertBack('警告：生成轮播xml生成失败！');
        }
    }


}