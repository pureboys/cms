<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/style/basic.css"/>
    <link rel="stylesheet" href="/style/cast.css"/>
</head>
<body>

{include file='header.tpl'}
<div id="cast">
    <h2>调查投票</h2>
    <table cellspacing="1">
        <caption>{$vote_title}</caption>
        <tr><th>投票项目</th><th>图示比例</th><th>百分比</th><th>得票数</th></tr>
        {if $vote_item}
        {foreach $vote_item(key,value)}
        <tr><td>{@value->title}</td><td style="text-align: left;width: {$width}px;"><img src="/images/b{@value->picnum}.jpg" alt="" style="width:{@value->picwidth}px;height: 21px;"/></td><td>{@value->percent}</td><td>{@value->count}</td></tr>
        {/foreach}
        {/if}
    </table>
</div>
{include file='footer.tpl'}
</body>
</html>