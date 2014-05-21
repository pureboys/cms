<?php

/**
 * Class Model
 */
class RotationModel extends Model
{
    private $id;
    private $thumbnail;
    private $link;
    private $title;
    private $info;
    private $state;
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
    public function addRotation()
    {
        $sql = "INSERT INTO cms_rotation(thumbnail,title,info,link,state,date) VALUES ('$this->thumbnail','$this->title','$this->info','$this->link',1,NOW())";
        return parent::aud($sql);
    }

    /**
     * 获取所有列表数据,带limit
     * @return array
     */
    public function getAllRotation()
    {
        $sql = "SELECT id,title,link,link full,state FROM cms_rotation ORDER BY state DESC,date DESC $this->_limit";
        return parent::all($sql);
    }

    //获取轮播器总数
    public function getRotationTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_rotation";
        return parent::total($_sql);
    }

    //通过轮播
    public function setStateOK()
    {
        $_sql = "UPDATE cms_rotation SET state=1 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //取消轮播
    public function setStateCancel()
    {
        $_sql = "UPDATE cms_rotation SET state=0 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //查找单一轮播
    public function getOneRotation()
    {
        $_sql = "SELECT id,title,link,info,thumbnail,state FROM cms_rotation WHERE id='$this->id' LIMIT 1";
        return parent::one($_sql);
    }

    //删除
    public function deleteRotation()
    {
        $_sql = "DELETE FROM cms_rotation WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //更新
    public function  updateRotation()
    {

        $_sql = "UPDATE cms_rotation SET thumbnail='$this->thumbnail',link='$this->link',title='$this->title',info='$this->info',state='$this->state' WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //获取系统指定个数最新的轮播器
    public function getNewRotation()
    {
        $_sql = "SELECT title,thumbnail,link FROM cms_rotation WHERE state=1 ORDER BY date DESC LIMIT 0," . RO_NUM;
        return parent::all($_sql);
    }


}