<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <jsp:include page="../common/head.jsp"></jsp:include>
<head>
    <title>结果页面</title>
</head>
<body>
<div class="container-fluid">

    <%--<h3>您的答案是：${option}</h3>--%>
    <h3>您的分数是：${source}</h3>
        <h3>您的风险评级是：${level}</h3>
        <h3>您的答案是：${answer}</h3>
  </div>
</body>
</html>
