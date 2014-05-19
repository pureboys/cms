<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_manage.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;内容管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="comment.php?action=show" class="selected">评论列表</a></li>
</ol>

{if $show}
<form action="?action=states" method="post">
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>评论内容</th>
            <th>评论者</th>
            <th>所属文档</th>
            <th>状态</th>
            <th>批量审核</th>
            <th>操作</th>
        </tr>
        {if $CommentList}
            {foreach $CommentList(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td title="{@value->full}">{@value->content}</td>
                    <td>{@value->user}</td>
                    <td><a href="/details.php?id={@value->cid}" target="_blank" title="{@value->title}">查看</a></td>
                    <td>{@value->state}</td>
                    <td><input type="text" value="{@value->num}" class="text sort" name="states[{@value->id}]"/></td>
                    <td><a href="comment.php?action=delete&id={@value->id}" onclick="return confirm('你真的要删除这条评论么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="7">对不起，没有任何数据！</td>
            </tr>
        {/if}
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="submit" name="send" value="批量审核" style="cursor: pointer"/></td>
            <td></td>
        </tr>
    </table>
    <div id="page">{$page}</div>
    <p class="center">[<a href="manage.php?action=add">新增管理员</a>]</p>

</form>
{/if}


</body>
</html>