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
            {if $reg}
                <form action="?action=reg" method="post" name="reg">
                    <div class="page">
                        <article>
                            <div class="page-header page-header-resume">
                                <img name="faceimg" src="/images/01.gif" alt="01.gif" class="face"/>

                                <h1>会员注册</h1>

                                <p class="lead">注册会员能够为您提供更好的服务和更多的使用权限.</p>
                            </div>
                            <!-- end page-header -->
                            <h4>基本信息</h4>
                            <dl>
                                <dd>用户名: <span class="red">[必填]</span> (*用户名在2到20位之间) <input type="text"
                                                                                             class="form-control"
                                                                                             name="user"/></dd>
                                <dd>密码: <span class="red">[必填]</span> (*密码不得小于6位) <input type="password"
                                                                                         class="form-control"
                                                                                         name="pass"/></dd>
                                <dd>密码确认: <span class="red">[必填]</span> (*和密码一致) <input type="password"
                                                                                        class="form-control"
                                                                                        name="notpass"/></dd>
                                <dd>电子邮件: <span class="red">[必填]</span> (*每个电子邮件只能注册一个ID) <input type="text"
                                                                                                 class="form-control"
                                                                                                 name="email"/>
                                </dd>
                            </dl>
                            <hr/>
                            <h4>选择头像</h4>
                            <dl>
                                <dd>
                                    <select name="face" id="" onchange="sface();" class="form-control">
                                        {foreach $OptionFaceOne(key,value)}
                                            <option value="0{@value}.gif">0{@value}.gif</option>
                                        {/foreach}
                                        {foreach $OptionFaceTwo(key,value)}
                                            <option value="{@value}.gif">{@value}.gif</option>
                                        {/foreach}
                                    </select>
                                </dd>
                            </dl>
                            <hr/>
                            <h4>安全问题</h4>
                            <dl>
                                <dd>安全问题: <select name="question" id="" class="form-control">
                                        <option value="">没有任何安全问题</option>
                                        <option value="您父亲的姓名">您父亲的姓名</option>
                                        <option value="您母亲的职业">您母亲的职业</option>
                                        <option value="您配偶的性别">您配偶的性别</option>
                                    </select></dd>
                                <dd>问题答案: <input type="text" name="answer" class="form-control"/></dd>
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
                                    <input type="submit" name="send" value="注册会员" class="btn btn-lg btn-default"
                                           onclick="return checkReg();"/>
                                </dd>
                            </dl>
                        </article>
                        <!-- end article -->
                    </div>
                    <!-- end page -->
                </form>
            {/if}

            {if $login}
                <form action="?action=login" method="post" name="login">
                    <div class="page">
                        <article>
                            <h4>登陆信息</h4>
                            <dl>
                                <dd>用 户 名: <span class="red">[必填]</span> (*用户名在2到20位之间) <input type="text"
                                                                                               class="form-control"
                                                                                               name="user"/></dd>
                                <dd>密　　码: <span class="red">[必填]</span> (*密码不得小于6位) <input type="password"
                                                                                           class="form-control"
                                                                                           name="pass"/></dd>
                                <dd class="login-dd"><span>登录保留:</span>
                                    <label class="radio"><input type="radio" name="time" checked value="0"/>不保留
                                        <span></span></label>
                                    <label class="radio"><input type="radio" name="time" value="86400"/>一天 <span></span></label>
                                    <label class="radio"><input type="radio" name="time" value="604800"/>一周
                                        <span></span></label>
                                    <label class="radio"><input type="radio" name="time" value="2592000"/>一月
                                        <span></span></label>
                                </dd>
                            </dl>
                            <hr class="clearfix"/>
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
                                    <input type="submit" name="send" value="登录会员" class="btn btn-lg btn-default"
                                           onclick="return checkLogin();"/>
                                </dd>
                            </dl>
                        </article>
                        <!-- end article -->
                    </div>
                    <!-- end page -->
                </form>
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
<script src="/js/reg.js"></script>
</body>
</html>