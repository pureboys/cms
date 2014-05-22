var sidebar = [];
sidebar[1] = {
    'title': '新浪发威啦',
    'link': 'http://weibo.com',
    'pic': '/images/sidebar1.png'
};
sidebar[2] = {
    'title': '腾讯发威啦',
    'link': 'http://qq.com',
    'pic': '/images/sidebar2.png'
};
sidebar[3] = {
    'title': '淘宝发威啦',
    'link': 'http://taobao.com',
    'pic': '/images/sidebar3.png'
};

var i = Math.floor(Math.random() * 3 + 1);
document.write('<a class="adv" target="_blank" title="' + sidebar[i].title + '" href="' + sidebar[i].link + '"><img src="' + sidebar[i].pic + '" /></a>');
