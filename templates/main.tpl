<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;后台首页
</div>

<table cellspacing="0">
    <tr>
        <th>快捷操作</th>
    </tr>
    <tr>
        <td><input type="button" value="清理缓存" onclick="javascript:location.href='main.php?action=delcache'"/>（缓存目录有<span
                    class="red">{$cacheNum}</span>个文件）
        </td>
    </tr>
</table>


</body>
</html>