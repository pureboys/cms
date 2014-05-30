<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;系统管理 &gt;&gt;  <strong class="title">系统配置文件</strong>
</div>

<form action="" method="post">
<table cellspacing="0" >
    <tr><th>系统配置信息</th></tr>
    <tr><td>网站名称　　： <input type="text" name="webname" class="text" value="{$webname}"/></td></tr>
    <tr><td>常规分页　　： <input type="text" name="page_size" class="text" value="{$page_size}"/></td></tr>
    <tr><td>文档分页　　： <input type="text" name="article_size" class="text" value="{$article_size}"/></td></tr>
    <tr><td>导航个数　　： <input type="text" name="nav_size" class="text" value="{$nav_size}"/></td></tr>
    <tr><td>上传目录　　： <input type="text" name="updir" class="text" value="{$updir}"/></td></tr>
    <tr><td>轮播速度　　： <input type="text" name="ro_time" class="text" value="{$ro_time}"/></td></tr>
    <tr><td>轮播个数　　： <input type="text" name="ro_num" class="text" value="{$ro_num}"/></td></tr>
    <tr><td>文字广告个数： <input type="text" name="adver_text_num" class="text" value="{$adver_text_num}"/></td></tr>
    <tr><td>图片广告个数： <input type="text" name="adver_pic_num" class="text" value="{$adver_pic_num}"/></td></tr>
</table>
    <p style="margin: 20px; text-align:center;">
        <input type="submit" value="修改配置文件" name="send"/>
    </p>
</form>


</body>
</html>