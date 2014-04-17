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
    if (fm.level_name.value == '' || fm.level_name.value.length < 2 || fm.level_name.value.length > 20) {
        alert('等级名称不得为空或者小于2位或者不得大于20位');
        fm.level_name.focus();
        return false;
    }
    if (fm.level_info.value.length > 200) {
        alert('等级信息不得大于200位');
        fm.level_info.focus();
        return false;
    }
    return true;
}








