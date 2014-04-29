<?php

class ContentAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new ContentModel());
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
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增文档');
        $this->_tpl->assign('prev_url', PREV_URL);
    }


    private function show()
    {
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '文档列表');
    }


    private function update()
    {

    }

    private function delete()
    {

    }
}