<?php

class ListAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl);
    }

    public function _action()
    {
        $this->getNav();
        $this->getListContent();
    }

    //获取前台显示导航
    private function getNav()
    {
        if (isset($_GET['id'])) {
            $_nav = new NavModel();
            $_nav->id = $_GET['id'];
            if ($_nav->getOneNav()) {
                //主导航
                $_nav1 = $_nav->getOneNav()->nnav_name ? '<a href="list.php?id=' . $_nav->getOneNav()->iid . '">' . $_nav->getOneNav()->nnav_name . '</a> &gt; ' : "";
                $_nav2 = '<a href="list.php?id=' . $_nav->getOneNav()->id . '">' . $_nav->getOneNav()->nav_name . '</a>';
                $this->_tpl->assign('nav', $_nav1 . $_nav2);
                //自导航
                $this->_tpl->assign('childnav', $_nav->getAllChildFrontNav());
            } else {
                Tool::alertBack('警告：此导航不存在！');
            }
        } else {
            Tool::alertBack('警告：非法操作！');
        }
    }

    //获取前台列表
    private function getListContent()
    {
        if (isset($_GET['id'])) {
            parent::__construct($this->_tpl, new ContentModel());
            $this->_model->id = $_GET['id'];
            $_navid = $this->_model->getNavChildId();
            $this->_model->nav = $_navid ? Tool::objArrOfstr($_navid, 'id') : $this->_model->id;

            parent::page($this->_model->getListContentTotal(), ARTICLE_SIZE);

            $_object = $this->_model->getListContent();
            if ($_object) {
                $_object = Tool::subStr($_object, 'info', 120, 'utf8');
                $_object = Tool::subStr($_object, 'title', 35, 'utf8');
            }
            $this->_tpl->assign('AllListContent', $_object);
        } else {
            Tool::alertBack('警告：非法操作');
        }
    }


}