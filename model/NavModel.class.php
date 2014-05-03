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
        $sql = "SELECT n1.id,n1.nav_name,n1.nav_info,n2.id iid,n2.nav_name nnav_name FROM cms_nav n1 LEFT JOIN cms_nav n2 ON n1.pid=n2.id WHERE n1.id='$this->id' OR n1.nav_name='$this->nav_name' LIMIT 1";
        return parent::one($sql);
    }

    //获取总记录
    public function getNavTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_nav WHERE pid=0";
        return parent::total($_sql);
    }

    //获取子导航总记录
    public function getNavChildTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_nav WHERE pid='$this->id'";
        return parent::total($_sql);
    }

    /**
     * 获取所有列表数据,查询所有主导航带limit
     * @return array
     */
    public function getAllNav()
    {
        $sql = "SELECT id,nav_name,nav_info,sort FROM cms_nav WHERE pid=0 ORDER BY sort ASC $this->_limit";
        return parent::all($sql);
    }

    //查询所有主导航不带limit
    public function getAllFrontNav()
    {
        $sql = "SELECT id,nav_name,nav_info,sort FROM cms_nav WHERE pid=0 ORDER BY sort ASC";
        return parent::all($sql);
    }


    //查看子导航数据
    public function getAllChildNav()
    {
        $sql = "SELECT id,nav_name,nav_info,sort FROM cms_nav WHERE pid='$this->id' ORDER BY sort ASC $this->_limit";
        return parent::all($sql);
    }

    //查看子导航数据，不带limit
    public function getAllChildFrontNav()
    {
        $sql = "SELECT id,nav_name,nav_info,sort FROM cms_nav WHERE pid='$this->id' ORDER BY sort ASC";
        return parent::all($sql);
    }

    /**
     * @return int
     */
    public function addNav()
    {

        $sql = "INSERT INTO cms_nav(nav_name,nav_info,pid,sort) VALUES ('$this->nav_name','$this->nav_info','$this->pid'," . parent::nextId('cms_nav') . ")";
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

    //前台显示指定的主导航
    public function getFrontNav()
    {
        $sql = "SELECT id,nav_name FROM cms_nav WHERE pid=0 ORDER BY sort ASC LIMIT 0," . NAV_SIZE;
        return parent::all($sql);
    }

    //导航排序
    public function setNavSort()
    {
        $sql = "";
        foreach ($this->sort as $_key => $_value) {
            if (!is_numeric($_value)) continue;
            $sql .= "UPDATE cms_nav SET sort='$_value' WHERE id='$_key';";
        }
        return parent::multi($sql);
    }


}