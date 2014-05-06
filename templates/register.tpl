<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/style/basic.css"/>
    <link rel="stylesheet" href="/style/reg.css"/>
</head>
<body>

{include file='header.tpl'}
<div id="reg">
    <h2>会员注册</h2>

    <form action="">
        <dl>
            <dd>用 户 名: <input type="text" class="text" name="user"/><span class="red">[必填]</span>(*用户名在2到20位之间)</dd>
            <dd>密　　码: <input type="password" class="text" name="pass"/><span class="red">[必填]</span>(*密码不得小于6位)</dd>
            <dd>密码确认: <input type="password" class="text" name="notpass"/><span class="red">[必填]</span>(*和密码一致)</dd>
            <dd>电子邮件: <input type="text" class="text" name="email"/><span class="red">[必填]</span>(*每个电子邮件只能注册一个ID)</dd>
            <dd>安全问题: <select name="question" id="">
                    <option value="">没有任何安全问题</option>
                    <option value="">您父亲的姓名</option>
                    <option value="">您母亲的职业</option>
                    <option value="">您配偶的性别</option>
                </select></dd>
            <dd>问题答案: <input type="text" class="text" name="answer"/></dd>
            <dd>验 证 码: <input type="text" class="text" name="code"/><span class="red">[必填]</span></dd>
            <dd><img src="/config/code.php"
                     onclick="javascript:this.src='/config/code.php?tm='+Math.random();" class="code"/></dd>
            <dd><input type="submit" name="send" value="注册会员" class="submit"/></dd>
        </dl>
    </form>
</div>
{include file='footer.tpl'}
</body>
</html>