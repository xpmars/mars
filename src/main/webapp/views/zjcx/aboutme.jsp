<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html> 
<head> 
	<title>关于指尖财讯</title>
		<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.3.2.min.css">
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.3.2.min.js" type="text/javascript"></script>
</head> 
<body> 

<div data-role="page">

	<div data-role="header">
		<a href="index.html" data-role="button" data-icon="arrow-l" data-transition="slide">返回</a>
		<h1>个人简介</h1>
	</div><!-- /header -->

	<div data-role="content">	
<ul data-role="listview" data-inset="true">
    <li data-role="list-divider">Friday, October 7, 2012 <span class="ui-li-count">4</span></li>
    <li><a href="http://lutaf.com">
        <h2>小老虎</h2>
        <p><strong>编程12年，现居北京</strong></p>
        <p>好做网站，尝试各种编程语言</p>
        <p>最近常使用objc,php和python写代码</p>
    </a></li>
    <li><a href="">Email</a></li>
    <li><a href="">Github</a></li>
    <li><a href="">微博</a></li>
</ul>
	</div><!-- /content -->

</div><!-- /page -->

</body>
</html>