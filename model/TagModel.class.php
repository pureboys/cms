<?php

/**
 * Class Model
 */
class TagModel extends Model
{

    private $id;
    private $count;
    private $tagname;

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
    public function addTag()
    {

        $sql = "INSERT INTO cms_tag(tagname) VALUES ('$this->tagname')";
        return parent::aud($sql);
    }
    //当tag存在时+1
    public function addTagCount(){
        $_sql = "UPDATE cms_tag SET count=count+1 WHERE tagname='$this->tagname'";
        return parent::aud($_sql);
    }

    //查找单一
    public function getOneTag(){
        $_sql = "SELECT id FROM cms_tag WHERE tagname='$this->tagname' LIMIT 1";
        return parent::one($_sql);
    }
    //找出tag的前5条数据
    public function getFiveTag(){
        $_sql = "SELECT tagname,count FROM cms_tag ORDER BY count DESC LIMIT 0,5";
        return parent::all($_sql);
    }





}