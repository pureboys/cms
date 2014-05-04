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
    public function addContent()
    {

        $sql = "INSERT INTO cms_content(title,nav,info,thumbnail,source,author,tag,keyword,attr,content,commend,count,gold,color,date) VALUES ('$this->title','$this->nav','$this->info','$this->thumbnail','$this->source','$this->author','$this->tag','$this->keyword','$this->attr','$this->content','$this->commend','$this->count','$this->gold','$this->color',NOW())";
        return parent::aud($sql);
    }

    //获取文档列表
    public function getListContent()
    {
        $_sql = "SELECT c.id,c.title,c.date,c.info,c.thumbnail,c.count,n.nav_name FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.nav IN ($this->nav) " . $this->_limit;
        return parent::all($_sql);
    }

    //获取主类下子类的ID
    public function getNavChildId()
    {
        $_sql = "SELECT id FROM cms_nav WHERE pid='$this->id'";
        return parent::all($_sql);
    }

    //获取文档总记录
    public function getListContentTotal()
    {
        $_sql = "SELECT COUNT(*) FROM cms_content c,cms_nav n WHERE c.nav=n.id AND c.nav IN ($this->nav)";
        return parent::total($_sql);
    }


}