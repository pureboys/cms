<?php

/**
 * Class Cache
 * 静态页面，局部不缓存
 */
class Cache
{
    //统计点击量,details
    public function details()
    {
        $_content = new ContentModel();
        $_content->id = $_GET['id'];
        $this->setContentCount($_content);
        $this->getContentCount($_content);
    }

    //list
    public function listc(){
        $_content = new ContentModel();
        $_content->id = $_GET['id'];
        $this->getContentCount($_content);
    }


    //累计
    private function setContentCount(&$_content)
    {
        $_content->setContentCount();
    }

    //获取
    private function getContentCount(&$_content)
    {
        $_count = $_content->getOneContent()->count;
        echo "function getContentCount(){
             document.write('$_count');
        }";
    }

} 