<?php

/**
 * Class Model
 */
class AdverModel extends Model
{
    private $id;
    private $type;
    private $link;
    private $title;
    private $state;
    private $thumbnail;
    private $info;
    private $kind;
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

    /**
     * @return int
     */
    public function addAdver()
    {

        $sql = "INSERT INTO cms_adver(title,link,thumbnail,info,type,state,date) VALUES ('$this->title','$this->link','$this->thumbnail','$this->info','$this->type',1,NOW())";
        return parent::aud($sql);
    }

    //获取等级总记录
    public function getAdverTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_adver WHERE type IN($this->kind)";
        return parent::total($_sql);
    }


    /**
     * 获取所有列表数据,带limit
     * @return array
     */
    public function getAllAdver()
    {
        $sql = "SELECT id,title,link,type,state FROM cms_adver WHERE type IN($this->kind) ORDER BY date DESC $this->_limit";
        return parent::all($sql);
    }


    //通过广告
    public function setStateOK()
    {
        $_sql = "UPDATE cms_adver SET state=1 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //取消广告
    public function setStateCancel()
    {
        $_sql = "UPDATE cms_adver SET state=0 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //查找单一广告
    public function getOneAdver()
    {
        $_sql = "SELECT id,title,link,info,thumbnail,state,type FROM cms_adver WHERE id='$this->id' LIMIT 1";
        return parent::one($_sql);
    }

    /**
     * 删除单个列表数据
     * @return int
     */
    public function deleteAdver()
    {
        $sql = "DELETE FROM cms_adver WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    public function  updateAdver()
    {

        $sql = "UPDATE cms_adver SET title='$this->title',state='$this->state',link='$this->link',info='$this->info',thumbnail='$this->thumbnail',type='$this->type' WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    //获取最新的N条文字广告
    public function getNewTextAdver()
    {
        $_sql = "SELECT title,link FROM cms_adver WHERE state=1 AND type=1 ORDER BY date DESC LIMIT 0," . ADVER_TEXT_NUM;
        return parent::all($_sql);
    }

    //获取最新的N条头部图片广告
    public function getNewHeaderAdver()
    {
        $_sql = "SELECT title,link,thumbnail FROM cms_adver WHERE state=1 AND type=2 ORDER BY date DESC LIMIT 0," . ADVER_PIC_NUM;
        return parent::all($_sql);
    }

    //获取最新的N条侧栏图片广告
    public function getNewSidebarAdver()
    {
        $_sql = "SELECT title,link,thumbnail FROM cms_adver WHERE state=1 AND type=3 ORDER BY date DESC LIMIT 0," . ADVER_PIC_NUM;
        return parent::all($_sql);
    }

}