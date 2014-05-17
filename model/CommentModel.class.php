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
        $_sql = "SELECT c.id,c.cid,c.user,c.manner,c.content,c.date,c.sustain,c.oppose,u.face FROM cms_comment AS c LEFT JOIN cms_user AS u ON c.user=u.user WHERE c.cid='$this->cid' ORDER BY c.date DESC " . $this->_limit;
        return parent::all($_sql);
    }

    //获取评论总量
    public function getCommentTotal()
    {
        $_sql = "SELECT count(*) FROM cms_comment WHERE cid='$this->cid'";
        return parent::total($_sql);
    }

    //支持
    public function setSustain()
    {
        $_sql = "UPDATE cms_comment SET sustain=sustain+1 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //反对
    public function setOppose()
    {
        $_sql = "UPDATE cms_comment SET oppose=oppose+1 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //查找单一评论
    public function getOneComment()
    {
        $_sql = "SELECT id FROM cms_comment WHERE id='$this->id' LIMIT 1";
        return parent::one($_sql);
    }

    //获取最新三条评论
    public function getNewThreeComment()
    {
        $_sql = "SELECT c.id,c.cid,c.user,c.manner,c.content,c.date,c.sustain,c.oppose,u.face FROM cms_comment AS c LEFT JOIN cms_user AS u ON c.user=u.user WHERE c.cid='$this->cid' ORDER BY c.date DESC LIMIT 0,3";
        return parent::all($_sql);
    }

    //获取三条最火评论 支持+反对=0 不显示
    public function getHotThreeComment()
    {
        $_sql = "SELECT c.id,c.cid,c.user,c.manner,c.content,c.date,c.sustain,c.oppose,u.face FROM cms_comment AS c LEFT JOIN cms_user AS u ON c.user=u.user WHERE c.cid='$this->cid' AND c.sustain+c.oppose>0 ORDER BY c.sustain+c.oppose DESC LIMIT 0,3";
        return parent::all($_sql);
    }




}