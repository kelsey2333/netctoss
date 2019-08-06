<%@page contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%
        pageContext.setAttribute("base",request.getContextPath());
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>宏晶信息－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global_color.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery-1.4.3.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/json.js"></script>
        <script language="javascript" type="text/javascript">
            //保存成功的提示信息
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

            //显示修改密码的信息项
            function showPwd(chkObj) {
                if (chkObj.checked)
                    document.getElementById("divPwds").style.display = "block";
                else
                    document.getElementById("divPwds").style.display = "none";
            }


            //通过身份证号码计算生日
           function getBirthDate(){
               var str = "";
               var str2 = str + ${param.idCard};
               var birthdayStr = str2.substring(6,14);
               var year = birthdayStr.slice(0,4)+"-"+birthdayStr.slice(4,6)+"-"
                   +birthdayStr.slice(6);
               $("#birth").val(year);
           }

        </script>
    </head>
    <body onload="getBirthDate();">
        <!--Logo区域开始-->
        <div id="header">
            <img src="${base}/static/images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                <li><a href="${base}/static/html/index.html" class="index_off"></a></li>
                <li><a href="${base}/static/role/role_list.html" class="role_off"></a></li>
                <li><a href="${base}/static/admin/admin_list.html" class="admin_off"></a></li>
                <li><a href="${base}/static/fee/fee_list.html" class="fee_off"></a></li>
                <li><a href="${base}/static/account/account_list.html" class="account_on"></a></li>
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
            <!--保存成功或者失败的提示消息-->          
            <div id="save_result_info" class="save_fail">保存失败，旧密码错误！</div>
            <form action="${base}/account/modiAcc.do?idForm=${param.id}&pageNo=${param.pageNo}" method="post" class="main_form">
                    <!--必填项-->
                    <div class="text_info clearfix"><span>账务账号ID：</span></div>
                    <div class="input_info">
                        <input  type="text" name="id" value="${param.id}" readonly class="readonly"  />
                    </div>
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input name="realName" type="text" value="${param.realName}" />
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg">20长度以内的汉字、字母和数字的组合</div>
                    </div>
                    <div id="idVal" class="text_info clearfix"><span>身份证：</span></div>
                    <div class="input_info">
                        <input name="idcardNo" type="text" value="${param.idCard}" readonly class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>登录账号：</span></div>
                    <div class="input_info">
                        <input name="loginName" type="text" value="${param.loginName}" readonly class="readonly"  />
                    </div>
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input name="telephone" type="text" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium error_msg">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input name="recommenderId"  type="text" />
                        <div class="validate_msg_long error_msgs">正确的身份证号码格式</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input id="birth" name="birthday" type="text" value="" readonly class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input name="email" type="text" class="width200"/>
                        <div class="validate_msg_medium">50长度以内，合法的 Email 格式</div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select name="occupation">
                            <option value="0">干部</option>
                            <option value="1">学生</option>
                            <option value="2">技术人员</option>
                            <option value="3">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                        <input type="radio" name="gender" value="女" checked="checked" id="female" onclick="feeTypeChange(1);" />
                        <label for="female">女</label>
                        <input type="radio" name="gender" value="男" id="male" onclick="feeTypeChange(2);" />
                        <label for="male">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input name="emailaddress" type="text" class="width350"/>
                        <div class="validate_msg_tiny">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input name="zipcode" type="text"/>
                        <div class="validate_msg_long">6位数字</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input name="qq" type="text"/>
                        <div class="validate_msg_long">5到13位数字</div>
                    </div>                
                    <!--操作按钮-->
                    <div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save"  />
                        <input type="reset" value="取消" class="btn_save" />
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
