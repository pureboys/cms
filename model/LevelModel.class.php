<?php

/**
 * Class Model
 */
class LevelModel extends Model
{
    private $id;
    private $level_name;
    private $level_info;
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

    //获取等级总记录
    public function getLevelTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_level";
        return parent::total($_sql);
    }

    /**
     * 获取所有列表数据,不带limit
     * @return array
     */
    public function getAllLevel()
    {
        $sql = "SELECT id,level_name,level_info FROM cms_level ORDER BY id DESC";
        return parent::all($sql);
    }

    /**
     * 获取所有列表数据,带limit
     * @return array
     */
    public function getAllLimitLevel()
    {
        $sql = "SELECT id,level_name,level_info FROM cms_level ORDER BY id DESC $this->_limit";
        return parent::all($sql);
    }

    public function getOneLevel()
    {
        $sql = "SELECT id,level_name,level_info FROM cms_level WHERE id='$this->id' OR level_name='$this->level_name' LIMIT 1";
        return parent::one($sql);
    }


    /**
     * @return int
     */
    public function addLevel()
    {

        $sql = "INSERT INTO cms_level(level_name,level_info) VALUES ('$this->level_name','$this->level_info')";
        return parent::aud($sql);
    }

    public function  updateLevel()
    {

        $sql = "UPDATE cms_level SET level_name='$this->level_name',level_info='$this->level_info' WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    /**
     * 删除单个列表数据
     * @return int
     */
    public function deleteLevel()
    {
        $sql = "DELETE FROM cms_level WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }


}