<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>上传缩略图</title>
    <link rel="stylesheet" href="/style/admin.css"/>
</head>
<body id="main">

<form action="/config/upload.php" method="post" enctype="multipart/form-data" style="text-align: center;margin: 30px">
    <input type="hidden" name="size" value="<?php echo isset($_GET['size']) ? $_GET['size']:0; ?>"/>
    <input type="hidden" name="type" value="<?php echo $_GET['type']; ?>"/>
    <input type="hidden" name="MAX_FILE_SIZE" value="204800"/>
    <input type="file" name="pic"/>
    <input type="submit" name="send" value="确定上传"/>
</form>

</body>
</html>