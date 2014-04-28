<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_nav.js"></script>
</head>
<body id="main">
<div class="map">
    内容管理 &gt;&gt;设置网站导航 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="nav.php?action=show" class="selected">导航列表</a></li>
    <li><a href="nav.php?action=add">新增导航</a></li>
    {if $update}
        <li><a href="nav.php?action=update&id={$id}">修改导航</a></li>
    {/if}
    {if $addchild}
        <li><a href="nav.php?action=addchild&id={$id}">新增子导航</a></li>
    {/if}
    {if $showchild}
        <li><a href="nav.php?action=showchild&id={$id}">查看子导航</a></li>
    {/if}
</ol>

{if $show}
    <form action="nav.php?action=sort" method="post">
        <table cellspacing="0">
            <tr>
                <th>序号</th>
                <th>导航名称</th>
                <th>描述</th>
                <th>子类</th>
                <th>操作</th>
                <th>排序</th>
            </tr>
            {if $AllNav}
                {foreach $AllNav(key,value)}
                    <tr>
                        <td>
                            <script type="text/javascript">document.write({@key+1}+{$num});</script>
                        </td>
                        <td>{@value->nav_name}</td>
                        <td>{@value->nav_info}</td>
                        <td><a href="nav.php?action=showchild&id={@value->id}">查看</a> | <a
                                    href="nav.php?action=addchild&id={@value->id}">增加子类</a></td>
                        <td><a href="nav.php?action=update&id={@value->id}">修改</a>|<a
                                    href="nav.php?action=delete&id={@value->id}"
                                    onclick="return confirm('你真的要删除这个导航么？') ? true : false">删除</a></td>
                        <td><input type="text" name="sort[{@value->id}]" value="{@value->sort}" class="text sort"/></td>
                    </tr>
                {/foreach}
            {else}
                <tr>
                    <td colspan="6">对不起，没有任何数据！</td>
                </tr>
            {/if}
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="submit" name="send" value="排序" style="cursor: pointer"/></td>
            </tr>
        </table>
        <div id="page">{$page}</div>
        <p class="center">[<a href="nav.php?action=add">新增导航</a>]</p>
    </form>
{/if}


{if $showchild}
    <form action="nav.php?action=sort" method="post">
        <table cellspacing="0">
            <tr>
                <th>序号</th>
                <th>导航名称</th>
                <th>描述</th>
                <th>操作</th>
                <th>排序</th>
            </tr>
            {if $AllChildNav}
                {foreach $AllChildNav(key,value)}
                    <tr>
                        <td>
                            <script type="text/javascript">document.write({@key+1}+{$num});</script>
                        </td>
                        <td>{@value->nav_name}</td>
                        <td>{@value->nav_info}</td>
                        <td><a href="nav.php?action=update&id={@value->id}">修改</a>|<a
                                    href="nav.php?action=delete&id={@value->id}"
                                    onclick="return confirm('你真的要删除这个导航么？') ? true : false">删除</a></td>
                        <td><input type="text" name="sort[{@value->id}]" value="{@value->sort}" class="text sort"/></td>
                    </tr>
                {/foreach}
            {else}
                <tr>
                    <td colspan="5">对不起，没有任何数据！</td>
                </tr>
            {/if}
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="submit" name="send" value="排序" style="cursor: pointer"/></td>
            </tr>
            <tr>
                <td colspan="5">本类隶属： <strong>{$nav_name}</strong></td>
            </tr>
        </table>
        <div id="page">{$page}</div>
        <p class="center"> [ <a href="{$prev_url}">返回列表</a> ] | [<a href="nav.php?action=addchild&id={$id}">增加本类</a>]
        </p>
    </form>
{/if}

{if $add}
    <form action="" method="post" name="add">
        <input type="hidden" value="0" name="pid"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    导航名称： <input type="text" name="nav_name" class="text"/>
                    (不得小于2位，不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="nav_info" id="" cols="30" rows="10"></textarea>
                    (不得大于200位)
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="新增导航" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

{if $addchild}
    <form action="" method="post" name="add">
        <input type="hidden" value="{$id}" name="pid"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>上级导航： <strong>{$nav_name}</strong></td>
            </tr>
            <tr>
                <td>
                    导航名称： <input type="text" name="nav_name" class="text"/>
                    (不得小于2位，不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="nav_info" id="" cols="30" rows="10"></textarea>
                    (不得大于200位)
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="新增子导航" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}


{if $update}
    <form action="" method="post" name="add">
        <input type="hidden" value="{$prev_url}" name="prev_url"/>
        <input type="hidden" value="{$id}" name="id"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    导航名称： <input type="text" name="nav_name" class="text" value="{$nav_name}"/>
                    (不得小于2位，不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="nav_info" id="" cols="30" rows="10">{$nav_info}</textarea>
                    (不得大于200位)
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改导航" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}
</body>
</html>