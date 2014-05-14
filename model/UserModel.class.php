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
    private $state;
    private $email;
    private $question;
    private $answer;
    private $time;
    private $_limit;

    function __set($key, $value)
    {
        $_link = DB::getDB();
        $this->$key = Tool::mysqlString($_link, $value);
        $_result = null;
        DB::unDB($_result, $_link);
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

        $sql = "INSERT INTO cms_user(user,pass,email,face,state,question,answer,time,date) VALUES ('$this->user','$this->pass','$this->email','$this->face','$this->state','$this->question','$this->answer','$this->time',NOW())";
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

    //取得所有会员
    public function getAllUser()
    {
        $_sql = "SELECT id,user,email,state FROM cms_user ORDER BY date DESC $this->_limit";
        return parent::all($_sql);
    }

    //获取会员总数
    public function getUserTotal()
    {
        $_sql = "SELECT count(*) FROM cms_user";
        return parent::total($_sql);
    }

    //会员删除
    public function deleteUser()
    {
        $_sql = "DELETE FROM cms_user WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //查找单一会员
    public function getOneUser()
    {
        $_sql = "SELECT id,user,pass,face,email,question,answer,state FROM cms_user WHERE id='$this->id' LIMIT 1";
        return parent::one($_sql);
    }

    //修改会员
    public function updateUser()
    {
        $_sql = "UPDATE cms_user SET pass='$this->pass',face='$this->face',question='$this->question',answer='$this->answer',state='$this->state',email='$this->email' WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }


}