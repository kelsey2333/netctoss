<%@page contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("base",request.getContextPath());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>宏晶信息－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global_color.css" />
        <style>

            #welcome{
                position: absolute;
                left: 300px;
                top: 150px;
                font-size: 50px;
                color: dodgerblue;
            }
            #a1,#a2,#a3,#a4,#a5,#a6,#a7,#a8,#a9,#a10,#a11,#a12{
                text-shadow:  -2px 0px 2px  #FF0000,2px 0px 2px  #FF0000,0px 2px 2px  #FF0000,0px -2px 2px  #FF0000;
                display: none;
            }
        </style>
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery-1.4.3.js"></script>
        <script>
            $(function () {
                setTimeout(function () {
                    $("#a1").show();
                },400);
                setTimeout(function () {
                    $("#a2").show();
                },800);
                setTimeout(function () {
                    $("#a3").show();
                },1200);
                setTimeout(function () {
                    $("#a4").show();
                },1600);
                setTimeout(function () {
                    $("#a5").show();
                },2000);
                setTimeout(function () {
                    $("#a6").show();
                },2400);
                setTimeout(function () {
                    $("#a7").show();
                },2800);
                setTimeout(function () {
                    $("#a8").show();
                },3200);
                setTimeout(function () {
                    $("#a9").show();
                },3600);
                setTimeout(function () {
                    $("#a10").show();
                },4000);
                setTimeout(function () {
                    $("#a11").show();
                },4400);
                setTimeout(function () {
                    $("#a12").show();
                },4800);
            });

        </script>
    </head>
    <body class="index" >
        <div id="welcome">
            <a id="a1">欢</a>
            <a id="a2">迎</a>
            <a id="a3">进</a>
            <a id="a4">入</a>
            <a id="a5">宏</a>
            <a id="a6">晶</a>
            <a id="a7">电</a>
            <a id="a8">信</a>
            <a id="a9">计</a>
            <a id="a10">费</a>
            <a id="a11">系</a>
            <a id="a12">统</a>
        </div>
        <!--导航区域开始-->
        <div id="index_navi">
            <ul id="menu">
                <c:forEach var="menu" items="${menus}">
                <li><a href="${menu.href}" class="${menu.clazz}"></a></li>
                </c:forEach>
                <%--<li><a href="role/role_list.html" class="role_off"></a></li>--%>
                <%--<li><a href="admin/admin_list.html" class="admin_off"></a></li>--%>
                <%--<li><a href="fee/fee_list.html" class="fee_off"></a></li>--%>
                <%--<li><a href="account/account_list.html" class="account_off"></a></li>--%>
                <%--<li><a href="service/service_list.html" class="service_off"></a></li>--%>
                <%--<li><a href="bill/bill_list.html" class="bill_off"></a></li>--%>
                <%--<li><a href="report/report_list.html" class="report_off"></a></li>--%>
                <%--<li><a href="user/user_info.html" class="information_off"></a></li>--%>
                <%--<li><a href="user/user_modi_pwd.html" class="password_off"></a></li>--%>
            </ul>
        </div>
    </body>
</html>
