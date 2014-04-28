<div id="top">
    {$title}
    <a href="###">文字广告1</a>
    <a href="###">文字广告2</a>
</div>
<div id="header">
    <h1><a href="###">web俱乐部</a></h1>

    <div class="adver"><a href="###"><img src="/images/adver.png" alt="广告图"/></a></div>
</div>
<div id="nav">
    <ul>
        <li><a href="###">首页</a></li>
        {if $FrontNav}
            {foreach $FrontNav(key,value)}
                <li><a href="###{@value->id}">{@value->nav_name}</a></li>
            {/foreach}
        {/if}
    </ul>
</div>
<div id="search">
    <form action="">
        <select name="search" id="">
            <option value="" selected>按标题</option>
            <option value="">按关键字</option>
            <option value="">全局查询</option>
        </select>
        <input type="text" name="keyword" class="text"/>
        <input type="submit" name="send" value="搜索" class="submit"/>
    </form>
    <strong>TAG标签：</strong>
    <ul>
        <li><a href="###">基金(1)</a></li>
        <li><a href="###">美女(1)</a></li>
        <li><a href="###">白兰地(2)</a></li>
        <li><a href="###">音乐(12)</a></li>
        <li><a href="###">体育(34)</a></li>
        <li><a href="###">直播(323)</a></li>
        <li><a href="###">会晤(34)</a></li>
        <li><a href="###">韩日(4)</a></li>
        <li><a href="###">警方(7)</a></li>
        <li><a href="###">广州(3)</a></li>
    </ul>
</div>