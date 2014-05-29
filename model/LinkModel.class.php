<?php

/**
 * Class Model
 */
class LinkModel extends Model
{
    private $id;
    private $webname;
    private $weburl;
    private $logourl;
    private $user;
    private $type;
    private $state;
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
    public function addLink()
    {

        $sql = "INSERT INTO cms_link(webname,weburl,logourl,user,type,state,date) VALUES ('$this->webname','$this->weburl','$this->logourl','$this->user','$this->type','$this->state',NOW())";
        return parent::aud($sql);
    }

    /**
     * 获取所有列表数据,带limit
     * @return array
     */
    public function getAllLink()
    {
        $sql = "SELECT id,webname,weburl,weburl fullweburl,logourl,logourl fulllogourl,type,state,user FROM cms_link ORDER BY date DESC $this->_limit";
        return parent::all($sql);
    }

    //获取等级总记录
    public function getLinkTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_link";
        return parent::total($_sql);
    }


    //通过审核
    public function setStateOK()
    {
        $_sql = "UPDATE cms_link SET state=1 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //取消审核
    public function setStateCancel()
    {
        $_sql = "UPDATE cms_link SET state=0 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }


    //查找单一友情连接
    public function getOneLink()
    {
        $_sql = "SELECT id,webname,weburl,logourl,type,state,user FROM cms_link WHERE id='$this->id' LIMIT 1";
        return parent::one($_sql);
    }


    /**
     * 删除单个列表数据
     * @return int
     */
    public function deleteLink()
    {
        $sql = "DELETE FROM cms_link WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    public function  updateLink()
    {
        $sql = "UPDATE cms_link SET webname='$this->webname',weburl='$this->weburl',logourl='$this->logourl',state='$this->state',type='$this->type',user='$this->user' WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    //前20个文字连接
    public function getTwentyTextLink(){
        $sql = "SELECT webname,weburl FROM cms_link WHERE type=1 AND state=1 ORDER BY date DESC LIMIT 0,20";
        return parent::all($sql);
    }

    //前9个logo连接
    public function getNineLogoLink(){
        $sql = "SELECT webname,weburl,logourl FROM cms_link WHERE type=2 AND state=1 ORDER BY date DESC LIMIT 0,9";
        return parent::all($sql);
    }

    //所有文字连接
    public function getAllTextLink(){
        $sql = "SELECT webname,weburl FROM cms_link WHERE type=1 AND state=1 ORDER BY date DESC";
        return parent::all($sql);
    }

    //所有logo连接
    public function getAllLogoLink(){
        $sql = "SELECT webname,weburl,logourl FROM cms_link WHERE type=2 AND state=1 ORDER BY date DESC";
        return parent::all($sql);
    }


}