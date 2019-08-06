<%@page language="java" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
pageContext.setAttribute("base",request.getContextPath());
%>
<html ">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>宏晶信息－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global_color.css" />
        <script type="text/javascript" src="${base}/static/jquery-1.4.3.js"></script>
        <script type="text/javascript" src="${base}/static/json.js"></script>
        <script language="javascript" type="text/javascript">
            //保存结果的提示
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }

            //切换资费类型
            function feeTypeChange(type) {
                var inputArray = document.getElementById("main").getElementsByTagName("input");
                if (type == 1) {
                    inputArray[4].readOnly = true;
                    inputArray[4].value = "";
                    inputArray[4].className += " readonly";
                    inputArray[5].readOnly = false;
                    inputArray[5].className = "width100";
                    inputArray[6].readOnly = true;
                    inputArray[6].className += " readonly";
                    inputArray[6].value = "";
                }
                else if (type == 2) {
                    inputArray[4].readOnly = false;
                    inputArray[4].className = "width100";
                    inputArray[5].readOnly = false;
                    inputArray[5].className = "width100";
                    inputArray[6].readOnly = false;
                    inputArray[6].className = "width100";
                }
                else if (type == 3) {
                    inputArray[4].readOnly = true;
                    inputArray[4].value = "";
                    inputArray[4].className += " readonly";
                    inputArray[5].readOnly = true;
                    inputArray[5].value = "";
                    inputArray[5].className += " readonly";
                    inputArray[6].readOnly = false;
                    inputArray[6].className = "width100";
                }
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="${base}/static/images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                <li><a href="${base}/static/index.html" class="index_off"></a></li>
                <li><a href="${base}/static/role/role_list.html" class="role_off"></a></li>
                <li><a href="${base}/static/admin/admin_list.html" class="admin_off"></a></li>
                <li><a href="${base}/static/fee/fee_list.html" class="fee_on"></a></li>
                <li><a href="${base}/static/account/account_list.html" class="account_off"></a></li>
                <li><a href="${base}/static/service/service_list.html" class="service_off"></a></li>
                <li><a href="${base}/static/bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="${base}/static/report/report_list.html" class="report_off"></a></li>
                <li><a href="${base}/static/user/user_info.html" class="information_off"></a></li>
                <li><a href="${base}/static/user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_fail">保存失败，资费名称重复！</div>
            <form action="${base}/cost/addCostList.do?pageNo=${param.pageNo}" method="post" class="main_form">
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width300" placeholder="50长度的字母、数字、汉字和下划线的组合" name="name" value=""/>
                    <span class="required">*</span>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="costtype" value="1" id="monthly" onclick="feeTypeChange(1);" />
                    <label for="monthly">包月</label>
                    <input type="radio" name="costtype" value="2" checked="checked" id="package" onclick="feeTypeChange(2);" />
                    <label for="package">套餐</label>
                    <input type="radio" name="costtype" value="3" id="timeBased" onclick="feeTypeChange(3);" />
                    <label for="timeBased">计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" value="" placeholder="1-600之间的整数" name="baseDuration" class="width100" />
                    <span class="info">小时</span>
                    <span class="required">*</span>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text" name="baseCost" value="" placeholder="0-99999.99之间的数值" class="width100" />
                    <span class="info">元</span>
                    <span class="required">*</span>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text" name="unitCost" value="" placeholder="0-99999.99之间的数值" class="width100" />
                    <span class="info">元/小时</span>
                    <span class="required">*</span>
                </div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70" name="descr" placeholder="100长度的字母、数字、汉字和下划线的组合"></textarea>
                </div>
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save"  />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[地址：合肥市高新区云飞路与文曲路交口创新产业园二期F4栋12层]</span>
            <br />
            <span>版权所有&copy;合肥宏晶信息科技有限公司 </span>
        </div>
    </body>
</html>
