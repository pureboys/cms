function checkLogin() {
    var fm = document.login;
    if (fm.admin_user.value == '' || fm.admin_user.value.length < 2 || fm.admin_user.value.length > 20) {
        alert('用户名不得为空或者小于2位或者大于20位');
        fm.admin_user.focus();
        return false;
    }
    if (fm.admin_pass.value == '' || fm.admin_pass.value.length < 2) {
        alert('密码不得为空或者小于6位');
        fm.admin_pass.focus();
        return false;
    }
    if (fm.code.value.length != 4) {
        alert('验证码必须为4位');
        fm.code.focus();
        return false;
    }
    return true;
}
