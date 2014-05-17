<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/style/basic.css"/>
    <link rel="stylesheet" href="/style/details.css"/>
    <script src="/config/static.php?id={$id}&type=details"></script>
    <script src="/js/details.js"></script>
</head>
<body>

{include file='header.tpl'}
<div id="details">
    <h2>当前位置 &gt; {$nav}</h2>

    <h3>{$titles}</h3>

    <div class="d1">时间：{$date} 来源：{$source} 作者：{$author} 点击量：{$count}</div>
    <div class="d2">{$info}</div>
    <div class="d3">{$content}</div>
    <div class="d4">TAG标签：{$tag}</div>
    <div class="d6">
        <h2><a href="/feedback.php?cid={$id}" target="_blank">已经有<span>{$comment}</span>人参与评论</a>最新评论</h2>
        {if $NewThreeComment}
        {foreach $NewThreeComment(key,value)}
        <dl>
            <dt><img src="/images/{@value->face}" alt="游客"/></dt>
            <dd><em>{@value->date} 发表</em><span>[{@value->user}]</span></dd>
            <dd class="info">{@value->manner}:{@value->content}</dd>
            <dd class="bottom"><a href="/feedback.php?cid={@value->cid}&id={@value->id}&type=sustain" target="_blank">[{@value->sustain}]支持</a> <a href="/feedback.php?cid={@value->cid}&id={@value->id}&type=oppose" target="_blank">[{@value->oppose}]反对</a></dd>
        </dl>
        {/foreach}
        {else}
            <dl>
                <dd>当前没有评论！</dd>
            </dl>
        {/if}
    </div>
    <div class="d5">
        <form action="feedback.php?cid={$id}" method="post" target="_blank" name="comment">
            <p>你对本文的态度: <input type="radio" name="manner" value="1" checked />支持<input type="radio" name="manner" value="0"/>中立<input type="radio" name="manner" value="-1"/>反对</p>
            <p class="red">请不要发表关于政治、反动、色情评论</p>
            <p><textarea name="content" id="" cols="30" rows="10"></textarea></p>
            <p style="position: relative;top: -5px;">验证码：<input type="text" class="text" name="code"/>
                <img src="/config/code.php" onclick="javascript:this.src='/config/code.php?tm='+Math.random();" class="code"/>
                <input type="submit" value="提交评论" name="send" class="submit" onclick="return checkComment()"/>
            </p>
        </form>
    </div>
</div>
<div id="sidebar">
    <div class="nav">
        <h2>子栏目列表</h2>
        {if $childnav}
            {foreach $childnav(key,value)}
                <strong><a href="list.php?id={@value->id}">{@value->nav_name}</a></strong>
            {/foreach}
        {else}
            <span>该栏目没有子类</span>
        {/if}
    </div>
    <div class="right">
        <h2>本月本类推荐</h2>
        <ul>
            {if $MonthNavRec}
                {foreach $MonthNavRec(key,value)}
                    <li><em>{@value->date}</em><a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a></li>
                {/foreach}
            {/if}
        </ul>
    </div>
    <div class="right">
        <h2>本月本类热点</h2>
        <ul>
            {if $MonthNavHot}
                {foreach $MonthNavHot(key,value)}
                    <li><em>{@value->date}</em><a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a></li>
                {/foreach}
            {/if}
        </ul>
    </div>
    <div class="right">
        <h2>本月本类图文</h2>
        <ul>
            {if $MonthNavPic}
                {foreach $MonthNavPic(key,value)}
                    <li><em>{@value->date}</em><a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a></li>
                {/foreach}
            {/if}
        </ul>
    </div>
</div>

{include file='footer.tpl'}
</body>
</html>