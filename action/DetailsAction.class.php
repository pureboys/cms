<?php

class DetailsAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl);
    }

    public function _action()
    {
        $this->getDetails();
    }

    //获取文档详细内容
    private function getDetails()
    {
        if (isset($_GET['id'])) {
            parent::__construct($this->_tpl, new ContentModel());
            $this->_model->id = $_GET['id'];
            if (!IS_CACHE) $this->_model->setContentCount();
            $_content = $this->_model->getOneContent();
            if (!$_content) Tool::alertBack('警告：不存在此文档！');
            $_comment = new CommentModel();
            $_comment->cid = $this->_model->id;

            $tagArr = explode(',', $_content->tag);
            if (is_array($tagArr)) {
                foreach ($tagArr as $_value) {
                    $_content->tag = str_replace($_value, '<a target="_blank" href="search.php?type=3&inputkeyword=' . $_value . '">' . $_value . '</a>', $_content->tag);
                }
            }

            $this->_tpl->assign('id', $_content->id);
            $this->_tpl->assign('titles', $_content->title);
            $this->_tpl->assign('date', $_content->date);
            $this->_tpl->assign('author', $_content->author);
            $this->_tpl->assign('source', $_content->source);
            $this->_tpl->assign('info', $_content->info);
            $this->_tpl->assign('tag', $_content->tag);
            $this->_tpl->assign('content', Tool::unHtml($_content->content));
            $this->getNav($_content->nav);
            if (IS_CACHE) {
                $this->_tpl->assign('comment', "<script>getComment();</script>");
                $this->_tpl->assign('count', "<script>getContentCount();</script>");
            } else {
                $this->_tpl->assign('count', $_content->count);
            }

            $this->_tpl->assign('comment', $_comment->getCommentTotal());

            $_object = $_comment->getNewThreeComment();
            if ($_object) {
                foreach ($_object as $_value) {
                    switch ($_value->manner) {
                        case -1:
                            $_value->manner = '反对';
                            break;
                        case 0:
                            $_value->manner = '中立';
                            break;
                        case 1:
                            $_value->manner = '支持';
                            break;
                    }
                    if (empty($_value->face)) $_value->face = '00.gif';
                    if (!empty($_value->oppose)) $_value->oppose = '-' . $_value->oppose;
                }
            }
            $this->_tpl->assign('NewThreeComment', $_object);

            $this->_model->nav = $_content->nav;
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
            Tool::alertBack('警告：非法操作！');
        }
    }

    //set Object
    private function setObject(&$_object)
    {
        Tool::objDate($_object, 'date');
        Tool::subStr($_object, 'title', 14, 'utf8');
    }


    //获取前台显示导航
    private function getNav($_id)
    {
        $_nav = new NavModel();
        $_nav->id = $_id;
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
    }


}