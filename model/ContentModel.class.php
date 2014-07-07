<?php

/**
 * Class Model
 */
class ContentModel extends Model
{
    private $id;
    private $title;
    private $nav;
    private $attr;
    private $tag;
    private $keyword;
    private $thumbnail;
    private $info;
    private $source;
    private $author;
    private $content;
    private $gold;
    private $commend;
    private $count;
    private $color;
    private $_limit;
    private $sort;
    private $inputkeyword;
    private $readlimit;

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
    public function addContent()
    {

        $sql = "INSERT INTO cms_content(title,nav,info,thumbnail,source,author,tag,keyword,attr,content,commend,count,gold,color,sort,readlimit,date) VALUES ('$this->title','$this->nav','$this->info','$this->thumbnail','$this->source','$this->author','$this->tag','$this->keyword','$this->attr','$this->content','$this->commend','$this->count','$this->gold','$this->color','$this->sort','$this->readlimit',NOW())";
        return parent::aud($sql);
    }

    //修改文档
    public function updateContent()
    {
        $_sql = "UPDATE cms_content SET title='$this->title',nav='$this->nav',info='$this->info',thumbnail='$this->thumbnail',source='$this->source',author='$this->author',tag='$this->tag',keyword='$this->keyword',attr='$this->attr',content='$this->content',commend='$this->commend',count='$this->count',gold='$this->gold',color='$this->color',sort='$this->sort',readlimit='$this->readlimit' WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //删除文档
    public function deleteContent()
    {
        $_sql = "DELETE FROM cms_content WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }


    //获取文档列表
    public function getListContent()
    {
        $_sql = "SELECT c.id,c.title,c.title t,c.date,c.info,c.thumbnail,c.count,c.attr,c.keyword,c.gold,c.nav,n.nav_name FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.nav IN ($this->nav) ORDER BY c.date DESC " . $this->_limit;
        return parent::all($_sql);
    }


    //获取文档总记录
    public function getListContentTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.nav IN ($this->nav)";
        return parent::total($_sql);
    }

    //获取单一的文档内容
    public function getOneContent()
    {
        $_sql = "SELECT id,title,nav,content,info,date,count,author,source,tag,keyword,thumbnail,gold,attr,color,sort,readlimit,commend FROM cms_content WHERE id='$this->id'";
        return parent::one($_sql);
    }

    //累计文档点击
    public function setContentCount()
    {
        $_sql = "UPDATE cms_content SET count=count+1 WHERE id='$this->id' LIMIT 1";
        return parent::aud($_sql);
    }

    //获取总排行榜，文档评论量从大到小
    public function getHotTwentyComment()
    {
        $_sql = "SELECT ct.id,ct.title FROM cms_content AS ct ORDER BY (SELECT COUNT(*) FROM cms_comment AS c WHERE c.cid=ct.id) DESC LIMIT 0,20";
        return parent::all($_sql);
    }

    //获取本月本类推荐排行榜
    public function getMonthNavRec()
    {
        $_sql = "SELECT id,title,date FROM cms_content WHERE nav IN($this->nav) AND MONTH(NOW())=DATE_FORMAT(date,'%c') AND attr LIKE '%推荐%' ORDER BY date DESC LIMIT 0,10";
        return parent::all($_sql);
    }

    //获取本类总推荐排行榜
    public function getAllNavRec()
    {
        $_sql = "SELECT id,title,date FROM cms_content WHERE attr LIKE '%推荐%' ORDER BY date DESC LIMIT 0,10";
        return parent::all($_sql);
    }


    //获取本月本类热点评论排行榜
    public function getMonthNavHot()
    {
        $_sql = "SELECT ct.id,ct.title,ct.date FROM cms_content AS ct WHERE ct.nav IN($this->nav) AND MONTH(NOW())=DATE_FORMAT(date,'%c')  ORDER BY (SELECT COUNT(*) FROM cms_comment AS c WHERE c.cid=ct.id) DESC,ct.date DESC LIMIT 0,10";
        return parent::all($_sql);
    }

    //获取本类总热点评论排行榜
    public function getAllNavHot()
    {
        $_sql = "SELECT ct.id,ct.title,ct.date FROM cms_content AS ct ORDER BY (SELECT COUNT(*) FROM cms_comment AS c WHERE c.cid=ct.id) DESC,ct.date DESC LIMIT 0,10";
        return parent::all($_sql);
    }

    //获取本月本类图文排行榜
    public function getMonthNavPic()
    {
        $_sql = "SELECT id,title,date FROM cms_content WHERE nav IN($this->nav) AND MONTH(NOW())=DATE_FORMAT(date,'%c') AND thumbnail<>'' ORDER BY date DESC LIMIT 0,10";
        return parent::all($_sql);
    }

    //获取本月本类图文排行榜
    public function getAllNavPic()
    {
        $_sql = "SELECT id,title,date FROM cms_content WHERE thumbnail<>'' ORDER BY date DESC LIMIT 0,10";
        return parent::all($_sql);
    }

    //获取最新7条推荐文档
    public function getNewRecList()
    {
        $_sql = "SELECT id,title,date FROM cms_content WHERE attr LIKE '%推荐%' ORDER BY date DESC LIMIT 0,7";
        return parent::all($_sql);
    }

    //获取本月的点击量，总排行
    public function getMonthHotList()
    {
        $_sql = "SELECT id,title,date FROM cms_content WHERE MONTH(NOW())=DATE_FORMAT(date,'%c') ORDER BY count DESC LIMIT 0,7";
        return parent::all($_sql);
    }

    //获取本月评论排行
    public function getMonthCommentList()
    {
        $_sql = "SELECT ct.id,ct.title,ct.date FROM cms_content AS ct WHERE MONTH(NOW())=DATE_FORMAT(date,'%c')  ORDER BY (SELECT COUNT(*) FROM cms_comment AS c WHERE c.cid=ct.id) DESC,ct.date DESC LIMIT 0,10";
        return parent::all($_sql);
    }

    //获取图文咨询
    public function getPicList()
    {
        $_sql = "SELECT id,title,thumbnail FROM cms_content WHERE thumbnail<>'' ORDER BY date DESC LIMIT 0,4";
        return parent::all($_sql);
    }

    //获取最新的一条头条
    public function getNewTop()
    {
        $_sql = "SELECT id,title,info FROM cms_content WHERE attr LIKE '%头条%' ORDER BY date DESC LIMIT 1";
        return parent::one($_sql);
    }

    //获取2-5条头条
    public function getNewTopList()
    {
        $_sql = "SELECT id,title FROM cms_content WHERE attr LIKE '%头条%' ORDER BY date DESC LIMIT 1,4";
        return parent::all($_sql);
    }

    //获取最新的9条文档
    public function getNewList()
    {
        $_sql = "SELECT id,title,date FROM cms_content ORDER BY date DESC LIMIT 0,9";
        return parent::all($_sql);
    }

    //获取每个主栏目所有11条的最新文档
    public function getNewNavList(){
        $_sql = "SELECT id,title,date FROM cms_content WHERE nav IN(SELECT id FROM cms_nav WHERE pid='$this->nav') ORDER BY date DESC LIMIT 0,11";
        return parent::all($_sql);
    }

    //获取按标题搜索的文档列表
    public function searchTitleContent(){
        $_sql = "SELECT c.id,c.title,c.title t,c.date,c.info,c.thumbnail,c.count,c.attr,c.keyword,c.gold,c.nav,n.nav_name FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.title LIKE '%$this->inputkeyword%' ORDER BY c.date DESC " . $this->_limit;
        return parent::all($_sql);
    }

// 按照标题搜索的文档总记录
    public function searchTitleContentTotal(){
        $_sql = "SELECT COUNT(*) FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.title LIKE '%$this->inputkeyword%'";
        return parent::total($_sql);
    }

    //获取按关键字搜索的文档列表
    public function searchKeywordContent(){
        $_sql = "SELECT c.id,c.title,c.title t,c.date,c.info,c.thumbnail,c.count,c.attr,c.keyword,c.gold,c.nav,n.nav_name FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.keyword LIKE '%$this->inputkeyword%' ORDER BY c.date DESC " . $this->_limit;
        return parent::all($_sql);
    }

    // 按照关键字搜索的文档总记录
    public function searchKeywordContentTotal(){
        $_sql = "SELECT COUNT(*) FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.keyword LIKE '%$this->inputkeyword%'";
        return parent::total($_sql);
    }

    //获取按tag搜索的文档列表
    public function searchTagContent(){
        $_sql = "SELECT c.id,c.title,c.title t,c.date,c.info,c.thumbnail,c.count,c.attr,c.keyword,c.gold,c.nav,n.nav_name FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.tag LIKE '%$this->inputkeyword%' ORDER BY c.date DESC " . $this->_limit;
        return parent::all($_sql);
    }

    // 按照tag搜索的文档总记录
    public function searchTagContentTotal(){
        $_sql = "SELECT COUNT(*) FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.tag LIKE '%$this->inputkeyword%'";
        return parent::total($_sql);
    }

    //获取上一篇
    public function getPrevPage(){
        $_sql = "SELECT id,title,date FROM cms_content WHERE id < '$this->id' ORDER BY id DESC LIMIT 0,1";
        return parent::one($_sql);
    }

    //获取上一篇
    public function getNextPage(){
        $_sql = "SELECT id,title,date FROM cms_content WHERE id > '$this->id' ORDER BY id ASC LIMIT 0,1";
        return parent::one($_sql);
    }


    public function getCommendContentTotal(){
        $_sql = "SELECT COUNT(*) FROM cms_content WHERE commend=1";
        return parent::total($_sql);
    }

    //获取推荐文档
    public function getCommendContent()
    {
        $_sql = "SELECT id,title,title,date,info,thumbnail,count,attr,keyword,gold,author,source FROM cms_content WHERE commend=1 ORDER BY date DESC " . $this->_limit;
        return parent::all($_sql);
    }



}