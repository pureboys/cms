<?php

class IndexAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new UserModel());
    }

    public function _action()
    {
        $this->login();
        $this->laterUser();
        $this->showList();
    }

    //登录模块
    private function login()
    {
        $_cookie = new Cookie('user');
        $user = $_cookie->getCookie();
        $_cookie = new Cookie('face');
        $face = $_cookie->getCookie();
        if ($user && $face) {
            $this->_tpl->assign('user', Tool::subStr($user, null, 2, 'utf8'));
            $this->_tpl->assign('face', $face);
            $this->_tpl->assign('login', false);
        } else {
            $this->_tpl->assign('login', true);
        }
        $this->_tpl->assign('cache', IS_CACHE);
        if (IS_CACHE) $this->_tpl->assign('member', '<script>getIndexLogin();</script>');
    }

    //最近登录的会员
    private function laterUser()
    {
        $this->_tpl->assign('AllLaterUser', $this->_model->getLaterUser());
    }

    //显示推荐。本月热点。本月评论。头条
    private function showList()
    {
        parent::__construct($this->_tpl, new ContentModel());
        //首页推荐
        $_object = $this->_model->getNewRecList();
        if ($_object) {
            Tool::objDate($_object, 'date');
            Tool::subStr($_object, 'title', 14, 'utf8');
        }
        $this->_tpl->assign('NewRecList', $_object);
        //首页热门点击
        $_object = $this->_model->getMonthHotList();
        if ($_object) {
            Tool::objDate($_object, 'date');
            Tool::subStr($_object, 'title', 14, 'utf8');
        }
        $this->_tpl->assign('MonthHotList', $_object);
        //首页评论排行
        $_object = $this->_model->getMonthCommentList();
        if ($_object) {
            Tool::objDate($_object, 'date');
            Tool::subStr($_object, 'title', 14, 'utf8');
        }
        $this->_tpl->assign('MonthCommentList', $_object);
        //获取图文
        $_object = $this->_model->getPicList();
        if ($_object) {
            Tool::subStr($_object, 'title', 22, 'utf8');
        }
        $this->_tpl->assign('PicList', $_object);
        //获取最新文档
        $_object = $this->_model->getNewList();
        if ($_object) {
            Tool::objDate($_object, 'date');
            Tool::subStr($_object, 'title', 25, 'utf8');
        }
        $this->_tpl->assign('NewList', $_object);
        //获取最新推荐一条数据
        $_object = $this->_model->getNewTop();
        $this->_tpl->assign('TopTitle', Tool::subStr($_object->title, null, 25, 'utf8'));
        $this->_tpl->assign('TopInfo', Tool::subStr($_object->title, null, 80, 'utf8'));
        $this->_tpl->assign('TopId', $_object->id);
        //获取2-4位的推荐
        $_object = $this->_model->getNewTopList();
        if ($_object) {
            Tool::subStr($_object, 'title', 15, 'utf8');
            $i = 1;
            foreach ($_object as $_value) {
                if ($i % 2 == 0)
                    $_value->line = '';
                else
                    $_value->line = '|';
                $i++;
            }
        }
        $this->_tpl->assign('NewTopList', $_object);
        //获取内容主题部分
        $_nav = new NavModel();
        $_object = $_nav->getFourNav();
        if ($_object) {
            $i = 1;
            foreach ($_object as $_value) {
                if ($i % 2 == 0)
                    $_value->class = 'list right bottom';
                else
                    $_value->class = 'list bottom';
                $i++;
                //通过目录获取文档
                $this->_model->nav = $_value->id;
                $_navList = $this->_model->getNewNavList();
                if($_navList){
                    Tool::objDate($_navList,'date');
                    Tool::subStr($_navList, 'title', 20, 'utf8');
                }
                $_value->list = $_navList;
            }
        }
        $this->_tpl->assign('FourNav', $_object);
    }


}