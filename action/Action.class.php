<?php

class Action {
    protected $_tpl;
    protected $_model;

    protected function __construct(&$_tpl,&$_model)
    {
        $this->_tpl = $_tpl;
        $this->_model = $_model;
    }
} 