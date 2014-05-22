<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_adver.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;内容管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="adver.php?action=show" class="selected">广告列表</a></li>
    <li><a href="adver.php?action=add">新增广告</a></li>
    {if $update}
        <li><a href="adver.php?action=update&id={$id}">修改广告</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>等级名称</th>
            <th>等级描述</th>
            <th>操作</th>
        </tr>
        {if $AllLevel}
            {foreach $AllLevel(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->level_name}</td>
                    <td>{@value->level_info}</td>
                    <td><a href="adver.php?action=update&id={@value->id}">修改</a>|<a
                                href="adver.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个等级么？') ? true : false">删除</a></td>
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
    <form action="" method="post" name="content">
        <input type="hidden" name="adv"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>广告类型： <input type="radio" name="type" value="1" checked onclick="adver(1);"/>文字广告
                    <input type="radio" name="type" value="2" onclick="adver(2);"/>头部广告(690*80)
                    <input type="radio" name="type" value="3" onclick="adver(3)"/>侧栏广告(270*200)
                </td>
            </tr>
            <tr>
                <td>
                    广告标题： <input type="text" name="title" class="text"/>
                    (不得小于2位，不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    广告连接： <input type="text" name="link" class="text"/>
                    (不得为空)
                </td>
            </tr>
            <tr style="display: none;" id="thumbnail">
                <td>广告图片： <input type="text" value="" name="thumbnail" class="text" readonly/> <span id="up"></span>
                    <img name="pic" src="" style="display: none"/>(*jpg,gif,png,且在200k内)
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
                    <input type="submit" name="send" value="新增广告" class="submit level" onclick="return checkAdver();"/>
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
                    等级名称： <input type="text" name="level_name" value="{$level_name}" class="text"/>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="level_info" id="" cols="30" rows="10">{$level_info}</textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改等级" class="submit level" onclick="return checkForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

</body>
</html>