<?php

/**
 * Class Model
 */
class ContentModel extends Model
{


    function __set($key, $value)
    {
        $this->$key = Tool::mysqlString($value);
    }

    function __get($key)
    {
        return $this->$key;
    }


}