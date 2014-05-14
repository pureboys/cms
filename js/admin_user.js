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

function checkReg() {
    var fm = document.add;
    if (fm.user.value == '' || fm.user.value.length < 2 || fm.user.value.length > 20) {
        alert('用户名不得为空或者小于2位或者大于20位');
        fm.user.focus();
        return false;
    }
    if (fm.pass.value == '' || fm.pass.value.length < 6) {
        alert('密码不得为空或者小于6位');
        fm.pass.focus();
        return false;
    }

    if (fm.pass.value != fm.notpass.value) {
        alert('密码和密码确认不一致');
        fm.notpass.focus();
        return false;
    }

    if (!/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/.test(fm.email.value)) {
        alert('邮件格式不正确');
        fm.email.value = '';
        fm.email.focus();
        return false;
    }

    if (fm.code.value.length != 4) {
        alert('验证码必须为4位');
        fm.code.focus();
        return false;
    }
    return true;
}

//选择头像
function sface() {
    var fm = document.update;
    var index = fm.face.selectedIndex;
    fm.faceimg.src = '/images/' + fm.face.options[index].value;
}

//验证修改
function checkUpdate() {
    var fm = document.update;
    if (fm.pass.value != '') {
        if (fm.pass.value.length < 6) {
            alert('密码不得小于6位');
            fm.pass.focus();
            return false;
        }
    }

    if (!/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/.test(fm.email.value)) {
        alert('邮件格式不正确');
        fm.email.value = '';
        fm.email.focus();
        return false;
    }
    return true;
}





