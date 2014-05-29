<?php

class SearchAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl,new ContentModel());
    }

    public function _action()
    {
        $this->searchTitle();
        $this->searchKeyword();
        $this->searchTag();
        $this->getNav();
    }

    //按照标题搜索
    private function searchTitle(){
        if($_GET['type'] == 1){
            if(empty($_GET['inputkeyword'])) Tool::alertBack('警告：搜索关键字不能为空!');
            $this->_model->inputkeyword = $_GET['inputkeyword'];

            parent::page($this->_model->searchTitleContentTotal(), ARTICLE_SIZE);
            $_object = $this->_model->searchTitleContent();
            if ($_object) {
                Tool::subStr($_object, 'info', 120, 'utf8');
                Tool::subStr($_object, 'title', 35, 'utf8');
                foreach ($_object as $_value) {
                    if (empty($_value->thumbnail)) $_value->thumbnail = '/images/none.jpg';
                    $_value->title = str_replace($this->_model->inputkeyword,'<span class="red">'.$this->_model->inputkeyword.'</span>',$_value->title);
                }
            }
            $this->_tpl->assign('SearchContent', $_object);
        }
    }

    //按照关键字搜索
    private function searchKeyword(){
        if($_GET['type'] == 2){
            if(empty($_GET['inputkeyword'])) Tool::alertBack('警告：搜索关键字不能为空!');
            $this->_model->inputkeyword = $_GET['inputkeyword'];

            parent::page($this->_model->searchKeywordContentTotal(), ARTICLE_SIZE);
            $_object = $this->_model->searchKeywordContent();
            if ($_object) {
                Tool::subStr($_object, 'info', 120, 'utf8');
                Tool::subStr($_object, 'title', 35, 'utf8');
                foreach ($_object as $_value) {
                    if (empty($_value->thumbnail)) $_value->thumbnail = '/images/none.jpg';
                    $_value->keyword = str_replace($this->_model->inputkeyword,'<span class="red">'.$this->_model->inputkeyword.'</span>',$_value->keyword);
                }
            }
            $this->_tpl->assign('SearchContent', $_object);
        }
    }

    //按照tag标签搜索
    private function searchTag(){
        if($_GET['type'] == 3){
            $this->_model->inputkeyword = $_GET['inputkeyword'];

            parent::page($this->_model->searchTagContentTotal(), ARTICLE_SIZE);
            $_object = $this->_model->searchTagContent();
            if ($_object) {
                Tool::subStr($_object, 'info', 120, 'utf8');
                Tool::subStr($_object, 'title', 35, 'utf8');
                foreach ($_object as $_value) {
                    if (empty($_value->thumbnail)) $_value->thumbnail = '/images/none.jpg';
                }
            }

            $_tag = new TagModel();
            $_tag->tagname =  $this->_model->inputkeyword;
            $_tag->getOneTag() ? $_tag->addTagCount() :  $_tag->addTag();

            $this->_tpl->assign('SearchContent', $_object);
        }
    }

    //右侧栏目
    private function getNav(){
        //本月本类推荐
        $_object = $this->_model->getAllNavRec();
        if ($_object) $this->setObject($_object);
        $this->_tpl->assign('NavRec', $_object);
        //本类热点推荐
        $_object = $this->_model->getAllNavHot();
        if ($_object) $this->setObject($_object);
        $this->_tpl->assign('NavHot', $_object);
        //本类图文推荐
        $_object = $this->_model->getAllNavPic();
        if ($_object) $this->setObject($_object);
        $this->_tpl->assign('NavPic', $_object);
    }

    //set Object
    private function setObject(&$_object)
    {
        Tool::objDate($_object, 'date');
        Tool::subStr($_object, 'title', 14, 'utf8');
    }


}