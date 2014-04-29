<?php

require substr(dirname(__FILE__), 0, -7) . '/init.inc.php';
if(isset($_POST['send'])){
    new FileUpload('pic',$_POST['MAX_FILE_SIZE']);
}
