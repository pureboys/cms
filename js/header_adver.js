var header = [];
header[1] = {
    'title': '新浪发威啦',
    'link': 'http://weibo.com',
    'pic': '/images/header1.png'
};
header[2] = {
    'title': '腾讯发威啦',
    'link': 'http://qq.com',
    'pic': '/images/header2.png'
};
header[3] = {
    'title': '淘宝发威啦',
    'link': 'http://taobao.com',
    'pic': '/images/header3.png'
};

var i = Math.floor(Math.random() * 3 + 1);
document.write('<a class="adv" target="_blank" title="' + header[i].title + '" href="' + header[i].link + '"><img src="' + header[i].pic + '" /></a>');
