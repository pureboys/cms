<script src="/config/static.php?type=header"></script>
<div id="top">
    {$header}
    <script src="/js/text_adver.js"></script>
</div>
<div id="header">
    <h1><a href="###">web俱乐部</a></h1>

    <div class="adver"><script src="/js/header_adver.js"></script></div>
</div>
<div id="nav">
    <ul>
        <li><a href="./">首页</a></li>
        {if $FrontNav}
            {foreach $FrontNav(key,value)}
                <li><a href="list.php?id={@value->id}">{@value->nav_name}</a></li>
            {/foreach}
        {/if}
    </ul>
</div>
<div id="search">
    <form action="search.php" method="get">
        <select name="type" id="">
            <option value="1" selected>按标题</option>
            <option value="2">按关键字</option>
        </select>
        <input type="text" name="inputkeyword" class="text"/>
        <input type="submit"  value="搜索" class="submit"/>
    </form>
    <strong>TAG标签：</strong>
    <ul>
        {if $FiveTag}
        {foreach $FiveTag(key,value)}
        <li><a href="search.php?type=3&inputkeyword={@value->tagname}">{@value->tagname}({@value->count})</a></li>
        {/foreach}
        {/if}
    </ul>
</div>