<?php

/**
 * Class Model
 */
class CommentModel extends Model
{
    private $id;
    private $user;
    private $manner;
    private $content;
    private $cid;
    private $_limit;

    function __set($key, $value)
    {
        $_link = DB::getDB();
        $this->$key = Tool::mysqlString($_link, $value);
        $_result = null;
        DB::unDB($_result, $_link);
    }

    function __get($key)
    {
        return $this->$key;
    }

    //新增评论
    public function addComment()
    {
        $_sql = "INSERT INTO cms_comment(user,manner,content,cid,date) VALUES ('$this->user','$this->manner','$this->content','$this->cid',NOW())";
        return parent::aud($_sql);
    }

    //分页评论
    public function getAllComment()
    {
        $_sql = "SELECT c.user,c.manner,c.content,c.date,u.face FROM cms_comment AS c LEFT JOIN cms_user AS u ON c.user=u.user WHERE c.cid='$this->cid' ORDER BY date DESC ".$this->_limit;
        return parent::all($_sql);
    }

    //获取评论总量
    public function getCommentTotal()
    {
        $_sql = "SELECT count(*) FROM cms_comment WHERE cid='$this->cid'";
        return parent::total($_sql);
    }


}