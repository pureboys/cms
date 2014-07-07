<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_rotation.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;内容管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="rotation.php?action=show" class="selected">轮播器列表</a></li>
    <li><a href="rotation.php?action=add">新增轮播器</a></li>
    {if $update}
        <li><a href="rotation.php?action=update&id={$id}">修改轮播器</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>标题</th>
            <th>连接</th>
            <th>是否首页轮播</th>
            <th>操作</th>
        </tr>
        {if $AllRotation}
            {foreach $AllRotation(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td><a href="{@value->full}" target="_blank">{@value->title}</a></td>
                    <td>{@value->link}</td>
                    <td>{@value->state}</td>
                    <td><a href="rotation.php?action=update&id={@value->id}">修改</a>|<a
                                href="rotation.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个轮播器么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
            <tr>
                <td colspan="5" style="color: #008000">修改轮播器后，请点击[生成xml文件]，更新首页轮播</td>
            </tr>
            <tr>
                <td colspan="5"><input type="button" value="生成xml文件" onclick="javascript:location.href='?action=xml'"/>
                </td>
            </tr>
        {else}
            <tr>
                <td colspan="5">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <div id="page">{$page}</div>
{/if}

{if $add}
    <form action="" method="post" name="content">
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    轮 播 图： <input type="text" name="thumbnail" class="text" readonly/>
                    <input type="button"
                           value="上传轮播图"
                           onclick="centerWindow('../config/upfile.php?type=rotation','upfile','400','100')"/>
                    <img name="pic" style="display: none"/>(*jpg,gif,png,且在200k内,轮播图尺寸268*193)
                </td>
            </tr>
            <tr>
                <td>
                    链　　接： <input type="text" name="link" class="text"/>
                    (不得为空)
                </td>
            </tr>
            <tr>
                <td>
                    标　　题： <input type="text" name="title" class="text"/>
                    (不得大于20位)
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
                    <input type="submit" name="send" value="新增轮播图" class="submit level"
                           onclick="return checkAddRotation();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}


{if $update}
    <form action="" method="post" name="content">
        <input type="hidden" value="{$id}" name="id"/>
        <input type="hidden" value="{$prev_url}" name="prev_url"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    轮 播 图： <input type="text" name="thumbnail" class="text" readonly value="{$thumbnail}"/>
                    <input type="button"
                           value="上传轮播图"
                           onclick="centerWindow('../config/upfile.php?type=rotation','upfile','400','100')"/>
                    <img name="pic" style="display: none"/>(*jpg,gif,png,且在200k内,轮播图尺寸268*193)
                </td>
            </tr>
            <tr>
                <td>
                    链　　接： <input type="text" name="link" class="text" value="{$link}"/>
                    (不得为空)
                </td>
            </tr>
            <tr>
                <td>
                    标　　题： <input type="text" name="title" class="text" value="{$titlec}"/>
                    (不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="info" id="" cols="30" rows="10">{$info}</textarea>
                    (不得大于200位)
                </td>
            </tr>
            <tr>
                <td>是否轮播： <input type="radio" name="state" value="1" {$left_state}/>是 <input type="radio" name="state"
                                                                                             value="0" {$right_state}/>否
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改轮播图" class="submit level"
                           onclick="return checkAddRotation();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

</body>
</html>