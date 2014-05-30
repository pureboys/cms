<?php

//模版类
class Templates
{
    private $_vars = array();
    //保存系统变量
    private $_config = array();
    //缓存对象
    private $_cache;

    //验证各目录是否存在
    public function __construct($_cache)
    {
        if (!is_dir(TPL_DIR) or !is_dir(TPL_C_DIR) or !is_dir(CACHE)) {
            exit('ERROR：模板目录或编译目录或缓存目录不存在！请手工设置！');
        }
        //保存系统变量
        $_sxe = simplexml_load_file(ROOT_PATH . '/config/profile.xml');
        $_taglib = $_sxe->xpath('/root/taglib');
        //print_r($_taglib);
        foreach ($_taglib as $_tag) {
            $this->_config["$_tag->name"] = $_tag->value;
        }
        $this->_cache = $_cache;
    }

    //注入变量
    public function assign($_var, $_value)
    {
        if (isset($_var) and !empty($_var)) {
            $this->_vars[$_var] = $_value;
        } else {
            exit('ERROR：请设置模板变量');
        }
    }

    public function display($_file)
    {
        //给include进来的tpl传一个模版操作的对象
        $_tpl = $this;
        $_tplFile = TPL_DIR . $_file;
        if (!file_exists($_tplFile)) {
            exit('ERROR：模板文件不存在！');
        }
        //是否加入参数
        $_file_query = '';
        if (!empty($_SERVER['QUERY_STRING'])) $_file_query = $_SERVER['QUERY_STRING'];
        //编译文件
        $_parFile = TPL_C_DIR . md5($_file) . $_file . '.php';
        //缓存文件
        $_cacheFile = CACHE . md5($_file) . $_file . $_file_query . '.html';

        //当编译文件不存在，或者模板文件修改过，则生成编译文件
        if (!file_exists($_parFile) or filemtime($_parFile) < filemtime($_tplFile)) {
            //引入模板解析类
            require_once ROOT_PATH . '/includes/Parser.class.php';
            $_parser = new Parser($_tplFile);
            $_parser->compile($_parFile);
        }
        //载入编译文件
        include $_parFile;
        if (IS_CACHE && !$this->_cache->noCache()) {
            //获取缓冲区内的数据，并且创建缓存文件
            file_put_contents($_cacheFile, ob_get_contents());
            //清除缓冲区(清除了编译文件加载的内容)
            ob_end_clean();
            //载入缓存文件
            include $_cacheFile;
        }

    }

    //创建create 用户header footer模块的解析使用，不生成缓存文件
    public function create($_file)
    {
        $_tplFile = TPL_DIR . $_file;
        if (!file_exists($_tplFile)) {
            exit('ERROR：模板文件不存在！');
        }
        //编译文件
        $_parFile = TPL_C_DIR . md5($_file) . $_file . '.php';
        //当编译文件不存在，或者模板文件修改过，则生成编译文件
        if (!file_exists($_parFile) or filemtime($_parFile) < filemtime($_tplFile)) {
            //引入模板解析类
            require_once ROOT_PATH . '/includes/Parser.class.php';
            $_parser = new Parser($_tplFile);
            $_parser->compile($_parFile);
        }
        //载入编译文件
        include $_parFile;
    }

    //cache 方法，跳转到缓存文件，不执行php,不连接数据库
    public function cache($_file)
    {
        $_tplFile = TPL_DIR . $_file;
        if (!file_exists($_tplFile)) {
            exit('ERROR：模板文件不存在！');
        }
        //是否加入参数
        if (!empty($_SERVER['QUERY_STRING'])) $_file .= $_SERVER['QUERY_STRING'];
        //编译文件
        $_parFile = TPL_C_DIR . md5($_file) . $_file . '.php';
        //缓存文件
        $_cacheFile = CACHE . md5($_file) . $_file . '.html';
        //第二次运行，直接载入缓存，避开编译
        if (IS_CACHE) {
            //缓存文件和编译文件都要存在
            if (file_exists($_cacheFile) and file_exists($_parFile)) {
                //判断模板文件是否修改过，判断编译文件是否修改过
                if (filemtime($_parFile) >= filemtime($_tplFile) and filemtime($_cacheFile) >= filemtime($_parFile)) {
                    include $_cacheFile;
                    exit;
                }
            }
        }
    }

}