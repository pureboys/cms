var header = [];
header[1] = {
	'title': 'bb霜2',
	'link': 'http://php.net',
	'pic': '/uploads/20140526/20140526100324693.png'
};
header[2] = {
	'title': 'bb霜',
	'link': 'http://baidu.com',
	'pic': '/uploads/20140526/20140526100229144.png'
};
var i = Math.floor(Math.random() * 2 + 1);
document.write('<a class="adv" target="_blank" title="' + header[i].title + '" href="' + header[i].link + '"><img src="' + header[i].pic + '" /></a>');
