<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/8/3
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properities -->
  <title>Homepage Example - Semantic</title>

  <link rel="stylesheet" type="text/css" href="resources/Semantic/semantic.css">
  <link rel="stylesheet" type="text/css" href="homepage.css">

  <script src="resources/JQuery/jquery.js"></script>
  <script src="resources/Semantic/semantic.js"></script>
</head>
<body>
<div class="ui block header">
  <i class="settings icon"></i>
  <div class="content">

    <div class="content" >用户画像</div>
    <div class="sub header" id="user_account"></div>
  </div>
</div>

<div class="ui hidden clearing divider"></div>
<div class="ui action left icon input">
  <i class="search icon"></i>
  <input placeholder="用户账号..." type="text" id="username_input">
  <div class="ui teal button" id="search_button">搜索</div>
</div>

<div class="ui hidden clearing divider"></div>
<h4 class="ui top attached inverted header">基本信息</h4>

<div class="ui segment">
  <div class="ui two column middle aligned very relaxed stackable grid">
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>账号</th>
          <th>性别</th>
          <th>年龄</th>
          <th>用户贡献率</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="user_name"></td>
          <td id="gender"></td>
          <td id="age"></td>
          <td id="user_contribution_rate"></td>
        </tr>
        </tbody>
      </table>

      <table class="ui small table segment">
        <thead>
        <tr>
          <th>省</th>
          <th>市</th>
          <th>区</th>
          <th>平台</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="province"></td>
          <td id="city"></td>
          <td id="district"></td>
          <td id="platform"></td>
        </tr>
        </tbody>
      </table>
    </div>
    <div class="ui vertical divider">

    </div>
    <div class="column">


        <table class="ui small table segment">
          <thead>
          <tr>
            <th>生命周期</th>
            <th>消费状态</th>
            <th>产品新客户</th>
            <th>所属群组</th>
          </tr></thead>
          <tbody>
          <tr>
            <td id="lifecycle_status"></td>
            <td id="consume_status"></td>
            <td id="is_product_newer"></td>
            <td id="group"></td>
          </tr>
          </tbody>
        </table>




      <table class="ui small table segment" style="display: none">
        <thead>
        <tr><th>手机号</th>
          <th>手机牌子</th>
          <th>手机模型</th>
          <th>手机os</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="mobile"></td>
          <td id="mobile_brand"></td>
          <td id="mobile_model"></td>
          <td id="mobile_os"></td>
        </tr>
        </tbody>
      </table>

      <table class="ui small table segment">
        <thead>
        <tr>
          <th>怀孕</th>
          <th>有孩子</th>
          <th>孩子性别</th>
          <th>孩子年龄</th>
          <th>经验值</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="is_pregnant"></td>
          <td id="has_children"></td>
          <td id="children_gender"></td>
          <td id="children_age"></td>
          <td id="empirical_value"></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>


<h4 class="ui top attached inverted header">商品偏好</h4>

<div class="ui segment">
  <div class="ui two column middle aligned very relaxed stackable grid">
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>最喜欢一级品类top1</th>
          <th>最喜欢一级品类top2</th>
          <th>最喜欢一级品类top3</th>
          <th>最喜欢一级品类top4</th>
          <th>最喜欢一级品类top5</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="favorite_goods_top1_cate_lv1"></td>
          <td id="favorite_goods_top2_cate_lv1"></td>
          <td id="favorite_goods_top3_cate_lv1"></td>
          <td id="favorite_goods_top4_cate_lv1"></td>
          <td id="favorite_goods_top5_cate_lv1"></td>

        </tr>
        </tbody>
      </table>

      <table class="ui small table segment">
        <thead>
        <tr>
          <th>最喜欢二级品类top1</th>
          <th>最喜欢二级品类top2</th>
          <th>最喜欢二级品类top3</th>
          <th>最喜欢二级品类top4</th>
          <th>最喜欢二级品类top5</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="favorite_goods_top1_cate_lv2"></td>
          <td id="favorite_goods_top2_cate_lv2"></td>
          <td id="favorite_goods_top3_cate_lv2"></td>
          <td id="favorite_goods_top4_cate_lv2"></td>
          <td id="favorite_goods_top5_cate_lv2"></td>
        </tr>
        </tbody>
      </table>
    </div>
    <div class="ui vertical divider">

    </div>
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr>
          <th>最喜欢三级品类top1</th>
          <th>最喜欢三级品类top2</th>
          <th>最喜欢三级品类top3</th>
          <th>最喜欢三级品类top4</th>
          <th>最喜欢三级品类top5</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="favorite_goods_top1_cate_lv3"></td>
          <td id="favorite_goods_top2_cate_lv3"></td>
          <td id="favorite_goods_top3_cate_lv3"></td>
          <td id="favorite_goods_top4_cate_lv3"></td>
          <td id="favorite_goods_top5_cate_lv3"></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>



<h4 class="ui top attached inverted header">
  访问习惯
