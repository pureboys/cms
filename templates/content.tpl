<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_content.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>
</head>
<body id="main">
<div class="map">
    内容管理 &gt;&gt;查看文档列表 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="content.php?action=show" class="selected">文档列表</a></li>
    <li><a href="content.php?action=add">新增文档</a></li>
    {if $update}
        <li><a href="content.php?action=update&id={$id}">修改文档</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>标题</th>
            <th>属性</th>
            <th>文档类别</th>
            <th>浏览次数</th>
            <th>发布时间</th>
            <th>操作</th>
        </tr>
        {if $SearchContent}
            {foreach $SearchContent(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td><a href="/details.php?id={@value->id}" target="_blank" title="{@value->t}">{@value->title}</a>
                    </td>
                    <td>{@value->attr}</td>
                    <td><a href="?action=show&nav={@value->nav}">{@value->nav_name}</a></td>
                    <td>{@value->count}</td>
                    <td>{@value->date}</td>
                    <td><a href="content.php?action=update&id={@value->id}">修改</a>|<a
                                href="content.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个文档么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="7">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <form action="?" method="get">
        <div id="page">
            {$page}
            <input type="hidden" name="action" value="show"/>
            <select name="nav" id="" class="select">
                <option value="0">默认全部</option>
                {$nav}
            </select>
            <input type="submit" name="" value="查询"/>
        </div>
    </form>
    <p class="center">[<a href="manage.php?action=add">新增管理员</a>]</p>
{/if}

{if $add}
    <form action="?action=add" name="content" method="post">
        <table class="content">
            <tr>
                <th><strong>发布一条新文档</strong></th>
            </tr>
            <tr>
                <td>文档标题： <input type="text" name="title" class="text"/><span class="red">[必填]</span>(* 标题2-50之间)</td>
            </tr>
            <tr>
                <td>栏　　目： <select name="nav" id="">
                        <option value="" style="padding: 0">请选择一个栏目类别</option>
                        {$nav}
                    </select> <span class="red">[必填]</span>
                </td>
            </tr>
            <tr>
                <td>TAG 标签： <input type="text" name="tag" class="text"/>(*每个标签用','隔开,总长不超过30位)</td>
            </tr>
            <tr>
                <td>定义属性：
                    <input type="checkbox" name="attr[]" value="头条"/>头条
                    <input type="checkbox" name="attr[]" value="推荐"/>推荐
                    <input type="checkbox" name="attr[]" value="加粗"/>加粗
                    <input type="checkbox" name="attr[]" value="跳转"/>跳转
                </td>
            </tr>
            <tr>
                <td>关 键 字： <input type="text" name="keyword" class="text"/>(*每个关键字用','隔开,总长不超过30位)</td>
            </tr>
            <tr>
                <td>缩 略 图： <input type="text" name="thumbnail" class="text" readonly/> <input type="button"
                                                                                              value="上传缩略图"
                                                                                              onclick="centerWindow('../templates/upfile.html','upfile','400','100')"/>
                    <img name="pic" style="display: none"/>(*jpg,gif,png,且在200k内)
                </td>
            </tr>
            <tr>
                <td>文章来源： <input type="text" name="source" class="text"/>(*文章来源不得大于20位)</td>
            </tr>
            <tr>
                <td>作　　者： <input type="text" name="author" class="text" value="{$author}"/>(*作者不得大于10位)</td>
            </tr>
            <tr>
                <td><span class="middle">内容摘要：</span> <textarea name="info" id="" cols="" rows=""></textarea><span
                            class="middle">(*内容摘要200以内)</span></td>
            </tr>
            <tr class="ckeditor">
                <td><textarea id="TextArea1" class="ckeditor" name="content"></textarea></td>
            </tr>
            <tr>
                <td>评论选项： <input type="radio" name="commend" value="1" checked/>允许评论
                    <input type="radio" name="commend" value="0"/>禁止评论　　　　　　　　
                    浏览次数： <input type="text" name="count" class="text small" value="100"/>
                </td>
            </tr>
            <tr>
                <td>文档排序： <select name="sort" id="">
                        <option value="0">默认排序</option>
                        <option value="1">置顶一天</option>
                        <option value="2">置顶一周</option>
                        <option value="3">置顶一月</option>
                        <option value="4">置顶一年</option>
                    </select>　　　　　　　　消费金币： <input type="text" name="gold" class="text small" value="0"/>
                </td>
            </tr>
            <tr>
                <td>阅读权限： <select name="readlimit" id="">
                        <option value="0">开放浏览</option>
                        <option value="1">初级会员</option>
                        <option value="2">中级会员</option>
                        <option value="3">高级会员</option>
                        <option value="4">vip会员</option>
                    </select>　　　　　　　　标题颜色：<select name="color" id="">
                        <option value="">默认颜色</option>
                        <option value="red" style="color: red">红色</option>
                        <option value="blue" style="color: blue">蓝色</option>
                        <option value="orange" style="color: orange">橙色</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" name="send" value="发布文档" onclick="return checkAddContent();"/> <input
                            type="reset" value="重置"/></td>
            </tr>

        </table>
    </form>
{/if}
{if $update}
    <form action="?action=update" name="content" method="post">
        <input type="hidden" value="{$id}" name="id"/>
        <input type="hidden" value="{$prev_url}" name="prev_url"/>
        <table class="content">
            <tr>
                <th><strong>发布一条新文档</strong></th>
            </tr>
            <tr>
                <td>文档标题： <input type="text" name="title" class="text" value="{$titlec}"/><span class="red">[必填]</span>(*
                    标题2-50之间)
                </td>
            </tr>
            <tr>
                <td>栏　　目： <select name="nav" id="">
                        <option value="" style="padding: 0">请选择一个栏目类别</option>
                        {$nav}
                    </select> <span class="red">[必填]</span>
                </td>
            </tr>
            <tr>
                <td>TAG 标签： <input type="text" name="tag" class="text" value="{$tag}"/>(*每个标签用','隔开,总长不超过30位)</td>
            </tr>
            <tr>
                <td>定义属性：
                    {$attr}
                </td>
            </tr>
            <tr>
                <td>关 键 字： <input type="text" name="keyword" class="text" value="{$keyword}"/>(*每个关键字用','隔开,总长不超过30位)
                </td>
            </tr>
            <tr>
                <td>缩 略 图： <input type="text" value="{$thumbnail}" name="thumbnail" class="text" readonly/> <input
                            type="button"
                            value="上传缩略图"
                            onclick="centerWindow('../templates/upfile.html','upfile','400','100')"/>
                    <img name="pic" src="{$thumbnail}" style="display: block"/>(*jpg,gif,png,且在200k内)
                </td>
            </tr>
            <tr>
                <td>文章来源： <input type="text" name="source" value="{$source}" class="text"/>(*文章来源不得大于20位)</td>
            </tr>
            <tr>
                <td>作　　者： <input type="text" name="author" class="text" value="{$author}"/>(*作者不得大于10位)</td>
            </tr>
            <tr>
                <td><span class="middle">内容摘要：</span> <textarea name="info" id="" cols=""
                                                                rows="">{$info}</textarea><span
                            class="middle">(*内容摘要200以内)</span></td>
            </tr>
            <tr class="ckeditor">
                <td><textarea id="TextArea1" class="ckeditor" name="content">{$content}</textarea></td>
            </tr>
            <tr>
                <td>评论选项： {$commend}　　　　　　　 　
                    浏览次数： <input type="text" name="count" class="text small" value="{$count}"/>
                </td>
            </tr>
            <tr>
                <td>文档排序： <select name="sort" id="">
                        {$sort}
                    </select>　　　　　　　　消费金币： <input type="text" name="gold" class="text small" value="{$gold}"/>
                </td>
            </tr>
            <tr>
                <td>阅读权限： <select name="readlimit" id="">
                        {$readlimit}
                    </select>　　　　　　　　标题颜色：<select name="color" id="">
                        {$color}
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" name="send" value="修改文档" onclick="return checkAddContent();"/> <input
                            type="reset" value="重置"/></td>
            </tr>

        </table>
    </form>
{/if}


</body>
</html>