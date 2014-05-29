<?php

class TagAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new TagModel());
    }

    public function _action()
    {

    }

    //前台显示5条
    public function getFiveTag(){
        $this->_tpl->assign('FiveTag',$this->_model->getFiveTag());
    }



}