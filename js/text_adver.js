var text = [];
text[1] = {
	'title': '淘宝广告11',
	'link': 'http://taobao.com'
};
text[2] = {
	'title': '新浪微博',
	'link': 'http://weibo.com'
};
text[3] = {
	'title': '腾讯新广告',
	'link': 'http://qq.com'
};
var i = Math.floor(Math.random() * 3 + 1);
document.write('<a target="_blank" class="adv" href="' + text[i].link + '">' + text[i].title + '</a>');
