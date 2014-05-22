var text = [];
text[1] = {
    'title': '新浪发威啦',
    'link': 'http://weibo.com'
};
text[2] = {
    'title': '腾讯发威啦',
    'link': 'http://qq.com'
};
text[3] = {
    'title': '百度发威啦',
    'link': 'http://baidu.com'
};
text[4] = {
    'title': '淘宝发威啦',
    'link': 'http://taobao.com'
};
text[5] = {
    'title': '网易发威啦',
    'link': 'http://163.com'
};
var i = Math.floor(Math.random() * 5 + 1);
document.write('<a class="adv" href="' + text[i].link + '">' + text[i].title + '</a>');

