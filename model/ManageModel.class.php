<?php

/**
 * Class Model
 */
class ManageModel extends Model
{
    private $id;
    private $_admin_user;
    private $_admin_pass;
    private $_level;

    function __set($key, $value)
    {
        $this->$key = $value;
    }

    function __get($key)
    {
        return $key;
    }

    public function getAllLevel()
    {
        $sql = "SELECT id,level_name FROM cms_level ORDER BY id ASC";
        return parent::all($sql);
    }


    /**
     * 获取所有列表数据
     * @return array
     */
    public function getAllManage()
    {
        $sql = "SELECT m.id,m.admin_user,l.level_name,m.last_ip,m.last_time,m.reg_time FROM cms_manage as m,cms_level as l WHERE m.level=l.id ORDER BY id ASC LIMIT 0,20";
        return parent::all($sql);
    }

    public function getOneManage()
    {
        $sql = "SELECT id,admin_user,admin_pass,level FROM cms_manage WHERE id='$this->id' LIMIT 1";
        return parent::one($sql);
    }


    /**
     * @return int
     */
    public function addManage()
    {

        $sql = "INSERT INTO cms_manage(admin_user,admin_pass,level,reg_time) values ('$this->_admin_user','$this->_admin_pass','$this->_level',NOW())";
        return parent::aud($sql);
    }

    public function  updateManage()
    {

        $sql = "UPDATE cms_manage SET admin_pass='$this->_admin_pass',level='$this->_level' WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    /**
     * 删除单个列表数据
     * @return int
     */
    public function deleteManage()
    {
        $sql = "DELETE FROM cms_manage WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }


}