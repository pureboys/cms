<?php

/**
 * Class Model
 */
class VoteModel extends Model
{
    private $id;
    private $title;
    private $info;
    private $vid;
    private $count;
    private $state;
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

    /**
     * @return int
     */
    public function addVote()
    {

        $sql = "INSERT INTO cms_vote(title,info,vid,date) VALUES ('$this->title','$this->info','$this->vid',NOW())";
        return parent::aud($sql);
    }

    //获取投票主题总记录
    public function getVoteTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_vote WHERE vid=0";
        return parent::total($_sql);
    }

    /**
     * 获取所有投票主题数据,带limit
     * @return array
     */
    public function getAllVote()
    {
        $sql = "SELECT id,title,state FROM cms_vote WHERE vid=0 ORDER BY date DESC $this->_limit";
        return parent::all($sql);
    }


    //获取投票项目总记录
    public function getChildVoteTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_vote WHERE vid='$this->id'";
        return parent::total($_sql);
    }

    /**
     * 获取所有投票项目数据,带limit
     * @return array
     */
    public function getAllChildVote()
    {
        $sql = "SELECT id,title,count FROM cms_vote WHERE vid='$this->id' ORDER BY date DESC $this->_limit";
        return parent::all($sql);
    }


    //查找单一
    public function getOneVote()
    {
        $sql = "SELECT id,title,info FROM cms_vote WHERE id='$this->id' LIMIT 1";
        return parent::one($sql);
    }

    /**
     * 删除单个列表数据
     * @return int
     */
    public function deleteVote()
    {
        $sql = "DELETE FROM cms_vote WHERE id='$this->id' OR vid='$this->id'";
        return parent::aud($sql);
    }

    //修改
    public function  updateVote()
    {

        $sql = "UPDATE cms_vote SET title='$this->title',info='$this->info' WHERE id='$this->id' LIMIT 1";
        return parent::aud($sql);
    }

    //通过投票
    public function setStateOK()
    {
        $_sql = "UPDATE cms_vote SET state=1 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //取消投票
    public function setStateCancel()
    {
        $_sql = "UPDATE cms_vote SET state=0 WHERE state=1 LIMIT 1";
        return parent::aud($_sql);
    }


}