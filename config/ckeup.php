<?php
//ckeditor 配置上传文件
require substr(dirname(__FILE__), 0, -7) . '/init.inc.php';
if (isset($_GET['type'])) {
    $_fileupload = new FileUpload('upload', $_POST['MAX_FILE_SIZE']);
    $_ckefn = $_GET['CKEditorFuncNum'];
    $_path = $_fileupload->getPath();
    echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($_ckefn,\"$_path\",'图片上传成功');</script>";
    exit();
} else {
    Tool::alertBack('警告：由于非法操作导致上传失败');
}