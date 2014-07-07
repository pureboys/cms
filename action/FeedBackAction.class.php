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
        $this->setCount();
        $this->showComment();
    }

    //新增评论
    private function addComment()
    {
        if (isset($_POST['send'])) {

            $_url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
            if ($_url == PREV_URL) {
                if (Validate::checkNull($_POST['content'])) Tool::alertBack("警告：内容不得为空");
                if (Validate::checkLength($_POST['content'], 255, 'max')) Tool::alertBack("警告：内容不得大于255位");
                if (Validate::checkLength($_POST['code'], 4, 'equals')) Tool::alertBack('验证码必须是4位');
                if (Validate::checkEquals(strtolower($_POST['code']), $_SESSION['code'])) Tool::alertBack('验证码不正确！');
            } else {
                if (Validate::checkNull($_POST['content'])) Tool::alertClose("警告：内容不得为空");
                if (Validate::checkLength($_POST['content'], 255, 'max')) Tool::alertClose("警告：内容不得大于255位");
                if (Validate::checkLength($_POST['code'], 4, 'equals')) Tool::alertClose('验证码必须是4位');
                if (Validate::checkEquals(strtolower($_POST['code']), $_SESSION['code'])) Tool::alertClose('验证码不正确！');
            }
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
            $_content = new ContentModel();
            $_content->id = $this->_model->cid;
            if (!$_content->getOneContent()) Tool::alertBack('警告不存在文档评论!');
            parent::page($this->_model->getCommentTotal());
            $_object = $this->_model->getAllComment();
            $_object2 = $this->_model->getHotThreeComment();
            $_object3 = $_content->getHotTwentyComment();
            $this->setObject($_object);
            $this->setObject($_object2);

            $this->_tpl->assign('id', $_content->getOneContent()->id);
            $this->_tpl->assign('titlec', $_content->getOneContent()->title);
            $this->_tpl->assign('info', $_content->getOneContent()->info);
            $this->_tpl->assign('cid', $this->_model->cid);
            $this->_tpl->assign('AllComment', $_object);
            $this->_tpl->assign('HotThreeComment', $_object2);
            $this->_tpl->assign('HotTwentyComment', $_object3);
        } else {
            Tool::alertBack('警告：非法操作！');
        }
    }

    //支持 反对
    private function setCount()
    {
        if (isset($_GET['cid']) && isset($_GET['id']) && isset($_GET['type'])) {
            $this->_model->id = $_GET['id'];
            if (!$this->_model->getOneComment()) Tool::alertBack('警告：不存在此评论!');
            if ($_GET['type'] == 'sustain') {
                $this->_model->setSustain() ? Tool::alertLocation('支持成功！', '/feedback.php?cid=' . $_GET['cid']) : Tool::alertLocation('支持失败！', '/feedback.php?cid=' . $_GET['cid']);
            } else if ($_GET['type'] == 'oppose') {
                $this->_model->setOppose() ? Tool::alertLocation('反对成功！', '/feedback.php?cid=' . $_GET['cid']) : Tool::alertLocation('反对失败！', '/feedback.php?cid=' . $_GET['cid']);
            }
        }
    }

    //转换
    private function setObject(&$_object)
    {
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
    }


}