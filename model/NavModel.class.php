<?php

/**
 * Class Model
 */
class NavModel extends Model
{
    private $id;
    private $nav_name;
    private $nav_info;
    private $pid;
    private $sort;
    private $_limit;

    function __set($key, $value)
    {
        $this->$key = Tool::mysqlString($value);
    }

    function __get($key)
    {
        return $this->$key;
    }

    public function getOneNav()
    {
        $sql = "SELECT id,nav_name,nav_info FROM cms_nav WHERE id='$this->id' OR nav_name='$this->nav_name' LIMIT 1";
        return parent::one($sql);
    }

    //获取总记录
    public function getNavTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_nav";
        return parent::total($_sql);
    }


    /**
     * 获取所有列表数据
     * @return array
     */
    public function getAllNav()
    {
        $sql = "SELECT id,nav_name,nav_info FROM cms_nav $this->_limit";
        return parent::all($sql);
    }

    /**
     * @return int
     */
    public function addNav()
    {

        $sql = "INSERT INTO cms_nav(nav_name,nav_info,pid,sort) VALUES ('$this->nav_name','$this->nav_info',0," . parent::nextId('cms_nav') . ")";
        return parent::aud($sql);
    }

    public function  updateNav()
    {
        $sql = "UPDATE cms_nav SET nav_name='$this->nav_name',nav_info='$this->nav_info' WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    /**
     * 删除单个列表数据
     * @return int
     */
    public function deleteNav()
    {
        $sql = "DELETE FROM cms_nav WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

}