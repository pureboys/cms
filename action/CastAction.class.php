<?php

class CastAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new VoteModel());
    }

    public function _action()
    {
        $this->setCount();
        $this->getVote();
    }

    //累计
    private function setCount()
    {
        if (isset($_POST['send'])) {
            if (empty($_POST['vote'])) {
                Tool::alertClose('请选择一个投票！');
            }
            if (isset($_COOKIE['ip']) && $_COOKIE['ip'] == $_SERVER['REMOTE_ADDR']) {
                if(time()-$_COOKIE['time'] < 86400){
                    Tool::alertLocation('您已经参与了，请不要重复!','cast.php');
                }
            }
            $this->_model->id = $_POST['vote'];
            $this->_model->setCount();
            setcookie('ip', $_SERVER['REMOTE_ADDR']);
            setcookie('time', time());
            Tool::alertLocation('投票成功！感谢参与！', 'cast.php');
        }
    }

    //获取投票
    private function getVote()
    {
        $_vote = new VoteModel();
        $_sum = $_vote->getVoteSum()->c;
        $_width = 400; //图形的表格的宽度
        $this->_tpl->assign('width', $_width);
        $this->_tpl->assign('vote_title', $_vote->getVoteTitle()->title);
        $_object = $_vote->getVoteItem();
        if ($_object) {
            $i = 1;
            foreach ($_object as $_value) {
                $_value->percent = round($_value->count / $_sum * 100, 2) . '%';
                $_value->picwidth = $_value->count / $_sum * $_width;
                $_value->picnum = $i;
                $i++;
            }
        }
        $this->_tpl->assign('vote_item', $_object);

    }

}