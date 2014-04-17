<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 14-4-17
 * Time: 下午1:53
 */
class Page
{
    private $total; //总记录
    private $pagesize; //每页显示条数
    private $limit; //limit
    private $page; //当前页码
    private $pagenum; //总页码


    public function __construct($_total, $_pagesize)
    {
        $this->total = $_total;
        $this->pagesize = $_pagesize;
        $this->pagenum = ceil($this->total / $this->pagesize);
        $this->page = $this->setPage();
        $this->limit = 'LIMIT '.($this->page-1)*$this->pagesize.','.$this->pagesize;
    }

    //获取当前页码
    private function setPage()
    {
        if (!empty($_GET['page'])) {
            if ($_GET['page'] > 0) {
                if ($_GET['page'] > $this->pagenum) {
                    return $this->pagenum;
                } else {
                    return $_GET['page'];
                }
            } else {
                return 1;
            }
        } else {
            return 1;
        }
    }


    function __get($name)
    {
        return $this->$name;
    }

    function __set($name, $value)
    {
        $this->$name = $value;
    }

    //分页信息
    public function showpage()
    {
        return $this->limit;
    }

}