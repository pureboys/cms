<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/style/basic.css"/>
    <link rel="stylesheet" href="/style/home.css"/>
    <script src="/js/reg.js"></script>
    <script src="/config/static.php?type=index"></script>
</head>
<body>

{include file='header.tpl'}
<div id="user">
    {if $cache}
        {$member}
    {else}
        {if $login}
            <h2>会员登录</h2>
            <form action="/register.php?action=login" method="post" name="login">
                <label for="">用户名：<input type="text" name="user" class="text"/></label>
                <label for="">密　码：<input type="password" name="pass" class="text"/></label>
                <label for="" class="yzm">验证码：<input type="text" name="code" class="text code"/>
                    <img src="/config/code.php"
                         onclick="javascript:this.src='/config/code.php?tm='+Math.random();" class="code"/>
                </label>

                <p><input type="submit" name="send" value="登录" class="submit" onclick="return checkLogin();"/> <a
                            href="register.php?action=reg">注册会员</a> <a
                            href="###">忘记密码</a>
                </p>
            </form>
        {else}
            <h2>会员信息</h2>
            <div class="a">您好, <strong>{$user}</strong> 欢迎光临</div>
            <div class="b">
                <img src="/images/{$face}" alt="{$user}"/>
                <a href="###">个人中心</a>
                <a href="###">我的评论</a>
                <a href="/register.php?action=logout">退出登录</a>
            </div>
        {/if}
    {/if}

    <h3>最近登录会员<span>─────────────</span></h3>
     {if $AllLaterUser}
     {foreach $AllLaterUser(key,value)}
    <dl>
        <dt><img src="/images/{@value->face}" alt="{@value->user}"/></dt>
        <dd>{@value->user}</dd>
    </dl>
    {/foreach}
    {/if}

</div>
<div id="news">
    <h3><a href="/details.php?id={$TopId}" target="_blank">{$TopTitle}</a></h3>

    <p>{$TopInfo}<a href="/details.php?id={$TopId}" target="_blank">[阅读全文]</a></p>

    <p class="link">
        {if $NewTopList}
        {foreach $NewTopList(key,value)}
        <a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a>{@value->line}
        {/foreach}
        {/if}
    </p>
    <ul>
        {if $NewList}
        {foreach $NewList(key,value)}
        <li><em>{@value->date}</em><a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a></li>
        {/foreach}
        {/if}
    </ul>
</div>
<div id="pic">
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="scriptmain" name="scriptmain" codebase="http://download.macromedia.com/pub/shockwave/cabs/
	flash/swflash.cab#version=6,0,29,0" width="268" height="193">
        <param name="movie" value="/images/lbxml.swf">
        <param name="quality" value="high">
        <param name="scale" value="noscale">
        <param name="LOOP" value="false">
        <param name="menu" value="false">
        <param name="wmode" value="transparent">
        <embed src="/images/lbxml.swf" width="268" height="193" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false" wmode="transparent">
    </object>
</div>
<div id="rec">
    <h2>特别推荐</h2>
    <ul>
        {if $NewRecList}
        {foreach $NewRecList(key,value)}
        <li><em>{@value->date}</em><a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a></li>
        {/foreach}
        {/if}
    </ul>
</div>
<div id="sidebar-right">
    <div class="adver"><script src="/js/sidebar_adver.js"></script></div>
    <div class="hot">
        <h2>本月热点</h2>
        <ul>
            {if $MonthHotList}
                {foreach $MonthHotList(key,value)}
                    <li><em>{@value->date}</em><a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a></li>
                {/foreach}
            {/if}
    </div>
    <div class="comm">
        <h2>本月评论</h2>
        <ul>
            {if $MonthCommentList}
                {foreach $MonthCommentList(key,value)}
                    <li><em>{@value->date}</em><a href="/details.php?id={@value->id}" target="_blank">{@value->title}</a></li>
                {/foreach}
            {/if}
        </ul>
    </div>
    <div class="vote">
        <h2>调查投票</h2>

        <h3>请问你是怎么知道本站的</h3>

        <form action="">
            <label for=""><input type="radio" name="vote" checked/>门户搜索引擎</label>
            <label for=""><input type="radio" name="vote"/>Google或百度搜索</label>
            <label for=""><input type="radio" name="vote"/>别的网站连接</label>
            <label for=""><input type="radio" name="vote"/>电视广告和朋友介绍</label>

            <p><input type="submit" value="投票" name="send"/> <input type="button" value="查看"/></p>
        </form>
    </div>
</div>
<div id="picnews">
    <h2>图文资讯</h2>
    {if $PicList}
        {foreach $PicList(key,value)}
    <dl>
        <dt><a href="/details.php?id={@value->id}"><img src="{@value->thumbnail}" alt="{@value->title}"/></a></dt>
        <dd><a href="/details.php?id={@value->id}">{@value->title}</a></dd>
    </dl>
        {/foreach}
    {/if}
</div>
<div id="newslist">
    {if $FourNav}
        {foreach $FourNav(key,value)}
        <div class="{@value->class}">
            <h2><a href="/list.php?id={@value->id}" target="_blank">更多</a>{@value->nav_name}</h2>
            <ul>
            {iff @value->list}
                {for @value->list(key,value)}
                    <li><em>{@value->date}</em><a href="/details.php?id={@value->id}">{@value->title}</a></li>
                {/for}
                {else}
            {/iff}
            </ul>
        </div>
        {/foreach}
    {/if}
</div>

{include file='footer.tpl'}
</body>
</html>