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
        if (isset($_POST['send'])) {
            if(isset($_POST['attr'])){
                $this->_model->attr = implode(',',$_POST['attr']);
            }else{
                $this->_model->attr = '无属性';
            }
            $this->_model->title = $_POST['title'];
            $this->_model->nav = $_POST['nav'];
            $this->_model->info = $_POST['info'];
            $this->_model->source = $_POST['source'];
            $this->_model->author = $_POST['author'];
            $this->_model->keyword = $_POST['keyword'];
            $this->_model->thumbnail = $_POST['thumbnail'];
            $this->_model->tag = $_POST['tag'];
            $this->_model->content = $_POST['content'];
            $this->_model->commend = $_POST['commend'];
            $this->_model->count = $_POST['count'];
            $this->_model->gold = $_POST['gold'];
            $this->_model->color = $_POST['color'];
            $this->_model->addContent() ? Tool::alertLocation('文档发布成功！', '?action=add') : Tool::alertBack('警告：文档发布失败！');
        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增文档');
        $_nav = new NavModel();
        $_html = '';
        foreach ($_nav->getAllFrontNav() as $_object) {
            $_html .= '<optgroup label="' . $_object->nav_name . '">';
            $_nav->id = $_object->id;
            if (!!$_child_nav = $_nav->getAllChildFrontNav()) {
                foreach ($_child_nav as $_object2) {
                    $_html .= '<option value="'.$_object2->id.'">' . $_object2->nav_name . '</option>';
                }
            }
            $_html .= '</optgroup>';
        }
        $this->_tpl->assign('nav', $_html);
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