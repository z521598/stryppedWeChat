<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${currentUser.publicname}</title>

    <link rel="stylesheet" type="text/css" href="/resources/css/wechat/style.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/wechat/abstractinfo.css"/>

    <script src="/resources/js/jquery-1.9.1.min.js"></script>
    <script>
        function appendArticle(articleId) {
            console.log(articleId);
            if (articleId == 0) {
                return;
            }
            $.get("/article/" + articleId + ".json", function (article) {
                console.log(article);
                var abs = '<div class="abs-div"><a href="/article/'+articleId+'" target="_blank">' +
                        '<p class="abs-title"><b>' + article.name + '</b></p>' +
                        '<img class="abs-image"src="' + article.imagepath + '"/>' +
                        '<div class="abs-info">' +
                        (article.abstractinfo === undefined ? '无': article.abstractinfo) +
                        '</div></a></div>';
                $("#content").append(abs);
            });
        }

    </script>
</head>
<body>

<div class="btn3 clearfix">
    <c:forEach items="${categories}" var="category">
        <div class="menu" style="width:${100/fn:length(categories)}%">
            <div class="bt-name"><a href="javascript:;"
                                    onclick="appendArticle(${category.articleid})">${category.name}</a></div>
            <c:if test="${fn:length(category.childCategory) != 0}">
                <div class="sanjiao"></div>
                <div class="new-sub">
                    <ul>
                        <c:forEach items="${category.childCategory}" var="childCategory">
                            <li><a href="javascript:;"
                                   onclick="appendArticle(${childCategory.articleid})">${childCategory.name}</a></li>
                        </c:forEach>
                    </ul>
                    <div class="tiggle"></div>
                    <div class="innertiggle"></div>
                </div>
            </c:if>
        </div>
    </c:forEach>
</div>
<script type="text/javascript">
    //弹出垂直菜单
    $(".menu").click(function () {
        if ($(this).hasClass("cura")) {
            $(this).children(".new-sub").hide(); //当前菜单下的二级菜单隐藏
            $(".menu").removeClass("cura"); //同一级的菜单项
        } else {
            $(".menu").removeClass("cura"); //移除所有的样式
            $(this).addClass("cura"); //给当前菜单添加特定样式
            $(".menu").children(".new-sub").slideUp("fast"); //隐藏所有的二级菜单
            $(this).children(".new-sub").slideDown("fast"); //展示当前的二级菜单
        }
    });
</script>
<center><h1>${currentUser.publicname}</h1></center>
<div style="margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';" id="content">
</div>
</body>
</html>

