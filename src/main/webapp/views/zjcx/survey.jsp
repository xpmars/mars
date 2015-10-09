<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.3.2.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.mobile-1.3.2.min.js" type="text/javascript"></script>
</head>
<body>

<div data-role="page" id="pageone" data-theme="e">
    <div data-role="header">
        <h1>指尖财讯-测玩空间</h1>
    </div>

    <div data-role="content">
        <ul data-role="listview" data-inset="true" data-filter="true">
            <li><a href="#">Acura</a></li>
            <li><a href="#">Audi</a></li>
            <li><a href="#">BMW</a></li>
            <li><a href="#">Cadillac</a></li>
            <li><a href="#">Ferrari</a></li>
        </ul>
    </div>

    <div data-role="footer" data-id="foo1" data-position="fixed">
        <div data-role="navbar">
            <ul>
                <li><a href="#" data-transition="slide">分类</a></li>
                <li><a href="#" data-transition="slide">专题</a></li>
                <li><a href="aboutme.jsp" data-transition="slide">关于我们</a></li>
            </ul>
        </div><!-- /navbar -->
    </div>



</div>

</body>
</html>

