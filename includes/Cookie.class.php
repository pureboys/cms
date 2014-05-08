<?php

class Cookie
{
    private $name;
    private $value;
    private $time;

    public function __construct($_name, $_value = '', $_time = 0)
    {
        $this->name = $_name;
        $this->value = $_value;
        if (!empty($_time)) {
            $this->time = $_time + time();
        } else {
            $this->time = 0;
        }
    }

    //创建cookie
    public function setCookie()
    {
        setcookie($this->name, $this->value, $this->time);
    }

    //获取
    public function getCookie()
    {
        if (empty($_COOKIE["$this->name"])) return false;
        return $_COOKIE["$this->name"];
    }

    //移除
    public function unCookie()
    {
        setcookie($this->name, '', -1);
    }


} 