<?php

class FileUpload
{

    private $error; //错误代码
    private $maxsize; //表单最大值
    private $type; //类型
    private $typeArr = array('image/jpeg', 'image/pjpeg', 'image/png', 'image/x-png', 'image/gif'); //类型合集
    private $path; //目录路径

    public function __construct($_file, $_maxsize)
    {
        $this->error = $_FILES[$_file]['error'];
        $this->maxsize = $_maxsize / 1024;
        $this->type = $_FILES[$_file]['type'];
        $this->path = ROOT_PATH . UPDIR;
        $this->checkError();
        $this->checkType();
        $this->checkPath();
    }

    //验证目录
    private function checkPath()
    {
        if (!is_dir($this->path) || !is_writable($this->path)) {
            if (!mkdir($this->path)) {
                Tool::alertBack('警告：主目录上传失败！');
            }
        }
    }

    //验证类型
    private function checkType()
    {
        if (!in_array($this->type, $this->typeArr)) {
            Tool::alertBack('警告：上传类型不合法！');
        }
    }

    //验证错误
    private function checkError()
    {
        if (!empty($this->error)) {
            switch ($this->error) {
                case 1:
                    Tool::alertBack('警告：上传值超过了约定的最大值');
                    break;
                case 2:
                    Tool::alertBack('警告：上传值超过了' . $this->maxsize . 'K');
                    break;
                case 3:
                    Tool::alertBack('警告：只有部分文件被上传');
                    break;
                case 4:
                    Tool::alertBack('警告：没有任何文件被上传');
                    break;
                default:
                    Tool::alertBack('未知错误');
            }
        }
    }


}