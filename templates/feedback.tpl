<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/style/basic.css"/>
    <link rel="stylesheet" href="/style/feedback.css"/>

</head>
<body>

{include file='header.tpl'}
<div id="feedback">
    <h2>评论列表</h2>
    {if $AllComment}
    {foreach $AllComment(key,value)}
    <dl>
        <dt><img src="/images/{@value->face}" alt="游客"/></dt>
        <dd><em>{@value->date} 发表</em><span>[{@value->user}]</span></dd>
        <dd class="info">{@value->manner}:{@value->content}</dd>
        <dd class="bottom"><a href="###">[0]支持</a> <a href="###">[0]反对</a></dd>
    </dl>
    {/foreach}
    {else}
        <dl>
            <dd>当前没有评论！</dd>
        </dl>
    {/if}
    <div id="page">{$page}</div>
</div>
<div id="sidebar">
    <h2>热评文档</h2>
    <ul>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
    </ul>
</div>
{include file='footer.tpl'}
</body>
</html>