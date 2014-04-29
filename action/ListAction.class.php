<?php

class ListAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl);
    }

    //获取前台显示导航
    public function getNav()
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

}