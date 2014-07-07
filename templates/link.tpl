<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_link.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;内容管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="link.php?action=show" class="selected">友情连接列表</a></li>
    <li><a href="link.php?action=add">新增友情连接</a></li>
    {if $update}
        <li><a href="link.php?action=update&id={$id}">修改友情连接</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>网站名称</th>
            <th>网站地址</th>
            <th>logo地址</th>
            <th>站长名称</th>
            <th>类型</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        {if $AllLink}
            {foreach $AllLink(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->webname}</td>
                    <td title="{@value->fullweburl}">{@value->weburl}</td>
                    <td title="{@value->fulllogourl}">{@value->logourl}</td>
                    <td>{@value->user}</td>
                    <td>{@value->type}</td>
                    <td>{@value->state}</td>
                    <td><a href="link.php?action=update&id={@value->id}">修改</a>|<a
                                href="link.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个友情连接么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="8">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <div id="page">{$page}</div>
{/if}

{if $add}
    <form action="" method="post" name="friendlink">
        <input type="hidden" name="state" value="1"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    网站类型: <input type="radio" name="type" value="1" checked onclick="link(1)"/>文字连接
                    <input type="radio" name="type" value="2" onclick="link(2)"/>Logo连接
                </td>
            </tr>
            <tr>
                <td>
                    网站名称: <input type="text" class="text" name="webname"/><span class="red">[必填]</span>(*网站名称不得大于20位且不能为空)
                </td>
            </tr>
            <tr>
                <td>
                    网站地址: <input type="text" class="text" name="weburl"/><span class="red">[必填]</span>(*网站地址不得大于100位且不能为空)
                </td>
            </tr>
            <tr id="logo" style="display: none">
                <td>
                    Logo地址: <input type="text" class="text" name="logourl"/><span class="red">[必填]</span>(*Logo地址不得大于100位且不能为空)
                </td>
            </tr>
            <tr>
                <td>
                    站长姓名: <input type="text" class="text" name="user"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="新增友情连接" class="submit level" onclick="return checkLink();"/>
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
        <input type="hidden" value="{$state}" name="state"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    网站类型: <input type="radio" name="type" value="1" {$text_type} onclick="link(1)"/>文字连接
                    <input type="radio" name="type" value="2" {$logo_type} onclick="link(2)"/>Logo连接
                </td>
            </tr>
            <tr>
                <td>
                    网站名称: <input type="text" class="text" name="webname" value="{$webname}"/><span
                            class="red">[必填]</span>(*网站名称不得大于20位且不能为空)
                </td>
            </tr>
            <tr>
                <td>
                    网站地址: <input type="text" class="text" name="weburl" value="{$weburl}"/><span class="red">[必填]</span>(*网站地址不得大于100位且不能为空)
                </td>
            </tr>
            <tr id="logo" style="{$logo}">
                <td>
                    Logo地址: <input type="text" class="text" name="logourl" value="{$logourl}"/><span
                            class="red">[必填]</span>(*Logo地址不得大于100位且不能为空)
                </td>
            </tr>
            <tr>
                <td>
                    站长姓名: <input type="text" class="text" name="user" value="{$user}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改友情连接" class="submit level" onclick="return checkLink();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

</body>
</html>