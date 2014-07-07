<script src="/config/static.php?type=header"></script>
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#rebound-navbar-collapse"><span
                class="fa fa-bars"></span> Menu
    </button>
    <a href="./index.php" class="navbar-brand">{$webname}</a>

    <p class="brand-text">Do you know the pony? <br/> {$header}</p>

</div><!-- end navbar-header -->
<div class="collapse navbar-collapse" id="rebound-navbar-collapse">
    <ul class="nav navbar-nav">

        <li class="title">导航</li>
        <li><a href="./index.php">首页</a></li>
        {if $FrontNav}
            {foreach $FrontNav(key,value)}
                <li><a href="list.php?id={@value->id}">{@value->nav_name}</a></li>
            {/foreach}
        {/if}
    </ul>
    <form class="navbar-form" role="search" action="search.php" method="get">
        <select name="type" id="" class="form-control margin-bottom-5">
            <option value="1" selected>按标题</option>
            <option value="2">按关键字</option>
        </select>

        <div class="input-group">
            <input type="text" class="form-control" name="inputkeyword" placeholder="Search" value="">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="submit"><span class="fa fa-search"></span></button>
                  </span>
        </div>
        <!-- end input group -->
    </form>
    <!-- end navbar-form -->
    <ul class="nav navbar-nav nav-social hidden-sm hidden-xs">
        <li class="title">Tag标签</li>
        {if $FiveTag}
            {foreach $FiveTag(key,value)}
                <li><a href="search.php?type=3&inputkeyword={@value->tagname}">{@value->tagname}({@value->count})</a>
                </li>
            {/foreach}
        {/if}
    </ul>
</div><!-- end navbar-collapse -->