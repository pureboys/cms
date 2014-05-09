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
    <h3><a href="###">四大行封杀余额宝违反《反垄断法》</a></h3>

    <p>对此，马云发文表达强烈抗议，“ 市场更不怕竞争，市场怕不公平……决定市场胜负的不应该是垄断和权力，而是用户！……也不知道谁给银行们权力，可以伤害储户支配自己资金的权力。更不知道谁来监管四大“国手”联合封杀的...<a
                href="###">[阅读全文]</a></p>

    <p class="link">
        <a href="###">逾500名埃及前总统穆尔西支</a>|
        <a href="###"> 深圳公务员分类改革:退休人员多</a>
        <a href="###">日本宣布归还美国高浓缩铀与武器级钚</a>|
        <a href="###">北京城市总体规划将调整修改</a>
    </p>
    <ul>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
    </ul>
</div>
<div id="pic">
    <img src="/images/adverleft.png" alt="新闻图片"/>
</div>
<div id="rec">
    <h2>特别推荐</h2>
    <ul>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
    </ul>
</div>
<div id="sidebar-right">
    <div class="adver"><img src="/images/adver2.png" alt="广告图"/></div>
    <div class="hot">
        <h2>本月热点</h2>
        <ul>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        </ul>
    </div>
    <div class="comm">
        <h2>本月评论</h2>
        <ul>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
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
    <dl>
        <dt><a href="###"><img src="/images/pic1.png" alt="标题"/></a></dt>
        <dd><a href="###">号外！号外！士兵检阅时晕倒！</a></dd>
    </dl>
    <dl>
        <dt><a href="###"><img src="/images/pic2.png" alt="标题"/></a></dt>
        <dd><a href="###">号外！号外！士兵检阅时晕倒！</a></dd>
    </dl>
    <dl>
        <dt><a href="###"><img src="/images/pic3.png" alt="标题"/></a></dt>
        <dd><a href="###">号外！号外！士兵检阅时晕倒！</a></dd>
    </dl>
    <dl>
        <dt><a href="###"><img src="/images/pic4.png" alt="标题"/></a></dt>
        <dd><a href="###">号外！号外！士兵检阅时晕倒！</a></dd>
    </dl>
</div>
<div id="newslist">
    <div class="list bottom">
        <h2><a href="###">更多</a>军事动态</h2>
        <ul>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        </ul>
    </div>
    <div class="list right bottom">
        <h2><a href="###">更多</a>八卦娱乐</h2>
        <ul>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        </ul>
    </div>
    <div class="list">
        <h2><a href="###">更多</a>时尚女人</h2>
        <ul>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        </ul>
    </div>
    <div class="list right">
        <h2><a href="###">更多</a>科技频道</h2>
        <ul>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
            <li><em>06-20</em><a href="###">天空飘来五个字，那都不是事儿...</a></li>
        </ul>
    </div>
</div>

{include file='footer.tpl'}
</body>
</html>