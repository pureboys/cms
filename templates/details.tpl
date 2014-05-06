<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/style/basic.css"/>
    <link rel="stylesheet" href="/style/details.css"/>
    <script src="/config/static.php?id={$id}&type=details"></script>
</head>
<body>

{include file='header.tpl'}
<div id="details">
    <h2>当前位置 &gt; {$nav}</h2>
    <h3>{$titles}</h3>
    <div class="d1">时间：{$date} 来源：{$source} 作者：{$author} 点击量：{$count}</div>
    <div class="d2">{$info}</div>
    <div class="d3">{$content}</div>
</div>
<div id="sidebar">
    <div class="right">
        <h2>本类推荐</h2>
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
    <div class="right">
        <h2>本类热点</h2>
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
    <div class="right">
        <h2>本类图文</h2>
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
</div>

{include file='footer.tpl'}
</body>
</html>