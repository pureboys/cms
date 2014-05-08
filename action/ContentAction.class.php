<?php

class ContentAction extends Action
{
    public function __construct(&$_tpl)
    {
        parent::__construct($_tpl, new ContentModel());
    }

    public function _action()
    {
        switch ($_GET['action']) {
            case  'show':
                $this->show();
                break;
            case  'add':
                $this->add();
                break;
            case 'update':
                $this->update();
                break;
            case 'delete':
                $this->delete();
                break;
            default:
                Tool::alertBack('非法操作！');
        }
    }

    private function add()
    {
        if (isset($_POST['send'])) {
            $this->getPost();
            $this->_model->addContent() ? Tool::alertLocation('文档发布成功！', '?action=show') : Tool::alertBack('警告：文档发布失败！');
        }
        $this->_tpl->assign('add', true);
        $this->_tpl->assign('show', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '新增文档');
        $this->nav();
        $this->_tpl->assign('author', $_SESSION['admin']['admin_user']);
    }


    private function show()
    {
        $this->_tpl->assign('show', true);
        $this->_tpl->assign('add', false);
        $this->_tpl->assign('update', false);
        $this->_tpl->assign('title', '文档列表');
        $this->nav();
        $_nav = new NavModel();
        if (empty($_GET['nav'])) {
            $_id = $_nav->getAllNavChildId();
            $this->_model->nav = Tool::objArrOfstr($_id, 'id');
        } else {
            $_nav->id = $_GET['nav'];
            if (!$_nav->getOneNav()) Tool::alertBack('警告：传输类别有误！');
            $this->_model->nav = $_nav->id;
        }
        parent::page($this->_model->getListContentTotal());
        $_object = $this->_model->getListContent();
        $_object = Tool::subStr($_object, 'title', '20', 'utf8');
        $this->_tpl->assign('SearchContent', $_object);
    }


    private function update()
    {
        if (isset($_POST['send'])) {
            $this->_model->id = $_POST['id'];
            $this->getPost();
            $this->_model->updateContent() ? Tool::alertLocation('文档修改成功！', $_POST['prev_url']) : Tool::alertBack('警告：文档修改失败！');
        }
        if (isset($_GET['id'])) {
            $this->_tpl->assign('show', false);
            $this->_tpl->assign('add', false);
            $this->_tpl->assign('update', true);
            $this->_tpl->assign('title', '修改文档');
            $this->_model->id = $_GET['id'];
            $_content = $this->_model->getOneContent();
            if (!$_content) Tool::alertBack('警告：不存在此文档！');
            $this->_tpl->assign('id', $_content->id);
            $this->_tpl->assign('titlec', $_content->title);
            $this->_tpl->assign('tag', $_content->tag);
            $this->_tpl->assign('keyword', $_content->keyword);
            $this->_tpl->assign('thumbnail', $_content->thumbnail);
            $this->_tpl->assign('source', $_content->source);
            $this->_tpl->assign('author', $_content->author);
            $this->_tpl->assign('content', $_content->content);
            $this->_tpl->assign('info', $_content->info);
            $this->_tpl->assign('count', $_content->count);
            $this->_tpl->assign('gold', $_content->gold);
            $this->_tpl->assign('prev_url', PREV_URL);
            $this->nav($_content->nav);
            $this->attr($_content->attr);
            $this->color($_content->color);
            $this->sort($_content->sort);
            $this->readlimit($_content->readlimit);
            $this->commend($_content->commend);
        } else {
            Tool::alertBack('警告：非法操作!');
        }

    }

    private function delete()
    {
        if (isset($_GET['id'])) {
            $this->_model->id = $_GET['id'];
            $this->_model->deleteContent() ? Tool::alertLocation('文档删除成功！', PREV_URL) : Tool::alertBack('警告：文档删除失败！');
        } else {
            Tool::alertBack('警告：非法操作!');
        }
    }

