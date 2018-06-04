<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/19
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章中心</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/commonTable.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/users_layout.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/page.css"/>
    <script type="text/javascript" src="/resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        function del(articleId) {
            $.get("/article/delete/" + articleId+".json", function (data) {
                window.location.reload();
            });
        }
    </script>
</head>
<body>
<table class="solidTable">
    <tr>
        <td>文章名称</td>
        <td>最后时间</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${articles}" var="everyArticle">
        <tr>
            <td>${everyArticle.name}</td>
            <td>${everyArticle.date}</td>
            <td align="center">
                <a href="update/${everyArticle.id}">修改</a>
                <a href="javascript:void(0)" onClick="del(${everyArticle.id})">删除</a>
                <a href="${everyArticle.id}" target="_blank">查看</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" onClick="location.href='/jsp/addArticle.jsp'" value="添加文章"/>
</body>
</html>