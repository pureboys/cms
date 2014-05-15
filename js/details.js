//验证评论
function checkComment() {
    var fm = document.comment;
    if (fm.content.value == '' || fm.content.value.length > 255) {
        alert('评论不得为空或者大于255位');
        fm.content.focus();
        return false;
    }

    if (fm.code.value.length != 4) {
        alert('验证码必须为4位');
        fm.code.focus();
        return false;
    }
    return true;
}



