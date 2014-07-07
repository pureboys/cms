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
            </div>
            <!-- end navbar -->
        </div>
        <!-- end col -->

        <div class="col-md-9 content">
            <div class="page">
                {foreach $CommendContent(key,value)}
                <article>
                    <div class="page-header">
                        <h1>{@value->title}</h1>

                        <p class="lead">{@value->info}</p>
                    </div>
                    <!-- end page-header -->
                    <ul class="list-inline post-meta">
                        <li><span class="fa fa-calendar">{@value->date}</span></li>
                        <li><span class="fa fa-user"></span> 作者：<a href="#none">{@value->author}</a></li>
                        <li><span class="fa fa-list-ul"></span>来源：{@value->source}</li>
                        <li><span class="fa fa-comments"></span><a
                                    href="/feedback.php?cid={@value->id}">已经有<span>{@value->commend}</span>人参与评论</a></li>
                    </ul>
                </article>
                <div class="clearfix"></div>
                {/foreach}
            </div>
            <!-- end portfolio-wrapper -->
            <div class="pagination-wrapper">
                <p class="pagination">
                    {$page}
                </p>
            </div>
            <!-- end pagination-wrapper -->
        </div>
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

</body>
</html>