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
    private $_limit;
    private $_last_ip;

    function __set($key, $value)
    {
        $this->$key = Tool::mysqlString($value);
    }

    function __get($key)
    {
        return $this->$key;
    }

    //获取管理员总记录
    public function getManageTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_manage";
        return parent::total($_sql);
    }

    /**
     * 获取所有列表数据
     * @return array
     */
    public function getAllManage()
    {
        $sql = "SELECT m.id,m.admin_user,l.level_name,m.last_ip,m.last_time,m.reg_time FROM cms_manage AS m,cms_level AS l WHERE m.level=l.id ORDER BY m.id DESC $this->_limit";
        return parent::all($sql);
    }

    public function getOneManage()
    {
        $sql = "SELECT id,admin_user,admin_pass,level FROM cms_manage WHERE id='$this->id' OR admin_user='$this->_admin_user' OR level='$this->_level' LIMIT 1";
        return parent::one($sql);
    }

    //查询登录管理员
    public function getLoginManage()
    {
        $_sql = "SELECT m.admin_user,l.level_name FROM cms_manage m,cms_level l WHERE m.admin_user='$this->_admin_user' AND m.admin_pass='$this->_admin_pass' AND m.level=l.id LIMIT 1";
        return parent::one($_sql);
    }

    /**
     * @return int
     */
    public function addManage()
    {

        $sql = "INSERT INTO cms_manage(admin_user,admin_pass,level,reg_time) VALUES ('$this->_admin_user','$this->_admin_pass','$this->_level',NOW())";
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

    //设置管理员登录统计次数、ip、时间
    public function setLoginCount()
    {
        $_sql = "UPDATE cms_manage SET login_count=login_count+1,last_ip='$this->_last_ip',last_time=NOW() WHERE  admin_user='$this->_admin_user' LIMIT 1";
        return parent::aud($_sql);
    }

}