<?php

class AdverAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new AdverModel());
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
        if(isset($_POST['send'])){
            if (Validate::checkNull($_POST['title'])) Tool::alertBack("警告：标题不得为空");
            if (Validate::checkLength($_POST['title'], 2, 'min')) Tool::alertBack("警告：标题不得小于2位");
            if (Validate::checkLength($_POST['title'], 20, 'max')) Tool::alertBack("警告：标题不得大于20位");
            if (Validate::checkNull($_POST['link'])) Tool::alertBack("警告：连接不得为空");
            if($_POST['type'] == '2' || $_POST['type'] == '3'){
                if (Validate::checkNull($_POST['thumbnail'])) Tool::alertBack("警告：广告图片不得为空");
            }
            if (Validate::checkLength($_POST['info'], 200, 'max')) Tool::alertBack("警告：标题不得大于200位");
        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增广告');
        $this->_tpl->assign('prev_url', PREV_URL);
    }


    private function show()
    {

    }


    private function update()
    {

    }

    private function delete()
    {

    }
}