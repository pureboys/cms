<?php
require substr(dirname(__FILE__), 0, -7) . '/init.inc.php';
if (isset($_POST['send'])) {
    $_fileupload = new FileUpload('pic', $_POST['MAX_FILE_SIZE']);
    Tool::alertOpenerClose('缩略图上传成功！', $_fileupload->getPath());
} else {
    Tool::alertBack('警告:文件过大，或者其他未知错误导致浏览器崩溃!');
}