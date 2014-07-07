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
    <script src="/js/link.js"></script>
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
            {if $frontadd}
                <form action="" method="post" name="friendlink">
                    <div class="page">
                        <article>
                            <div class="page-header page-header-resume">
                                <h1>友情链接</h1>

                                <p class="lead">把你的链接提供给我们吧.</p>
                            </div>
                            <!-- end page-header -->
                            <h4>基本信息</h4>
                            <dl>
                                <dd>网站类型: <label class="radio"><input type="radio" name="type" value="1" checked
                                                                      onclick="link(1)"/>文字连接<span></span></label>
                                    <label class="radio"><input type="radio" name="type" value="2" onclick="link(2)"/>Logo连接<span></span></label>
                                </dd>
                                <dd>网站名称: <span class="red">[必填]</span> (*网站名称不得大于20位且不能为空) <input type="text"
                                                                                                   class="form-control"
                                                                                                   name="webname"/></dd>
                                <dd>网站地址: <span class="red">[必填]</span> (*网站地址不得大于100位且不能为空) <input type="text"
                                                                                                    class="form-control"
                                                                                                    name="weburl"/></dd>
                                <dd id="logo" style="display: none">Logo地址: <span class="red">[必填]</span>
                                    (*Logo地址不得大于100位且不能为空) <input type="text" class="form-control" name="logourl"/>
                                </dd>
                                <dd>站长姓名: <input type="text" class="form-control" name="user"/></dd>
                            </dl>

                            <hr/>
                            <h4>验证码</h4>
                            <dl>
                                <dd>
                                    <input type="text" class="form-control width-150 pull-left " name="code"/>
                                    <img src="/config/code.php"
                                         onclick="javascript:this.src='/config/code.php?tm='+Math.random();"
                                         class="pull-left" style="position: relative;top: -10px; left: 10px;"/>
                                </dd>
                            </dl>
                            <hr/>
                            <dl>
                                <dd class="clearfix">
                                    <input type="submit" name="send" value="申请友情连接" class="btn btn-lg btn-default"
                                           onclick="return checkLink();"/>
                                </dd>
                            </dl>
                        </article>
                        <!-- end article -->
                    </div>
                    <!-- end page -->
                </form>
            {/if}

            {if $frontshow}
                <div class="page">
                    <article>
                        <div class="page-header page-header-resume">
                            <h1>所有友情连接</h1>
                        </div>
                        <!-- end page-header -->
                        <h4>文字连接</h4>
                        {if $text}
                            {foreach $Alltext(key,value)}
                                <a href="{@value->weburl}" target="_blank">{@value->webname}</a>
                            {/foreach}
                        {/if}
                        <hr/>
                        <h4>LOGO连接</h4>
                        {if $logo}
                            {foreach $Alllogo(key,value)}
                                <a href="{@value->weburl}" target="_blank"><img src="{@value->logourl}"
                                                                                alt="{@value->webname}"/></a>
                            {/foreach}
                        {/if}
                        <hr/>
                        <dl>
                            <dd class="clearfix">
                                <input type="submit" name="send" value="申请加入友情链接" class="btn btn-lg btn-default"
                                       onclick="location.href='friendlink.php?action=frontadd'"/>
                            </dd>
                        </dl>
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