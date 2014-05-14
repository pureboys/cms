<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_user.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;会员管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="user.php?action=show" class="selected">会员列表</a></li>
    <li><a href="user.php?action=add">新增会员</a></li>
    {if $update}
        <li><a href="user.php?action=update&id={$id}">修改会员</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>电子邮件</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        {if $AllUser}
            {foreach $AllUser(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->user}</td>
                    <td>{@value->email}</td>
                    <td>{@value->state}</td>
                    <td><a href="user.php?action=update&id={@value->id}">修改</a>|<a
                                href="user.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个会员么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="5">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <p class="center">[<a href="user.php?action=add">新增用户</a>]</p>
    <div id="page">{$page}</div>
{/if}

{if $add}
    <form action="" method="post" name="add">
        <table cellspacing="0" class="user">
            <tr><td>用 户 名: <input type="text" class="text" name="user"/><span class="red">[必填]</span>(*用户名在2到20位之间)</td></tr>
            <tr><td>密　　码: <input type="password" class="text" name="pass"/><span class="red">[必填]</span>(*密码不得小于6位)</td></tr>
            <tr><td>密码确认: <input type="password" class="text" name="notpass"/><span class="red">[必填]</span>(*和密码一致)</td></tr>
            <tr><td>电子邮件: <input type="text" class="text" name="email"/><span class="red">[必填]</span>(*每个电子邮件只能注册一个ID)
            </td></tr>
            <tr><td>选择头像: <select name="face" id="" onchange="sface();">
                    {foreach $OptionFaceOne(key,value)}
                        <option value="0{@value}.gif">0{@value}.gif</option>
                    {/foreach}
                    {foreach $OptionFaceTwo(key,value)}
                        <option value="{@value}.gif">{@value}.gif</option>
                    {/foreach}
                </select></td></tr>
            <tr><td><img name="faceimg" src="/images/01.gif" alt="01.gif" class="face" /></td></tr>
            <tr><td>安全问题: <select name="question" id="">
                    <option value="">没有任何安全问题</option>
                    <option value="您父亲的姓名">您父亲的姓名</option>
                    <option value="您母亲的职业">您母亲的职业</option>
                    <option value="您配偶的性别">您配偶的性别</option>
                </select></td></tr>
            <tr><td>问题答案: <input type="text" class="text" name="answer"/></td></tr>
            <tr><td>设置权限: <input type="radio" name="state" value="0"/>被封杀会员
                    <input type="radio" name="state" value="1"/>待审核会员
                    <input type="radio" name="state" value="2" checked/>初级会员
                    <input type="radio" name="state" value="3"/>中级会员
                    <input type="radio" name="state" value="4"/>高级会员
                    <input type="radio" name="state" value="5"/>vip会员
                </td></tr>
            <tr><td><input type="submit" name="send" value="注册会员" class="submit" onclick="return checkReg();"/></td></tr>
        </table>
    </form>
{/if}


{if $update}
    <form action="" method="post" name="update">
        <input type="hidden" value="{$id}" name="id"/>
        <input type="hidden" value="{$prev_url}" name="prev_url"/>
        <input type="hidden" value="{$pass}" name="ppass"/>
        <table cellspacing="0" class="user">
            <tr><td>用 户 名: {$user}</td></tr>
            <tr><td>密　　码: <input type="password" class="text" name="pass"/>(留空则不修改)</td></tr>
            <tr><td>电子邮件: <input type="text" class="text" name="email" value="{$email}"/><span class="red">[必填]</span>(*每个电子邮件只能注册一个ID)
                </td></tr>
            <tr><td>选择头像: <select name="face" id="" onchange="sface();">
                       {$face}
                    </select></td></tr>
            <tr><td><img name="faceimg" src="/images/{$facesrc}" alt="01.gif" class="face" /></td></tr>
            <tr><td>安全问题: <select name="question" id="">
                        <option value="">没有任何安全问题</option>
                        {$question}
                    </select></td></tr>
            <tr><td>问题答案: <input type="text" class="text" name="answer" value="{$answer}"/></td></tr>
            <tr><td>设置权限: {$state}
                </td></tr>
            <tr><td><input type="submit" name="send" value="修改会员" class="submit" onclick="return checkUpdate();"/> [<a href="{$prev_url}">返回上一层</a>]</td></tr>
        </table>
    </form>
{/if}

</body>
</html>