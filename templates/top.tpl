<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>top</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_top_nav.js"></script>
</head>
<body id="top">
<h1>logo</h1>
<ul>
    <li><a href="/templates/sidebar.html" target="sidebar" id="nav1" class="selected" onclick="admin_top_nav(1)">首页</a>
    </li>
    <li><a href="/templates/sidebarn.html" target="sidebar" id="nav2" onclick="admin_top_nav(2)">内容</a></li>
    <li><a href="/templates/sidebaru.html" target="sidebar" id="nav3" onclick="admin_top_nav(3)">会员</a></li>
    <li><a href="/templates/sidebars.html" target="sidebar" id="nav4" onclick="admin_top_nav(4)">系统</a></li>
</ul>
<p>
    您好，<strong>{$admin_user}</strong> [{$level_name}] [<a href="../" target="_blank">去首页</a>] [<a
            href="admin_login.php?action=logout" target="_parent">退出</a>]
</p>
</body>
</html>