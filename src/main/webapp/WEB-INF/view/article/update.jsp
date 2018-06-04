<%@ page language="java" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>修改文章</title>
    <link rel="stylesheet" href="/resources/js/kindeditor-4.1.10/themes/default/default.css"/>
    <link rel="stylesheet" href="/resources/js/kindeditor-4.1.10/plugins/code/prettify.css"/>
    <script charset="utf-8" src="/resources/js/kindeditor-4.1.10/kindeditor.js"></script>
    <script charset="utf-8" src="/resources/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script charset="utf-8" src="/resources/js/kindeditor-4.1.10/plugins/code/code.js"></script>
    <script>
        KindEditor.ready(function (K) {
            var editor1 = K.create('textarea[name="content"]', {
                cssPath: '/resources/js/kindeditor-4.1.10/plugins/code/prettify.css',
                uploadJson: '/resources/js/kindeditor-4.1.10/jsp/upload_json.jsp',
                fileManagerJson: '/resources/jskindeditor-4.1.10/jsp/file_manager_json.jsp',
                allowImageUpload: true,
                allowFileManager: true,
                afterUpload: function () {
                    this.sync();
                },
                afterBlur: function () {
                    this.sync();
                }

            });
        });
    </script>
</head>

<body>
<form action="/article/update" method="post" enctype="multipart/form-data">
    <table border="1" cellspacing="0">
        <input type="hidden" name="id" value="${article.id}"/>
        <input type="hidden" name="userid" value="${article.userid}"/>
        <tr>
            <td>标题：</td>
            <td><input type="text" id="name" name="name" size="100" value="${article.name}"/></td>
        </tr>
        <tr>
            <td>摘要：</td>
            <td><textarea name="abstract" rows="10" cols="100">${article.abstractinfo}</textarea></td>
        </tr>
        <tr>
            <td>展示面：</td>
            <td><input type="file" id="image" name="image" value="${article.imagepath}"/></td>
        </tr>
        <!-- 文件上传中，po类的成员变量不能和元素name属性重名 -->
    </table>
    <br>
    <fieldset>
        <legend>
            内容
        </legend>
        <textarea name="content" id="content" cols="100" rows="8"
                  style="width:100%;height:800px;">${article.contentString}</textarea>
    </fieldset>
    <br/>
    <input type="submit" value="提交修改"/>
</form>
</body>
</html>
