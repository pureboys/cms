<?php

class Action {
    protected $_tpl;
    protected $_model;

    protected function __construct(&$_tpl,&$_model)
    {
        $this->_tpl = $_tpl;
        $this->_model = $_model;
    }

    protected function page($_total){
        $_page = new Page($_total,PAGE_SIZE);
        $this->_model->_limit = $_page->limit;
        $this->_tpl->assign('page',$_page->showpage());
        $this->_tpl->assign('num',($_page->page-1)*PAGE_SIZE);
    }
} 