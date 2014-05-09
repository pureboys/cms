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
    private $time;

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

    /**
     * @return int
     */
    public function addUser()
    {

        $sql = "INSERT INTO cms_user(user,pass,email,face,question,answer,time,date) VALUES ('$this->user','$this->pass','$this->email','$this->face','$this->question','$this->answer','$this->time',NOW())";
        return parent::aud($sql);
    }

    //检查登录
    public function checkLogin()
    {
        $_sql = "SELECT id,user,pass,face FROM cms_user WHERE user='$this->user' AND pass='$this->pass' LIMIT 1";
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

    //更新登录、注册时间戳
    public function setLaterUser()
    {
        $_sql = "UPDATE cms_user SET time='$this->time' WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //获取最近6条会员
    public function getLaterUser()
    {
        $_sql = "SELECT id,user,face FROM cms_user ORDER BY time DESC LIMIT 0,6";
        return parent::all($_sql);
    }


}