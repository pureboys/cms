var sidebar = [];
sidebar[1] = {
	'title': '侧栏2',
	'link': 'http://taobao.com',
	'pic': '/uploads/20140526/20140526140757784.png'
};
sidebar[2] = {
	'title': '侧栏12',
	'link': 'http://taobao.com',
	'pic': '/uploads/20140526/20140526140713895.png'
};
var i = Math.floor(Math.random() * 2 + 1);
document.write('<a class="adv" target="_blank" title="' + sidebar[i].title + '" href="' + sidebar[i].link + '"><img border="0" src="' + sidebar[i].pic + '" /></a>');
