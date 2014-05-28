<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/style/basic.css"/>
    <link rel="stylesheet" href="/style/friendlink.css"/>
    <script src="/js/link.js"></script>
</head>
<body>

{include file='header.tpl'}

{if $frontadd}
<div id="friendlink">
    <h2>申请加入友情连接</h2>
        <form action="" method="post" name="friendlink">
            <input type="hidden" name="state" value="0"/>
            <dl>
                <dd>网站类型: <input type="radio" name="type" value="1" checked onclick="link(1)" />文字连接
                    <input type="radio" name="type" value="2" onclick="link(2)"/>Logo连接
                </dd>
                <dd>网站名称: <input type="text" class="text" name="webname"/><span class="red">[必填]</span>(*网站名称不得大于20位且不能为空)</dd>
                <dd>网站地址: <input type="text" class="text" name="weburl"/><span class="red">[必填]</span>(*网站地址不得大于100位且不能为空)</dd>
                <dd id="logo" style="display: none">Logo地址: <input type="text" class="text" name="logourl"/><span class="red">[必填]</span>(*Logo地址不得大于100位且不能为空)</dd>
                <dd>站长姓名: <input type="text" class="text" name="user"/>
                </dd>
                <dd>验 证 码: <input type="text" class="text" name="code"/><span class="red">[必填]</span></dd>
                <dd><img src="/config/code.php"
                         onclick="javascript:this.src='/config/code.php?tm='+Math.random();" class="code"/></dd>
                <dd><input type="submit" name="send" value="申请友情连接" class="submit" onclick="return checkLink();"/></dd>
            </dl>
        </form>
</div>
{/if}

{if $frontshow}
{/if}

{include file='footer.tpl'}
</body>
</html>