    //getPost
    private function getPost()
    {
        if (Validate::checkNull($_POST['title'])) Tool::alertBack('警告：标题不能为空！');
        if (Validate::checkLength($_POST['title'], 2, 'min')) Tool::alertBack('警告：标题长度不得小于2位');
        if (Validate::checkLength($_POST['title'], 50, 'max')) Tool::alertBack('警告：标题长度不得大于50位');
        if (Validate::checkNull($_POST['nav'])) Tool::alertBack('警告：选择一个栏目！');
        if (Validate::checkLength($_POST['tag'], 30, 'max')) Tool::alertBack('警告：标签长度不得大于30位');
        if (Validate::checkLength($_POST['keyword'], 30, 'max')) Tool::alertBack('警告：关键字长度不得大于30位');
        if (Validate::checkLength($_POST['source'], 20, 'max')) Tool::alertBack('警告：文章来源长度不得大于20位');
        if (Validate::checkLength($_POST['author'], 10, 'max')) Tool::alertBack('警告：作者长度不得大于10位');
        if (Validate::checkLength($_POST['info'], 200, 'max')) Tool::alertBack('警告：内容摘要长度不得大于200位');
        if (Validate::checkNull($_POST['content'])) Tool::alertBack('警告：详细内容不能为空！');
        if (Validate::checkNum($_POST['count'])) Tool::alertBack('警告：必须为数字');
        if (Validate::checkNum($_POST['gold'])) Tool::alertBack('警告：必须为数字');
        if (isset($_POST['attr'])) {
            $this->_model->attr = implode(',', $_POST['attr']);
        } else {
            $this->_model->attr = '无属性';
        }
        $this->_model->title = $_POST['title'];
        $this->_model->nav = $_POST['nav'];
        $this->_model->info = $_POST['info'];
        $this->_model->source = $_POST['source'];
        $this->_model->author = $_POST['author'];
        $this->_model->keyword = $_POST['keyword'];
        $this->_model->thumbnail = $_POST['thumbnail'];
        $this->_model->tag = $_POST['tag'];
        $this->_model->content = $_POST['content'];
        $this->_model->commend = $_POST['commend'];
        $this->_model->count = $_POST['count'];
        $this->_model->gold = $_POST['gold'];
        $this->_model->color = $_POST['color'];
        $this->_model->sort = $_POST['sort'];
        $this->_model->readlimit = $_POST['readlimit'];
    }


    private function nav($_n = 0)
    {
        $_nav = new NavModel();
        $_html = '';
        foreach ($_nav->getAllFrontNav() as $_object) {
            $_html .= '<optgroup label="' . $_object->nav_name . '">';
            $_nav->id = $_object->id;
            if (!!$_child_nav = $_nav->getAllChildFrontNav()) {
                foreach ($_child_nav as $_object2) {
                    $_select = '';
                    if ($_n == $_object2->id) $_select = 'selected';
                    $_html .= '<option ' . $_select . ' value="' . $_object2->id . '">' . $_object2->nav_name . '</option>';
                }
            }
            $_html .= '</optgroup>';
        }
        $this->_tpl->assign('nav', $_html);
    }

    //attr
    private function attr($_attr)
    {
        $_attrArr = array('头条', '推荐', '加粗', '跳转');
        $_attrS = explode(',', $_attr);
        $_attrNo = array_diff($_attrArr, $_attrS); //数组差集
        $_html = '';
        if ($_attrS[0] != '无属性') {
            foreach ($_attrS as $_value) {
                $_html .= '<input type="checkbox" checked name="attr[]" value="' . $_value . '"/>' . $_value;
            }
        }
        foreach ($_attrNo as $_value) {
            $_html .= '<input type="checkbox" name="attr[]" value="' . $_value . '"/>' . $_value;
        }

        $this->_tpl->assign('attr', $_html);
    }

    //color
    private function color($_color)
    {
        $_colorArr = array('' => '默认颜色', 'red' => '红色', 'blue' => '蓝色', 'orange' => '橙色');
        $_html = '';
        foreach ($_colorArr as $_key => $_value) {
            $_select = '';
            if ($_key == $_color) $_select = "selected";
            $_html .= '<option ' . $_select . ' value="' . $_key . '" style="color: ' . $_key . '">' . $_value . '</option>';
        }
        $this->_tpl->assign('color', $_html);
    }

    //sort
    private function sort($_sort)
    {
        $_sortArr = array('默认排序', '置顶一天', '置顶一周', '置顶一月', '置顶一年');
        $_html = '';
        foreach ($_sortArr as $_key => $_value) {
            $_select = '';
            if ($_key == $_sort) $_select = "selected";
            $_html .= '<option ' . $_select . ' value="' . $_key . '">' . $_value . '</option>';
        }
        $this->_tpl->assign('sort', $_html);
    }

    //readlimit
    private function readlimit($_readlimit)
    {
        $_readlimitArr = array('开放浏览', '初级会员', '中级会员', '高级会员', 'vip会员');
        $_html = '';
        foreach ($_readlimitArr as $_key => $_value) {
            $_select = '';
            if ($_key == $_readlimit) $_select = "selected";
            $_html .= '<option ' . $_select . ' value="' . $_key . '">' . $_value . '</option>';
        }
        $this->_tpl->assign('readlimit', $_html);
    }

    //comment
    private function commend($_commend)
    {
        $_commendArr = array('禁止评论', '允许评论');
        krsort($_commendArr);
        $_html = '';
        foreach ($_commendArr as $_key => $_value) {
            $_select = '';
            if ($_key == $_commend) $_select = "checked";
            $_html .= '<input type="radio" name="commend" ' . $_select . ' value="' . $_key . '" />' . $_value;
        }
        $this->_tpl->assign('commend', $_html);
    }


}