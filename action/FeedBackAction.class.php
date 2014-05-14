<?php

class FeedBackAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new CommentModel());
    }

    public function _action()
    {
        $this->addComment();
        $this->showComment();
    }

    //新增评论
    private function addComment()
    {
        if (isset($_POST['send'])) {
            $_cookie = new Cookie('user');
            if ($_cookie->getCookie()) {
                $this->_model->user = $_cookie->getCookie();
            } else {
                $this->_model->user = '游客';
            }
            $this->_model->manner = $_POST['manner'];
            $this->_model->content = $_POST['content'];
            $this->_model->cid = $_GET['cid'];
            $this->_model->addComment() ? Tool::alertLocation('新增添加评论成功！请等待管理员审核', '/feedback.php?cid=' . $this->_model->cid) : Tool::alertLocation('新增添加评论失败！请重新添加', '/feedback.php?cid=' . $this->_model->cid);
        }
    }

    //显示评论
    private function showComment()
    {
        if (isset($_GET['cid'])) {
            $this->_model->cid = $_GET['cid'];
            parent::page($this->_model->getCommentTotal());
            $_object = $this->_model->getAllComment();
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
                    if(empty($_value->face)) $_value->face = '00.gif';
                }
            }
            $this->_tpl->assign('AllComment', $_object);
        } else {
            Tool::alertBack('警告：非法操作！');
        }
    }


}