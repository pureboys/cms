<?php
require substr(dirname(__FILE__), 0, -7) . '/init.inc.php';
if (isset($_POST['send'])) {
    switch ($_POST['type']) {
        case 'content':
            $_width = 250;
            $_height = 251;
            $_info = '缩略图上传成功';
            break;
        case 'rotation':
            $_width = 268;
            $_height = 193;
            $_info = '轮播图上传成功';
            break;
        case 'adver':
            switch ($_POST['size']) {
                case '690*80':
                    $_width = 690;
                    $_height = 80;
                    $_info = '头部广告上传成功';
                    break;
                case '270*200':
                    $_width = 270;
                    $_height = 200;
                    $_info = '侧栏广告上传成功';
                    break;
            }
            break;
        default:
            Tool::alertBack('警告：非法操作！');
    }
    $_fileupload = new FileUpload('pic', $_POST['MAX_FILE_SIZE']);
    $_path = $_fileupload->getPath();
    $_img = new Image($_path);
    $_img->thumb($_width, $_height);
    $_img->out();
    Tool::alertOpenerClose($_info, $_path);
} else {
    Tool::alertBack('警告:文件过大，或者其他未知错误导致浏览器崩溃!');
}