</h4>
<div class="ui segment">
  <div class="ui two column middle aligned very relaxed stackable grid">
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>首次访问时间</th>
          <th>移动端首次访问时间</th>
          <th>注册时间</th>
          <th>最后登录时间</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="first_visit_time"></td>
          <td id="mb_first_visit_time"></td>
          <td id="register_time"></td>
          <td id="latest_login_time"></td>

        </tr>
        </tbody>
      </table>

      <table class="ui small table segment">
        <thead>
        <tr>
          <th>累计活跃次数</th>
          <th>90天活跃次数</th>
          <th>60天活跃次数</th>
          <th>30天活跃次数</th>
          <th>10天活跃次数</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="total_active_times"></td>
          <td id="active_times_90"></td>
          <td id="active_times_60"></td>
          <td id="active_times_30"></td>
          <td id="active_times_10"></td>

        </tr>
        </tbody>
      </table>
    </div>
    <div class="ui vertical divider">

    </div>
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>累计活跃天数</th>
          <th>90天累计活跃天数</th>
          <th>60天累计活跃天数</th>
          <th>30天累计活跃天数</th>
          <th>10天累计活跃天数</th>
          <th>访问频率</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="total_active_days"></td>
          <td id="active_days_90"></td>
          <td id="active_days_60"></td>
          <td id="active_days_30"></td>
          <td id="active_days_10"></td>
          <td id="visit_rate"></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>


<h4 class="ui top attached inverted header">
  消费习惯
</h4>
<div class="ui segment">
  <div class="ui two column middle aligned very relaxed stackable grid">
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>首次下单时间</th>
          <th>最新下单时间</th>
          <th>客单价</th>
          <th>单次最高消费金额</th>
          <th>单件最高商品价格</th>

        </tr></thead>
        <tbody>
        <tr>
          <td id="first_order_time"></td>
          <td id="lasted_order_time"></td>
          <td id="per_customer_transaction"></td>
          <td id="most_single_order_amount"></td>
          <td id="most_single_goods_price"></td>
        </tr>
        </tbody>
      </table>

      <table class="ui small table segment">
        <thead>
        <tr>
          <th>pc端总订单数量</th>
          <th>移动端总订单数量</th>
          <th>90天订单数</th>
          <th>60天订单数</th>
          <th>30天订单数</th>
          <th>7天订单数</th>
        </tr></thead>
        <tbody>
        <tr>
          <td id="total_orders_pc"></td>
          <td id="total_orders_mobile"></td>
          <td id="orders_90"></td>
          <td id="orders_60"></td>
          <td id="orders_30"></td>
          <td id="orders_7"></td>

        </tr>
        </tbody>
      </table>
    </div>
    <div class="ui vertical divider">

    </div>
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>pc端总订单金额</th>
          <th>移动端总订单金额</th>
          <th>90天订单金额</th>
          <th>60天订单金额</th>
          <th>30天订单金额</th>
          <th>7天订单金额</th>

        </tr></thead>
        <tbody>
        <tr>
          <td id="total_sales_amount_pc"></td>
          <td id="total_sales_amount_mobile"></td>
          <td id="sales_amount_90"></td>
          <td id="sales_amount_60"></td>
          <td id="sales_amount_30"></td>
          <td id="sales_amount_7"></td>

        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>


<h4 class="ui top attached inverted header">
  订单信息
