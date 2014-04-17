<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 14-4-11
 * Time: 下午1:19
 */

class Model {

    /**
     * 增删修改模型
     * @param $sql
     * @return int
     */
    protected function aud($sql)
    {
        $_db = DB::getDB();
        $_result = $_db->query($sql);
        $_affected_rows = $_db->affected_rows;
        DB::unDB($_result, $_db);
        return $_affected_rows;
    }

    /**
     * 查找单个数据模型
     * @param $sql
     * @return object|stdClass
     */
    protected function one($sql)
    {
        $_db = DB::getDB();
        $_result = $_db->query($sql);
        $_objects = $_result->fetch_object();
        DB::unDB($_result, $_db);
        return $_objects;
    }


    protected function all($sql)
    {
        $_db = DB::getDB();
        $_result = $_db->query($sql);
        $html = array();
        while ($row = $_result->fetch_object()) {
            $html[] = $row;
        }
        DB::unDB($_result, $_db);
        return $html;
    }

    //查找总记录模型
    protected function total($sql)
    {
        $_db = DB::getDB();
        $_result = $_db->query($sql);
        $_total = $_result->fetch_row();
        DB::unDB($_result,$_db);
        return $_total[0];
    }




} 