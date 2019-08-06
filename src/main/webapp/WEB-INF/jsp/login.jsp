<%@page contentType="text/html; UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>宏晶信息－NetCTOSS</title>
        <%
        pageContext.setAttribute("base",request.getContextPath());
        %>
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global_color.css" />
        <style>
            #btnBg{
                width: 124px;
                height: 41px;
                background-image: url("${base}/static/images/login_btn.png");
            }
        </style>
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery-1.4.3.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/json.js"></script>
        <script>


            // function checkNameNull() {
            //     if ($(this).val() == ""){
            //         //星号变成感叹号，并且后面 加上提示
            //         // $(this).next().text("!").addClass("required");
            //         $(this).next().remove();
            //         $(this).after($("<span class='required'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            //             "必填选项(30长度以内的字母、数字和下划线的组合)</span>"));
            //     }
            //     if ($(this).val()!= ""){
            //         var exp = /^[0-9a-zA-Z_]{1,30}$/;
            //         //星号变成感叹号，并且后面 加上提示
            //         // 进行校验格式是否正确 如果正确就√，不正确就继续添加其他提示
            //         if (exp.test($(this).val())){
            //             // $(this).next().text("√").addClass("required");
            //             $(this).next().remove();
            //         }else {
            //             // $(this).next().text("！").addClass("required");
            //             $(this).next().remove();
            //             $(this).after($("<span class='required'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            //                 "用户名格式错误(30长度以内的字母、数字和下划线的组合)</span>"));
            //         }
            //     }
            // }

            // function notEmpty() {
            //     $.ajax({
            //         url:'/netctoss/checkLogin.role',
            //         method:'get',
            //         data:'loginName='+$("#lOGINNAME").val()+'&pwd='+$("#PWD")+,
            //         dataType:'json',
            //         success:function (data) {
            //             alert(data)
            //             $("#checkNRepeat").remove();
            //             for (var i = 0;i<data.length;i++){
            //                 if (data[i].loginName == loginName.value){
            //                     var newLoginName =
            //                         '<div class="required">!用户名已存在</div>';
            //                     break;
            //                 }
            //             }
            //             $("#checkStar").after(newLoginName);
            //         },
            //         error:function (){alert("ajax error");}
            //     });
            // }


            // function checkLoginName() {
            //     var regExp = new RegExp("^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$");
            //     alert("regExp:"+regExp);
            //     var loginNameVal = $("input[name = 'loginName']").value();
            //     if (!loginNameVal.match(regExp)){
            //         alert("用户名错误！")
            //     }
            // }
            function changeCap(e) {
                var timeNow = new Date().getTime();
                e.src = '/netctoss/captcha.do?d='+timeNow ;
            }
        </script>
    </head>
    <body class="index">
        <div class="login_box">
            <form action="${base}/checkLogin.do">
                <table>
                    <tr>
                        <td class="login_info">账号：</td>
                        <td colspan="2"><input id="lOGINNAME" name="loginName" type="text" class="width150" /></td>
                        <td class="login_error_info"><span class="required">30长度的字母、数字和下划线</span></td>
                    </tr>
                    <tr>
                        <td class="login_info">密码：</td>
                        <td colspan="2"><input id="PWD" name="pwd" type="password" class="width150"/></td>
                        <td class="login_error_info"><span class="required">30长度的字母、数字和下划线</span></td>
                    </tr>
                    <tr>
                        <td class="login_info">验证码：</td>
                        <td class="width70"><input name="captcha" type="text" class="width70" /></td>
                        <td><img src="<%=request.getContextPath()%>/captcha.do"  title="点击更换" onclick="changeCap(this)" /></td>
                        <td><span class="required">${param.msg}</span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="login_button" colspan="2">
                            <input value="" type="submit" id="btnBg"/>
                        </td>
                        <td><span class="required"></span></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
