window.onload = function () {

    var ol = document.getElementsByTagName('ol');
    var a = ol[0].getElementsByTagName('a');
    var title = document.getElementById('title');
    for (i = 0; i < a.length; i++) {
        a[i].className = null;
        if (title.innerHTML == a[i].innerHTML) {
            a[i].className = 'selected';
        }
    }
};

function centerWindow(url, name, width, height) {
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2 - 50;
    window.open(url, name, 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
}

//验证add content
function checkAddRotation() {
    var fm = document.content;
    if (fm.thumbnail.value == '') {
        alert('轮播图不能为空');
        fm.thumbnail.focus();
        return false;
    }
    if (fm.link.value == '') {
        alert('连接不能为空');
        fm.link.focus();
        return false;
    }
    if (fm.title.value.length > 20) {
        alert('标题不能大于20位');
        fm.title.focus();
        return false;
    }
    if (fm.info.value.length > 200) {
        alert('内容不能大于200位');
        fm.info.focus();
        return false;
    }
    return true;
}







