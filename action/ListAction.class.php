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
            $_nav = new NavModel();
            $_nav->id = $_GET['id'];
            $_navid = $_nav->getNavChildId();
            $this->_model->nav = $_navid ? Tool::objArrOfstr($_navid, 'id') : $_nav->id;
            parent::page($this->_model->getListContentTotal(), ARTICLE_SIZE);
            $_object = $this->_model->getListContent();
            if ($_object) {
                Tool::subStr($_object, 'info', 120, 'utf8');
                Tool::subStr($_object, 'title', 35, 'utf8');
                foreach ($_object as $_value) {
                    if (empty($_value->thumbnail)) $_value->thumbnail = '/images/none.jpg';
                }
            }
            $this->_tpl->assign('AllListContent', $_object);
            //本月本类推荐
            $_object = $this->_model->getMonthNavRec();
            if ($_object) $this->setObject($_object);
            $this->_tpl->assign('MonthNavRec', $_object);
            //本类热点推荐
            $_object = $this->_model->getMonthNavHot();
            if ($_object) $this->setObject($_object);
            $this->_tpl->assign('MonthNavHot', $_object);
            //本类图文推荐
            $_object = $this->_model->getMonthNavPic();
            if ($_object) $this->setObject($_object);
            $this->_tpl->assign('MonthNavPic', $_object);
        } else {
            Tool::alertBack('警告：非法操作');
        }
    }

    //set Object
    private function setObject(&$_object)
    {
        Tool::objDate($_object, 'date');
        Tool::subStr($_object, 'title', 14, 'utf8');
    }


}