<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>指尖资讯-风险评估</title>
    <link rel="stylesheet" href="styles/default.css" type="text/css"/>
    <link rel="stylesheet" href="styles/jquery.ui.all.css" type="text/css"/>
    <%--<script type="text/javascript" src="scripts/jquery-1.5.1.js" charset="utf-8"></script>--%>
    <%--<script type="text/javascript" src="scripts/jquery.hotkeys.js" charset="utf-8"></script>--%>
    <%--<script type="text/javascript" src="scripts/jquery-ui-1.8.10.custom.js" charset="utf-8"></script>--%>
    <%--<script type="text/javascript" src="scripts/jquery-ui-1.8.10-i18n.js" charset="utf-8"></script>--%>
    <%--<script type="text/javascript" src="scripts/json2.js" charset="utf-8"></script>--%>
    <script type="text/javascript" src="scripts/Math.uuid.js" charset="utf-8"></script>
    <script type="text/javascript" src="scripts/db.js" charset="utf-8"></script>
    <script type="text/javascript" src="scripts/surveys.js" charset="utf-8"></script>
    <script type="text/javascript" src="scripts/logic.js" charset="utf-8"></script>
    <script type="text/javascript">
        $(document).ready(function () {
                    answers_dao.init();
                    paintQuestion();

                }
        );

        var xxx = function () {
            $.ajax({
                type: 'POST',
                url: '/weixin/test/mbti',
                data: JSON.stringify(answers.answers),
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    var result_answer = data.result_answer;
                    var result_describe = data.result_describe;
                    $("table").remove();
                    $("ul").remove();
                    $("li").remove();
                    $("input").remove();
                    var table;
                    table = "<table><tbody>";
                    table += "<tr><th>您人格类型：    " + result_answer + "</th></tr>";
                    table += "<tr><th>" + result_describe + "</th></tr>";
                    table += "</tbody></table>";
                    $("#question").append(table);
                    $("#previous").hide();
                    $("#submit").hide();
                },
                error: function (data) {
                    alert("error");
                }

            });

        };


    </script>

</head>
<body>
<div class="container-fluid">
    <h1>指尖财讯-Mbti性格评测</h1>

    <!-- <a href="#">Add Extra Info</a> -->
    <div id="question" class="question">
    </div>
    <br/>

    <div id="navigation">
        <button class="btn btn-default" id="previous" name="previous"  onclick="previousQuestion()"/>Previous</button>&nbsp;&nbsp;
        <button class="btn btn-default" type="button" id="next" name="next"  onclick="nextQuestion()"/>Next</button>

    </div>
<%--<span>
    <p>
        <label>微信号</label>
        <span>FortuneBar</span>
    </p>

    <span>指尖上的财富资讯！--我们只分享、不推销！紧跟时代脉搏、追踪政策资讯、洞察经济走向、精选专家观点，一天一条，助您精准把握投资方向！不推销金融产品，不索取个人身份信息，我们不是任何形式的第三方理财平台！</span>
</span>--%>
    <div>
        <div id="footer">
            <span>指尖上的财富资讯！--我们只分享、不推销！紧跟时代脉搏、追踪政策资讯、洞察经济走向、精选专家观点，一天一条，助您精准把握投资方向！不推销金融产品，不索取个人身份信息，我们不是任何形式的第三方理财平台！</span>
        </div>
    </div>
    </div>
</body>
</html>                                                                                                                                                                               