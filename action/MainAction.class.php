<?php

class MainAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl);
    }

    public function _action()
    {
        if(isset($_GET['action']) && $_GET['action'] == 'delcache') {
            if(in_array(2,$_SESSION['admin']['permission'])){
                $this->delCache();
            }else{
                Tool::alertBack('警告：权限不足，你无法清理缓存！');
            }
        }
        $this->cacheNum();
    }

    //计算缓存目录的文件
    private function cacheNum(){
        $dir = ROOT_PATH.'/cache/';
        $num = sizeof(scandir($dir));
        $this->_tpl->assign('cacheNum',$num-2);
    }

    //清理缓存
    private function delCache(){
        $dir = ROOT_PATH.'/cache/';
        if(!$dh = opendir($dir)) return;
        while(false !== ($obj = readdir($dh))){
            if($obj == '.' || $obj == '..') continue;
            unlink($dir.'/'.$obj);
        }
        closedir($dh);
        Tool::alertLocation('删除缓存成功！','main.php');
    }


}