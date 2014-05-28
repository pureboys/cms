<div id="link">
    <h2><span><a href="friendlink.php?action=frontshow" target="_blank">所有连接</a> | <a href="friendlink.php?action=frontadd" target="_blank">申请加入</a></span>友情连接</h2>
    <ul>
        {if $text}
        {foreach $text(key,value)}
        <li><a href="{@value->weburl}" target="_blank">{@value->webname}</a></li>
        {/foreach}
        {/if}
    </ul>
    <dl>
        {if $logo}
        {foreach $logo(key,value)}
        <dd><a href="{@value->weburl}" target="_blank"><img src="{@value->logourl}" alt="{@value->webname}"/></a></dd>
        {/foreach}
        {/if}
    </dl>
</div>
<div id="footer">
    <p>Powerby mycms @oliver</p>
    <p>CopyRight(C) 2014 mycms</p>
</div>