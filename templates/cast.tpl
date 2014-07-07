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
            {if $showGetVote}
                <div class="page">
                    <article>
                        <div class="page-header page-header-resume">
                            <h1>调查投票</h1>
                        </div>
                        <!-- end page-header -->

                        <table class="vote-table">
                            <caption>{$vote_title}</caption>
                            <tr>
                                <th width="15%">投票项目</th>
                                <th width="65%">图示比例</th>
                                <th width="10%">百分比</th>
                                <th width="10%">得票数</th>
                            </tr>
                            {if $vote_item}
                                {foreach $vote_item(key,value)}
                                    <tr>
                                        <td width="15%">{@value->title}</td>
                                        <td width="65%">
                                            <div class="progress progress-striped active" style="width: 90%">
                                                <div class="progress-bar {@value->picclass}" role="progressbar"
                                                     aria-valuenow="{@value->picwidth}" aria-valuemin="0"
                                                     aria-valuemax="100" style="width: {@value->picwidth}%">
                                                </div>
                                                <!-- end progress bar -->
                                            </div>
                                            <!-- end progress -->
                                        </td>
                                        <td width="10%">{@value->percent}</td>
                                        <td width="10%">{@value->count}</td>
                                    </tr>
                                {/foreach}
                            {/if}
                        </table>

                    </article>
                    <!-- end article -->
                </div>
                <!-- end page -->
            {/if}

            {if $showVote}
                <div class="page">
                    <article>
                        <div class="page-header page-header-resume">
                            <h1>调查投票</h1>
                        </div>
                        <!-- end page-header -->

                        <form action="cast.php?action=sendVote" method="post">
                            {if $vote_item}
                                {foreach $vote_item(key,value)}
                                    <label class="radio"><input type="radio" name="vote"
                                                                value="{@value->id}"/>{@value->title}
                                        <span></span></label>
                                {/foreach}
                            {/if}
                            <p><input type="submit" class="btn btn-sm btn-default" value="投票" name="send"/> <input
                                        type="button" class="btn btn-sm btn-default" value="查看"
                                        onclick="javascript:window.open('cast.php?action=getVote')"/></p>
                        </form>

                    </article>
                    <!-- end article -->
                </div>
                <!-- end page -->
            {/if}

        </div>
        <!-- end col -->
    </div>
    <!-- end row -->
</div>
<!-- end wrapper -->

{include file='footer.tpl'}


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/rebound.js"></script>

</body>
</html>