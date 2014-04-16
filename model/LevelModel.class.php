<?php

/**
 * Class Model
 */
class LevelModel extends Model
{
    private $id;
    private $level_name;
    private $level_info;

    function __set($key, $value)
    {
        $this->$key = $value;
    }

    function __get($key)
    {
        return $key;
    }


    /**
     * 获取所有列表数据
     * @return array
     */
    public function getAllLevel()
    {
        $sql = "SELECT id,level_name,level_info FROM cms_level ORDER BY id ASC LIMIT 0,20";
        return parent::all($sql);
    }

    public function getOneLevel()
    {
        $sql = "SELECT id,level_name,level_info FROM cms_level WHERE id='$this->id' LIMIT 1";
        return parent::one($sql);
    }


    /**
     * @return int
     */
    public function addLevel()
    {

        $sql = "INSERT INTO cms_level(level_name,level_info) values ('$this->level_name','$this->level_info')";
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