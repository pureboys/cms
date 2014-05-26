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
            <th>广告标题</th>
            <th>广告连接</th>
            <th>广告类型</th>
            <th>是否显示广告</th>
            <th>操作</th>
        </tr>
        {if $AllAdver}
            {foreach $AllAdver(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->title}</td>
                    <td>{@value->link}</td>
                    <td>{@value->type}</td>
                    <td>{@value->state}</td>
                    <td><a href="adver.php?action=update&id={@value->id}">修改</a>|<a
                                href="adver.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个广告么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
            <tr>
                <td colspan="6" style="color:blue;">(广告服务的操作，必须生成js文件，在前台更新)</td>
            </tr>
            <tr>
                <td colspan="6">
                    <input type="button" value="生成文字js广告" onclick="javascript:location.href='?action=text';"/>
                    <input type="button" value="生成头部js广告" onclick="javascript:location.href='?action=header';"/>
                    <input type="button" value="生成侧栏js广告" onclick="javascript:location.href='?action=sidebar';"/>
                </td>
            </tr>
        {else}
            <tr>
                <td colspan="6">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <form action="" method="get">
        <input type="hidden" name="action" value="show"/>
        <div id="page">{$page}
            <select name="kind" id="" style="background: #fff;border: 1px solid #ccc;">
                <option value="0">默认全部</option>
                <option value="1">文字广告</option>
                <option value="2">头部广告</option>
                <option value="3">侧栏广告</option>
            </select>
            <input type="submit" value="查询" />
        </div>
    </form>
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
    <form action="" method="post" name="content">
        <input type="hidden" value="{$id}" name="id"/>
        <input type="hidden" value="{$prev_url}" name="prev_url"/>
        <input type="hidden" name="adv"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>广告类型： <input type="radio" name="type" value="1" {$type1} onclick="adver(1);"/>文字广告
                    <input type="radio" name="type" value="2" {$type2} onclick="adver(2);"/>头部广告(690*80)
                    <input type="radio" name="type" value="3" {$type3} onclick="adver(3)"/>侧栏广告(270*200)
                </td>
            </tr>
            <tr>
                <td>
                    广告标题： <input type="text" name="title" class="text" value="{$titlec}"/>
                    (不得小于2位，不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    广告连接： <input type="text" name="link" class="text" value="{$link}"/>
                    (不得为空)
                </td>
            </tr>
            <tr {$pic} id="thumbnail">
                <td>广告图片： <input type="text" value="{$thumbnail}" name="thumbnail" class="text" readonly /> <span id="up">{$up}</span>
                    <img name="pic" src="{$thumbnail}" style="display: block" />(*jpg,gif,png,且在200k内)
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="info" id="" cols="30" rows="10">{$info}</textarea>
                    (不得大于200位)
                </td>
            </tr>
            <tr>
                <td>是否前台应用: <input type="radio" name="state" value="1" {$left_state}/>是 <input type="radio" name="state" value="0" {$right_state} />否</td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改广告" class="submit level" onclick="return checkAdver();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

</body>
</html>