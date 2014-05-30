<?php

/**
 * Class Model
 */
class SystemModel extends Model
{

    private $webname;
    private $page_size;
    private $article_size;
    private $nav_size;
    private $updir;
    private $ro_time;
    private $ro_num;
    private $adver_text_num;
    private $adver_pic_num;

    function __set($key, $value)
    {
        $_link = DB::getDB();
        $this->$key = Tool::mysqlString($_link,$value);
        $_result = null;
        DB::unDB($_result,$_link);
    }

    function __get($key)
    {
        return $this->$key;
    }

    //获取数据
    public function getSystem(){
        $_sql = "SELECT webname,page_size,article_size,nav_size,updir,ro_time,ro_num,adver_text_num,adver_pic_num FROM cms_system WHERE id=1";
        return parent::one($_sql);
    }

    //修改数据
    public function setSystem(){
        $_sql = "UPDATE cms_system SET webname='$this->webname',page_size='$this->page_size',article_size='$this->article_size',nav_size='$this->nav_size',updir='$this->updir',ro_time='$this->ro_time',ro_num='$this->ro_num',adver_text_num='$this->adver_text_num',adver_pic_num='$this->adver_pic_num' WHERE id=1";
        return parent::aud($_sql);
    }



}