</h4>
<div class="ui segment">
  <div class="ui two column middle aligned very relaxed stackable grid">
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>首单三级类目</th>
          <th>首月订单数</th>
          <th>首月订单金额</th>
          <th>首月客单价</th>
          <th>首月优惠券数</th>

        </tr></thead>
        <tbody>
        <tr>
          <td id="first_order_category_lvl3"></td>
          <td id="first_month_orders"></td>
          <td id="first_month_orders_amount"></td>
          <td id="first_month_per_customer_transaction"></td>
          <td id="first_month_numbers_coupons"></td>
        </tr>
        </tbody>
      </table>
    </div>
    <div class="ui vertical divider">

    </div>
    <div class="column">
      <table class="ui small table segment">
        <thead>
        <tr><th>最近订单品牌</th>
          <th>最近订单三级类目</th>
          <th>最近订单金额</th>
          <th>最近订单支付终端</th>
          <th>最近订单站点</th>

        </tr></thead>
        <tbody>
        <tr>
          <td id="last_order_brand"></td>
          <td id="last_order_category_lvl3"></td>
          <td id="last_order_amount"></td>
          <td id="last_order_terminal"></td>
          <td id="last_order_site"></td>

        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script language="JavaScript" >
  $(document).ready(function(){
    $("#search_button").click(function(){
      jQuery.getJSON("userprofile", {username: $("#username_input").val()},function( data) {
        $("#user_id").html(data.user_id);
        $("#user_name").html($("#username_input").val());
        $("#gender").html(data.gender);
        $("#gender_female_probability").html(data.gender_female_probability);
        $("#age").html(data.age);
        $("#mobile").html(data.mobile);
        $("#province").html(data.province);
        $("#city").html(data.city);
        $("#district").html(data.district);
        $("#is_pregnant").html(data.is_pregnant);
        $("#is_pregnant_probability").html(data.is_pregnant_probability);
        $("#has_children").html(data.has_children);
        $("#has_children_probability").html(data.has_children_probability);
        $("#children_gender").html(data.children_gender);
        $("#children_age").html(data.children_age);
        $("#first_visit_time").html(data.first_visit_time);
        $("#register_time").html(data.register_time);
        $("#latest_login_time").html(data.latest_login_time);
        $("#total_active_times").html(data.total_active_times);
        $("#active_times_90").html(data.active_times_90);
        $("#active_times_60").html(data.active_times_60);
        $("#active_times_30").html(data.active_times_30);
        $("#active_times_10").html(data.active_times_10);
        $("#total_active_days").html(data.total_active_days);
        $("#active_days_90").html(data.active_days_90);
        $("#active_days_60").html(data.active_days_60);
        $("#active_days_30").html(data.active_days_30);
        $("#active_days_10").html(data.active_days_10);
        $("#visit_rate").html(data.visit_rate);
        $("#mobile_brand").html(data.mobile_brand);
        $("#mobile_model").html(data.mobile_model);
        $("#mobile_os").html(data.mobile_os);
        $("#user_activity_rate").html(data.user_activity_rate);
        $("#first_order_time").html(data.first_order_time);
        $("#lasted_order_time").html(data.lasted_order_time);
        $("#total_orders").html(data.total_orders);
        $("#total_orders_pc").html(data.total_orders_pc);
        $("#total_orders_mobile").html(data.total_orders_mobile);


        $("#orders_90").html(data.orders_90);
        $("#orders_60").html(data.orders_60);
        $("#orders_30").html(data.orders_30);
        $("#orders_7").html(data.orders_7);
        $("#total_sales_amount").html(data.total_sales_amount);
        $("#total_sales_amount_pc").html(data.total_sales_amount_pc);
        $("#total_sales_amount_mobile").html(data.total_sales_amount_mobile);
        $("#sales_amount_90").html(data.sales_amount_90);
        $("#sales_amount_60").html(data.sales_amount_60);
        $("#sales_amount_30").html(data.sales_amount_30);
        $("#sales_amount_7").html(data.sales_amount_7);
        $("#per_customer_transaction").html(data.per_customer_transaction);
        $("#most_single_order_amount").html(data.most_single_order_amount);
        $("#most_single_goods_price").html(data.most_single_goods_price);
        $("#user_contribution_rate").html(data.user_contribution_rate);
        $("#favorite_goods_top1_cate_lv1").html(data.favorite_goods_top1_cate_lv1);
        $("#favorite_goods_top2_cate_lv1").html(data.favorite_goods_top2_cate_lv1);
        $("#favorite_goods_top3_cate_lv1").html(data.favorite_goods_top3_cate_lv1);
        $("#favorite_goods_top4_cate_lv1").html(data.favorite_goods_top4_cate_lv1);
        $("#favorite_goods_top5_cate_lv1").html(data.favorite_goods_top5_cate_lv1);
        $("#favorite_goods_top1_cate_lv2").html(data.favorite_goods_top1_cate_lv2);
        $("#favorite_goods_top2_cate_lv2").html(data.favorite_goods_top2_cate_lv2);
        $("#favorite_goods_top3_cate_lv2").html(data.favorite_goods_top3_cate_lv2);
        $("#favorite_goods_top4_cate_lv2").html(data.favorite_goods_top4_cate_lv2);
        $("#favorite_goods_top5_cate_lv2").html(data.favorite_goods_top5_cate_lv2);
        $("#favorite_goods_top1_cate_lv3").html(data.favorite_goods_top1_cate_lv3);
        $("#favorite_goods_top2_cate_lv3").html(data.favorite_goods_top2_cate_lv3);
        $("#favorite_goods_top3_cate_lv3").html(data.favorite_goods_top3_cate_lv3);
        $("#favorite_goods_top4_cate_lv3").html(data.favorite_goods_top4_cate_lv3);
        $("#favorite_goods_top5_cate_lv3").html(data.favorite_goods_top5_cate_lv3);
        $("#empirical_value").html(data.empirical_value);
        $("#platform").html(data.platform);
        $("#mb_first_visit_time").html(data.mb_first_visit_time);

        $("#is_product_newer").html(data.is_product_newer);
        $("#user_account").html("账号：" + $("#username_input").val());
        $("#lifecycle_status").html(data.lifecycle_status);
        $("#consume_status").html(data.consume_status);

        $("#first_order_category_lvl3").html(data.first_order_category_lvl3);
        $("#first_month_orders").html(data.first_month_orders);
        $("#first_month_orders_amount").html(data.first_month_orders_amount);
        $("#first_month_per_customer_transaction").html(data.first_month_per_customer_transaction);
        $("#first_month_numbers_coupons").html(data.first_month_numbers_coupons);
        $("#last_order_brand").html(data.last_order_brand);
        $("#last_order_category_lvl3").html(data.last_order_category_lvl3);
        $("#last_order_amount").html(data.last_order_amount);
        $("#last_order_terminal").html(data.last_order_terminal);
        $("#last_order_site").html(data.last_order_site);
        $("#group").html(data.group);
      });
    });
  });
</script>
</body>
</html>