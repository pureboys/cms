<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_vote.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;投票管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="vote.php?action=show" class="selected">投票主题列表</a></li>
    <li><a href="vote.php?action=add">新增投票主题</a></li>
    {if $addchild}
    <li><a href="vote.php?action=addchild&id={$id}">新增投票项目</a></li>
    {/if}
    {if $showchild}
        <li><a href="vote.php?action=showchild&id={$id}">投票项目列表</a></li>
    {/if}
    {if $update}
        <li><a href="vote.php?action=update&id={$id}">修改投票主题</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>投票主题名称</th>
            <th>投票项目</th>
            <th>是否前台首选</th>
            <th>参与人数</th>
            <th>操作</th>
        </tr>
        {if $AllVote}
            {foreach $AllVote(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->title}</td>
                    <td><a href="vote.php?action=showchild&id={@value->id}">查看</a> | <a href="vote.php?action=addchild&id={@value->id}">增加项目</a></td>
                    <td>{@value->state}</td>
                    <td>{@value->pcount}</td>
                    <td><a href="vote.php?action=update&id={@value->id}">修改</a>|<a
                                href="vote.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个投票主题么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="5">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <div id="page">{$page}</div>
{/if}



{if $showchild}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>投票项目</th>
            <th>得票数</th>
            <th>操作</th>
        </tr>
        {if $AllChildVote}
            {foreach $AllChildVote(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->title}</td>
                    <td>{@value->count}</td>
                    <td><a href="vote.php?action=update&id={@value->id}">修改</a>|<a
                                href="vote.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个投票项目么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="4">对不起，没有任何数据！</td>
            </tr>
        {/if}
        <tr>
            <td colspan="4">所属主题：<strong>{$titlec}</strong> <a href="vote.php?action=addchild&id={$id}">增加本项</a> <a href="{$prev_url}">返回列表</a></td>
        </tr>
    </table>
    <div id="page">{$page}</div>
{/if}




{if $add}
    <form action="" method="post" name="add">
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    投票主题： <input type="text" name="title" class="text"/>
                    (不得小于2位，不得大于20位)
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
                    <input type="submit" name="send" value="新增投票主题" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}


{if $addchild}
    <form action="" method="post" name="add">
        <input type="hidden" value="{$id}" name="id"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    所属主题： <strong>{$titlec}</strong>
                </td>
            </tr>
            <tr>
                <td>
                    投票项目： <input type="text" name="title" class="text"/>
                    (不得小于2位，不得大于20位)
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
                    <input type="submit" name="send" value="新增投票项目" class="submit level" onclick="return checkForm();"/>
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
                    投票主题： <input type="text" name="title" class="text" value="{$titlec}"/>
                    (不得小于2位，不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="info" id="" cols="30" rows="10">{$info}</textarea>
                    (不得大于200位)
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改投票主题" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

</body>
</html>