<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_permission.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;权限管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="permission.php?action=show" class="selected">权限列表</a></li>
    <li><a href="permission.php?action=add">新增权限</a></li>
    {if $update}
        <li><a href="permission.php?action=update&id={$id}">修改权限</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>权限名称</th>
            <th>标识</th>
            <th>操作</th>
        </tr>
        {if $AllPermission}
            {foreach $AllPermission(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->name}</td>
                    <td>{@value->id}</td>
                    <td><a href="permission.php?action=update&id={@value->id}">修改</a>|<a
                                href="permission.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个权限么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="4">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <div id="page">{$page}</div>
{/if}

{if $add}
    <form action="" method="post" name="add">
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    权限名称： <input type="text" name="name" class="text"/>
                    (不得小于2位，不得大于100位)
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="info" id="" cols="30" rows="10"></textarea>
                    (不得大于200位)
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="新增权限" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}


{if $update}
    <form action="" method="post" name="add">
        <input type="hidden" value="{$id}" name="id"/>
        <input type="hidden" value="{$prev_url}" name="prev_url"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    权限名称： <input type="text" name="name" value="{$name}" class="text"/>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="info" id="" cols="30" rows="10">{$info}</textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改权限" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

</body>
</html>