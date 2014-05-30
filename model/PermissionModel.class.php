<?php

/**
 * Class Model
 */
class PermissionModel extends Model
{

    private $id;
    private $name;
    private $info;
    private $_limit;

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


    /**
     * @return int
     */
    public function addPermission()
    {

        $sql = "INSERT INTO cms_permission(name,info) VALUES ('$this->name','$this->info')";
        return parent::aud($sql);
    }

    public function getOnePermission()
    {
        $sql = "SELECT id,name,info FROM cms_permission WHERE name='$this->name' OR id='$this->id' LIMIT 1";
        return parent::one($sql);
    }

    //获取总记录
    public function getPermissionTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_permission";
        return parent::total($_sql);
    }

    /**
     * 获取所有列表数据,带limit
     * @return array
     */
    public function getAllPermission()
    {
        $sql = "SELECT id,name,info FROM cms_permission ORDER BY id DESC $this->_limit";
        return parent::all($sql);
    }

    /**
     * 删除单个列表数据
     * @return int
     */
    public function deletePermission()
    {
        $sql = "DELETE FROM cms_permission WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    public function  updatePermission()
    {
        $sql = "UPDATE cms_permission SET name='$this->name',info='$this->info' WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }



}