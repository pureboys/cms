<?php

/**
 * Class Model
 */
class ContentModel extends Model
{
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

}