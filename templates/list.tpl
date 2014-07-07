<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{$webname}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Le styles -->
    <link href="/style/bootstrap.css" rel="stylesheet">
    <link href="/style/font-awesome.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="/style/font-awesome-ie7.min.css">
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/style/style.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="/js/html5.js"></script>
    <script src="/js/respond.src.js"></script>
    <![endif]-->

</head>
<body>


<div class="wrapper">
    <div class="row">
        <div class="col-md-3 sidebar">
            <div class="navbar" role="navigation">

                {include file='header.tpl'}
                <div class="collapse navbar-collapse">

                    <ul class="nav navbar-nav hidden-sm hidden-xs">
                        <li class="title">当前位置</li>
                        <li class="active">{$nav}</li>
                    </ul>

                    <ul class="nav navbar-nav">
                        <li class="title">子栏目列表</li>
                        {if $childnav}
                            {foreach $childnav(key,value)}
                                <li><a href="list.php?id={@value->id}">{@value->nav_name}</a></li>
                            {/foreach}
                        {else}
                            <li>该栏目没有子类</li>
                        {/if}
                    </ul>
                </div>

            </div>
            <!-- end navbar -->
        </div>
        <!-- end col -->

        <div class="col-md-9 content">
            <div class="portfolio-wrapper isotope" style="position: relative; overflow: hidden; height: 1960px;">

                {if $AllListContent}
                    {foreach $AllListContent(key,value)}
                        <div class="card film art isotope-item"
                             style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(0px, 0px, 0px); width: 250px;">
                            <a href="details.php?id={@value->id}" class="thumb">
                                <img src="{@value->thumbnail}" alt="{@value->title}" title="">
                                <span class="overlay"><span class="fa fa-search"></span></span>
                            </a>

                            <div class="card-body">
                                <h2><a href="details.php?id={@value->id}">{@value->title}</a></h2>

                                <p>{@value->info}</p>

                                <p><a href="details.php?id={@value->id}">了解更多</a></p>
                            </div>
                            <!-- end card-body -->
                            <div class="card-footer">
                                <ul class="list-inline filters">
                                    <li>{@value->keyword}</li>
                                </ul>
                            </div>
                            <!-- end card-footer -->
                        </div>
                        <!-- end card -->
                    {/foreach}
                {else}
                    <div>Sorry,现在没有任何数据</div>
                {/if}


            </div>
            <!-- end portfolio-wrapper -->
            <div class="pagination-wrapper">
                <p class="pagination">
                    {$page}
                </p>
            </div>
            <!-- end pagination-wrapper -->
        </div>
        <!-- end col -->
    </div>
    <!-- end row -->
</div>
<!-- end wrapper -->

{include file='footer.tpl'}

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/rebound.js"></script>
<script src="/js/jquery.isotope.min.js"></script>
<script src="/js/list.js"></script>


</body>
</html>