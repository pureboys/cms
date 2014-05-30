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
    if (fm.name.value == '' || fm.name.value.length < 2 || fm.name.value.length > 100) {
        alert('权限名称不得为空或者小于2位或者不得大于100位');
        fm.name.focus();
        return false;
    }
    if (fm.info.value.length > 200) {
        alert('权限描述不得大于200位');
        fm.info.focus();
        return false;
    }
    return true;
}








