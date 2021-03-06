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

                </div>
            </div>
            <!-- end navbar -->
        </div>
        <!-- end col -->

        <div class="col-md-9 content blog post">
            <div class="page">
                <article>
                    <div class="page-header">
                        <h1>{$titles}</h1>

                        <p class="lead">{$info}</p>
                    </div>
                    <!-- end page-header -->
                    <ul class="list-inline post-meta">
                        <li><span class="fa fa-calendar"></span>{$date}</li>
                        <li><span class="fa fa-user"></span> 作者：{$author}</li>
                        <li><span class="fa fa-list-ul"></span>来源：{$source}</li>
                        <li><span class="fa fa-tags">Tag:{$tag}</span></li>
                        <li><span class="fa fa-comments"></span><a
                                    href="/feedback.php?cid={$id}">已经有<span>{$comment}</span>人参与评论</a></li>
                    </ul>
                    <!-- end post-meta -->
                    <div class="post-content">
                        {$content}
                    </div>
                    <!-- end post-content -->
                </article>
                <div id="comments">
                    <h3 class="comments-title">最新评论</h3>
                    <ol class="commentlist">
                        {if $NewThreeComment}
                            {foreach $NewThreeComment(key,value)}
                                <li class="comment even thread-even depth-1">
                                    <div id="comment-2">
                                        <img alt="" src="/images/{@value->face}" class="avatar avatar-60 photo"
                                             height="60" width="60">

                                        <div>
                                            <div class="comment-author vcard">
                                                <cite class="fn"><a href="javascript:;" rel="external nofollow"
                                                                    class="url">{@value->user}</a></cite>
                                            </div>
                                            <!-- end comment-author -->
                                            <div class="comment-meta commentmetadata">
                                                <a href="javascript:;">{@value->date}</a> &nbsp;&nbsp;<a
                                                        href="/feedback.php?cid={@value->cid}&id={@value->id}&type=sustain"
                                                        target="_blank">[{@value->sustain}]支持</a> <a
                                                        href="/feedback.php?cid={@value->cid}&id={@value->id}&type=oppose"
                                                        target="_blank">[{@value->oppose}]反对</a>
                                            </div>
                                            <!-- end comment-meta -->
                                            <div class="comment-body">
                                                {@value->manner}:{@value->content}
                                            </div>
                                            <!-- end comment-body -->
                                        </div>
                                        <!-- end div -->
                                    </div>
                                    <!-- end comment -->
                                </li>
                            {/foreach}
                        {else}
                            <li class="comment even thread-even depth-1">当前没有评论</li>
                        {/if}

                    </ol>
                    <div id="respond">
                        <h3 id="reply-title">我的评论
                            <small><a rel="nofollow" id="cancel-comment-reply-link" href="#respond"
                                      style="display:none;">Cancel Reply</a></small>
                        </h3>
                        <form method="post" id="commentform" target="_blank" name="comment"
                              action="feedback.php?cid={$id}">
                            <div class="form-group">
                                你对本文的态度:&nbsp;&nbsp;
                                <label class="radio"><input type="radio" name="manner" value="1"/>支持
                                    <span></span></label>
                                <label class="radio"><input type="radio" name="manner" value="0"
                                                            checked/>中立<span></span></label>
                                <label class="radio"><input type="radio" name="manner"
                                                            value="-1"/>反对<span></span></label>
                            </div>
                            <div class="form-group">
                                <div class="comment-form-comment">
                                    <label class="control-label" for="url">请不要发表关于政治、反动、色情评论</label>
                                    <textarea id="comment" class="form-control" name="content" cols="45" rows="8"
                                              aria-required="true" placeholder="输入你的评论"></textarea>
                                </div>
                                <!-- end comment-form-comment -->
                            </div>
                            <!-- end form-group -->
                            <div class="form-group">
                                验证码：<br/>
                                <input type="text" class="form-control width-150 pull-left " name="code"/>
                                <img src="/config/code.php"
                                     onclick="javascript:this.src='/config/code.php?tm='+Math.random();"
                                     class="pull-left" style="position: relative;top: -10px; left: 10px;"/>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-submit">
                                <input name="send" type="submit" id="submit" class="btn btn-lg btn-primary" value="提交评论"
                                       onclick="return checkComment()">
                            </div>
                            <!-- end form-submit -->
                        </form>
                    </div>
                    <!-- end respond -->
                </div>
                <!-- end comments -->
                <ul class="pager">

                    <li class="prev">
                        <small><span class="fa fa-chevron-left"></span>上一篇</small>
                        {if $PrevPage}
                            <h3><a href="details.php?id={$PrevPageID}">{$PrevPageTitle}</a></h3>
                            <p><span class="fa fa-calendar"></span>{$PrevPageDate}</p>
                        {/if}
                    </li>


                    <li class="next">
                        <small>下一篇<span class="fa fa-chevron-right"></span></small>
                        {if $NextPage}
                            <h3><a href="details.php?id={$NextPageID}">{$NextPageTitle}</a></h3>
                            <p><span class="fa fa-calendar"></span>{$NextPageDate}</p>
                        {/if}
                    </li>

                </ul>
            </div>
            <!-- end post -->
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

<script src="/config/static.php?id={$id}&type=details"></script>
<script src="/js/details.js"></script>


</body>
</html>