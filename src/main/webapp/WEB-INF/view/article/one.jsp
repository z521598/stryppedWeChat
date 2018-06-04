<%@ page import="com.jlu.article.model.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${article.name}</title>
</head>
<body>
    <%= ((Article)request.getAttribute("article")).getContentString() %>
</body>
</html>
