<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>指尖资讯-风险评估</title>
</head>

<body>
<div class="container-fluid">

    <form name="form" class="bs-example bs-example-form" data-example-id="input-group-with-checkbox-radio"
            action="/weixin/test/fxpg" method="post">

        <p align="center"><strong>指尖资讯-客户风险承受能力评估问卷（二）</strong></p>

        <p><strong>&nbsp;</strong></p>


        <p><strong>1、您的年龄：
            <br/>
        </strong>

            <input type="radio" name="qes1" value="1">
            A、55岁以上<br>
            <input type="radio" name="qes1" value="3">
            B、45-55岁
            <br>
            <input type="radio" name="qes1" value="5">
            C、30-45岁<br>
            <input type="radio" name="qes1" value="7">
            D、30岁以下<br>
            <br/>

            <strong> 2、您的投资年限：</strong><br/>
            <input type="radio" name="qes2" value="1">
            A、1年以内 <br>
            <input type="radio" name="qes2" value="3">
            B、1-5年<br>
            <input type="radio" name="qes2" value="5">
            C、5-10年<br>
            <input type="radio" name="qes2" value="7">
            D、10年以上<br>
            <br/>
            <strong>3、您的投资经验可以被概括为：</strong><br/>
            <input type="radio" name="qes3" value="1">
            A、无:除银行活期和定期储蓄存款外，基本没有其他投资经验 <br>
            <input type="radio" name="qes3" value="3">
            B、有限：有过购买国债，货币型基金等保本型金融产品投资经验<br>
            <input type="radio" name="qes3" value="5">
            C、一般：具有一定的证券投资经验，需要进一步的指导<br>
            <input type="radio" name="qes3" value="7">
            D、丰富：是一位积极和有经验的证券投资者，并倾向于自己作出投资决定<br>
            <br/>
            <strong>4、您曾经或正在做的投资产品（若有多项限选风险最大的一项）：</strong><br/>
            <input type="radio" name="qes4" value="1">
            A、无 <br>
            <input type="radio" name="qes4" value="3">
            B、债券、基金<br>
            <input type="radio" name="qes4" value="5">
            C、股票<br>
            <input type="radio" name="qes4" value="7">
            D、期货、权证<br>
            <br/>
            <strong>5、今后5年内您的预期收入？</strong><br/>
            <input type="radio" name="qes5" value="1">
            A、预期收入将不断减少 <br>
            <input type="radio" name="qes5" value="3">
            B、预期收入将保持稳定<br>
            <input type="radio" name="qes5" value="5">
            C、预期收入将逐渐增加<br>
            <br/>
            <strong>6、以下哪一种类型最好地描述了您的投资目标以及您对市场波动的适应度？</strong><br/>
            <input type="radio" name="qes6" value="1">
            A、无风险：我希望本金绝对安全，我对于短期市场波动感到不适应，愿意得到无风险收益<br>
            <input type="radio" name="qes6" value="3">
            B、低风险：我希望本金绝对安全，能接受2年内较小的波动，愿意尝试得到一定程度上大于定期存款的回报并承担部分收益减少的风险<br>
            <input type="radio" name="qes6" value="5">
            C、中风险：我倾向于平衡的方式，偏好投资于兼具成长性及收益性的产品。我能接受负面波动，从而在2年或2年以上的投资期内获得远高于活期账户、定期存款的收益<br>
            <input type="radio" name="qes6" value="7">
            D、高风险：我希望我的投资增长，并尽可能地获得最高回报，我可以接受短期负面波动，愿意承担全部收益包括本金可能损失的风险<br>
            <br/>
            <strong>7、如您有机会通过承担额外风险（包括本金可能受到损失）来明显增加潜在回报，那么您：</strong><br/>
            <input type="radio" name="qes7" value="1">
            A、不愿意承担任何额外风险<br>
            <input type="radio" name="qes7" value="3">
            B、愿意动用部分资金承担较小的额外风险<br>
            <input type="radio" name="qes7" value="5">
            C、愿意动用部分资金承担较大的额外风险<br>
            <br/>
            <strong>8、您本次准备投资的资金，占您的总资产（除自用和经营性财产外）？</strong><br/>
            <input type="radio" name="qes8" value="1">
            A、小于10％ <br>
            <input type="radio" name="qes8" value="3">
            B、10％～30％<br>
            <input type="radio" name="qes8" value="5">
            C、30％～50％<br>
            <input type="radio" name="qes8" value="7">
            D、大于50％<br>
            <br>
            <strong>9、您是否有过投资失败的经历，如有遭受的损失是多少？</strong><br/>
            <input type="radio" name="qes9" value="1">
            A、最大本金亏损5%以内<br>
            <input type="radio" name="qes9" value="3">
            B、能最大本金亏损5%-20%<br>
            <input type="radio" name="qes9" value="5">
            C、最大本金亏损20%-50%<br>
            <input type="radio" name="qes9" value="7">
            D、最大本金亏损50%以上<br>
            <br>
            <strong>10、您接受的最高教育程度是？ </strong><br/>
            <input type="radio" name="qes10" value="1">
            A、高中及以下 <br>
            <input type="radio" name="qes10" value="3">
            B、专科<br>
            <input type="radio" name="qes10" value="5">
            C、本科<br>
            <input type="radio" name="qes10" value="7">
            D、硕士及以上<br>
            <strong><br/>
            </strong><br/>
            <input type="submit" value="Submit"/>
    </form>
</div>
</body>
</html>
