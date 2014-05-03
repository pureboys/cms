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
{/if}
{if $add}
    <form action="?action=add" name="content" method="post">
        <table class="content">
            <tr>
                <th><strong>发布一条新文档</strong></th>
            </tr>
            <tr>
                <td>文档标题： <input type="text" name="title" class="text"/></td>
            </tr>
            <tr>
                <td>栏　　目： <select name="nav" id="">
                        <option value="" style="padding: 0">请选择一个栏目类别</option>
                        {$nav}
                    </select>
                </td>
            </tr>
            <tr>
                <td>TAG 标签： <input type="text" name="tag" class="text"/></td>
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
                <td>关 键 字： <input type="text" name="keyword" class="text"/></td>
            </tr>
            <tr>
                <td>缩 略 图： <input type="text" name="thumbnail" class="text" readonly/> <input type="button"
                                                                                              value="上传缩略图"
                                                                                              onclick="centerWindow('../templates/upfile.html','upfile','400','100')"/>
                    <img name="pic" style="display: none"/>
                </td>
            </tr>
            <tr>
                <td>文章来源： <input type="text" name="source" class="text"/></td>
            </tr>
            <tr>
                <td>作　　者： <input type="text" name="author" class="text"/></td>
            </tr>
            <tr>
                <td><span class="middle">内容摘要：</span> <textarea name="info" id="" cols="" rows=""></textarea></td>
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
                        <option value="">默认排序</option>
                        <option value="">置顶一天</option>
                        <option value="">置顶一周</option>
                        <option value="">置顶一月</option>
                        <option value="">置顶一年</option>
                    </select>　　　　　　　　消费金币： <input type="text" name="gold" class="text small" value="0"/>
                </td>
            </tr>
            <tr>
                <td>阅读权限： <select name="limit" id="">
                        <option value="">开放浏览</option>
                        <option value="">初级会员</option>
                        <option value="">中级会员</option>
                        <option value="">高级会员</option>
                        <option value="">vip会员</option>
                    </select>　　　　　　　　标题颜色：<select name="color" id="">
                        <option value="">默认颜色</option>
                        <option value="red" style="color: red">红色</option>
                        <option value="blue" style="color: blue">蓝色</option>
                        <option value="orange" style="color: orange">橙色</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" name="send" value="发布文档"/> <input type="reset" value="重置"/></td>
            </tr>

        </table>
    </form>
{/if}
{if $update}
{/if}


</body>
</html>