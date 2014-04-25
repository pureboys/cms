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

//验证level
function checkForm() {
    var fm = document.add;
    if (fm.nav_name.value == '' || fm.nav_name.value.length < 2 || fm.nav_name.value.length > 20) {
        alert('导航名称不得为空或者小于2位或者不得大于20位');
        fm.nav_name.focus();
        return false;
    }
    if (fm.nav_info.value.length > 200) {
        alert('导航信息不得大于200位');
        fm.nav_info.focus();
        return false;
    }
    return true;
}







