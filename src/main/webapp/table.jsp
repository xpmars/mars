<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>MBTI测试</title>
    <script type="text/javascript">
        $(function () {

        });
    </script>
</head>
<body>
<div class="container-fluid">
<div class="jumbotron">
    <p><a class="btn btn-primary btn-lg" href="#">MBTI测试</a></p>
</div>

    <form class="bs-example bs-example-form" data-example-id="input-group-with-checkbox-radio" action="/weixin/test/mbti"
          method="post">
        <h2 id="glyphicons-examples">请选择：</h2>

        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                  <span class="input-group-addon">
                    <input type="radio" name="jijin" value="A">A.基金
                      <input type="radio" name="jijin" value="B">B.基金
                      <input type="radio" name="jijin" value="C">C.基金
                      <input type="radio" name="jijin" value="D">D.基金
                  </span>
                </div>
            </div>
        </div>
        <input type="submit" value="Submit"/>
    </form>


</div>
</body>
</html>
