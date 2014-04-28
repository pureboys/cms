<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录后台CMS系统</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_login.js" type="text/javascript"></script>
 </head>
<body>
<form action="manage.php?action=login" method="post" id="adminLogin" name="login">
    <fieldset>
        <legend>登录后台CMS系统</legend>
        <label for="">帐　号：<input type="text" name="admin_user" class="text" /></label>
        <label for="">密　码：<input type="password" name="admin_pass" class="text" /></label>
        <label for="">验证码：<input type="text" name="code" class="text" /></label>
        <label class="t">输入下图字符，不区分大小写</label>
        <label><img src="../config/code.php" onclick="javascript:this.src='../config/code.php?tm='+Math.random();" /></label>
        <input type="submit" value="登录" class="submit" name="send" onclick="return checkLogin();"/>
    </fieldset>
</form>


</body>
</html>