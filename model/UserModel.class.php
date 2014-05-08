<?php

/**
 * Class Model
 */
class UserModel extends Model
{
    private $id;
    private $user;
    private $pass;
    private $face;
    private $email;
    private $question;
    private $answer;

    function __set($key, $value)
    {
        $this->$key = Tool::mysqlString($value);
    }

    function __get($key)
    {
        return $this->$key;
    }

    /**
     * @return int
     */
    public function addUser()
    {

        $sql = "INSERT INTO cms_user(user,pass,email,face,question,answer,date) VALUES ('$this->user','$this->pass','$this->email','$this->face','$this->question','$this->answer',NOW())";
        return parent::aud($sql);
    }

    //检查登录
    public function checkLogin()
    {
        $_sql = "SELECT user,pass FROM cms_user WHERE user='$this->user' AND pass='$this->pass' LIMIT 1";
        return parent::one($_sql);
    }

    //用户名重复
    public function checkUser()
    {
        $_sql = "SELECT id FROM cms_user WHERE user='$this->user' LIMIT 1";
        return parent::one($_sql);
    }

    public function checkEmail()
    {
        $_sql = "SELECT email FROM cms_user WHERE email='$this->email' LIMIT 1";
        return parent::one($_sql);
    }


}