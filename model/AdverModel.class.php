<?php

/**
 * Class Model
 */
class AdverModel extends Model
{
    private $type;

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



}