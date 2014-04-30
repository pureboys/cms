<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="/style/admin.css"/>
    <script src="/js/admin_manage.js"></script>
</head>
<body id="main">
<div class="map">
    管理首页 &gt;&gt;管理员管理 &gt;&gt;<strong id="title">{$title}</strong>
</div>

<ol>
    <li><a href="manage.php?action=show" class="selected">管理员列表</a></li>
    <li><a href="manage.php?action=add">新增管理员</a></li>
    {if $update}
        <li><a href="manage.php?action=update&id={$id}">修改管理员</a></li>
    {/if}
</ol>

{if $show}
    <table cellspacing="0">
        <tr>
            <th>序号</th>
            <th>管理员名称</th>
            <th>管理员等级</th>
            <th>最后登录IP</th>
            <th>最后登录时间</th>
            <th>注册时间</th>
            <th>操作</th>
        </tr>
        {if $AllManage}
            {foreach $AllManage(key,value)}
                <tr>
                    <td>
                        <script type="text/javascript">document.write({@key+1}+{$num});</script>
                    </td>
                    <td>{@value->admin_user}</td>
                    <td>{@value->level_name}</td>
                    <td>{@value->last_ip}</td>
                    <td>{@value->last_time}</td>
                    <td>{@value->reg_time}</td>
                    <td><a href="manage.php?action=update&id={@value->id}">修改</a>|<a
                                href="manage.php?action=delete&id={@value->id}"
                                onclick="return confirm('你真的要删除这个管理员么？') ? true : false">删除</a></td>
                </tr>
            {/foreach}
        {else}
            <tr>
                <td colspan="7">对不起，没有任何数据！</td>
            </tr>
        {/if}
    </table>
    <div id="page">{$page}</div>
    <p class="center">[<a href="manage.php?action=add">新增管理员</a>]</p>
{/if}

{if $add}
    <form action="" method="post" name="add">
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    用 户 名： <input type="text" name="admin_user" class="text"/>
                    (* 不得小于2位，不得大于20位)
                </td>
            </tr>
            <tr>
                <td>
                    密　　码： <input type="password" name="admin_pass" class="text"/>
                    (* 不得小于6位)
                </td>
            </tr>
            <tr>
                <td>
                    密码确认： <input type="password" name="admin_notpass" class="text"/>
                    (* 同密码一致)
                </td>
            </tr>
            <tr>
                <td>
                    等　　级：
                    <select name="level" id="">
                        {foreach $AllLevel(key,value)}
                            <option value="{@value->id}">{@value->level_name}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="新增管理员" class="submit" onclick="return checkAddForm()"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}


{if $update}
    <form action="" method="post" name="update">
        <input type="hidden" value="{$id}" name="id"/>
        <input type="hidden" value="{$level}" id="level"/>
        <input type="hidden" value="{$admin_pass}" name="pass"/>
        <input type="hidden" value="{$prev_url}" name="prev_url"/>
        <table cellspacing="0" class="left">
            <tr>
                <td>
                    用户名： <input type="text" name="admin_user" class="text" value="{$admin_user}" readonly/>
                </td>
            </tr>
            <tr>
                <td>
                    密　码： <input type="password" name="admin_pass" class="text"/>
                    (留空则不修改)
                </td>
            </tr>
            <tr>
                <td>
                    等　级：
                    <select name="level" id="">
                        {foreach $AllLevel(key,value)}
                            <option value="{@value->id}">{@value->level_name}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="send" value="修改管理员" class="submit" onclick="return checkUpdateForm();"/>
                    [ <a href="{$prev_url}">返回列表</a> ]
                </td>
            </tr>
        </table>
    </form>
{/if}

</body>
</html>