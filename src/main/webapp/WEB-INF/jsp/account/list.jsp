<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("base",request.getContextPath());
%>
<!DOCTYPE html >
<html>
    <head>
        <title>宏晶信息－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global_color.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery-1.4.3.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/json.js"></script>
        <script language="javascript" type="text/javascript">
            //删除
            function deleteStatus(id) {
                var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
                if (r){
                        $.ajax({
                            url:'/netctoss/account/del.do',
                            method:'post',
                            data:'id='+id+'&status=2',
                            datatype:'text',
                            success:function(data){
                                alert("success");
                                //1修改表中状态为删除
                                $("#status" + id).text("删除");
                                //2删除表中按钮
                                $("#btn" + id).empty();
                            }
                        });
                }
            }
            //暂停
            function setPause(id) {
                var r = window.confirm("确定要暂停此账务账号吗？");
                if (r) {
                    //获取当前行的id和status
                    //将当前行的id和status发送给status.acc
                    //success:function(data){}如果数据库修改成功，动态返回到表中具体体现在status和class
                    $.ajax({
                        url: '/netctoss/account/status.do',
                        method: 'get',
                        data: 'id='+id+'&status=0',
                        dataType: 'text',
                        success: function (data) {
                            //1修改表中状态为暂停
                            $("#status" + id).text("暂停");
                            //2修改表中按钮为开通
                            $("#btn" + id).empty();
                            var newStatus = $('<input type="button" value="开通" class="btn_start" onclick="setStart('+id+');" />\n' +
                                                '<a href="/netctoss/account/modi.do?&id='+id+'&pageNo=1"><input type="button" value="修改" class="btn_modify" /></a>' +
                                                '<input type="button" value="删除" class="btn_delete" onclick="deleteStatus('+id+');" />');
                            $("#btn" + id).append(newStatus);
                        }
                    });
                }
            }
            function setStart(id2) {
                var r = window.confirm("确定要开通此账务账号吗？");
                if (r) {
                    //获取当前行的id和status
                    //将当前行的id和status发送给status.acc
                    //success:function(data){}如果数据库修改成功，动态返回到表中具体体现在status和class
                    $.ajax({
                        url: '/netctoss/account/status.do',
                        method: 'get',
                        data: 'id='+id2+'&status=1',
                        dataType: 'text',
                        success: function (data) {
                            //1修改表中状态为开通
                            $("#status" + id2).text("开通");
                            //2修改表中按钮为暂停
                            $("#btn" + id2).empty();
                            var newStatus2 = $('<input type="button" value="暂停" class="btn_pause" onclick="setPause('+id2+');" />' +
                                                '<a href="/netctoss/account/modi.do?&id='+id2+'&pageNo=1"><input type="button" value="修改" class="btn_modify" /></a>' +
                                               '<input type="button" value="删除" class="btn_delete" onclick="deleteStatus('+id2+');" />');
                            $("#btn" + id2).append(newStatus2);
                        }
                    });
                }
            }


            <!--首页-->
            function firstPage() {
                $.ajax({
                    url:'/netctoss/account/jsonList.do',
                    method:'get',
                    data:'pageNo=1',
                    dataType:'json',
                    success:function (data) {
                        $("#tbodyData").empty();
                        for (var i = 0;i<data.length;i++){
                            <!--表格部分-->
                            var newDataPartStr = '<tr>\n' +
                                '<td>'+data[i].id+'</td>\n' +
                                '<td><a href="account_detail.html">'+data[i].realName+'</a></td>\n' +
                                '<td>'+data[i].idcardNo +'</td>\n' +
                                '<td>'+data[i].loginName+'</td>\n' +
                                '<td id="status'+data[i].id+'">';
                            if (data[i].status == 0) {
                                newDataPartStr += "暂停";
                            } else if (data[i].status == 1) {
                                newDataPartStr += "开通";
                            } else {
                                newDataPartStr += "删除";
                            }
                            newDataPartStr += '</td>\n' +
                                '<td>'+data[i].createDate+'</td>\n' +
                                '<td>'+data[i].lastLoginTime+'</td>\n' +
                                '<td class="td_modi" id="btn'+data[i].id+'">' +
                                '<input type="button" value=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"开通"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"暂停"';
                            }
                             newDataPartStr += ' class=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"btn_start"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"btn_pause"';
                            }
                            newDataPartStr+= ' onclick=';
                            if (data[i].status == 1) {
                                newDataPartStr +=  '"setPause(' + data[i].id + ');" />';
                            }else if (data[i].status == 0){
                                newDataPartStr += '"setStart(' + data[i].id + ');" />';
                            }
                               newDataPartStr += ' <a href="/netctoss/account/modi.do?&id='+data[i].id+'&pageNo=1"><input type="button" value="修改" class="btn_modify" /></a>\n'+
                                                '<a href="/netctoss/account/del.do?&id='+data[i].id+'&pageNo=1"><input type="button" value="删除" class="btn_delete" /></a>' +
                                                '</td>' +
                                                '</tr>';
                            $("#tbodyData").append(newDataPartStr);
                        }
                    },
                    error:function (){alert("ajax error");}
                });
            }
            <!--尾页-->
            function lastPage(endPage) {
                $.ajax({
                    url:'/netctoss/account/jsonList.do',
                    method:'get',
                    data:'pageNo='+endPage ,
                    dataType:'json',
                    success:function (data) {
                        $("#tbodyData").empty();
                        for (var i = 0;i<data.length;i++){
                            var newDataPartStr = '<tr>\n' +
                                '<td>'+data[i].id+'</td>\n' +
                                '<td><a href="account_detail.html">'+data[i].realName+'</a></td>\n' +
                                '<td>'+data[i].idcardNo +'</td>\n' +
                                '<td>'+data[i].loginName+'</td>\n' +
                                '<td id="status'+data[i].id+'">';
                            if (data[i].status == 0) {
                                newDataPartStr += "暂停";
                            } else if (data[i].status == 1) {
                                newDataPartStr += "开通";
                            } else {
                                newDataPartStr += "删除";
                            }
                            newDataPartStr += '</td>\n' +
                                '<td>'+data[i].createDate+'</td>\n' +
                                '<td>'+data[i].lastLoginTime+'</td>\n' +
                                '<td class="td_modi" id="btn'+data[i].id+'">' +
                                '<input type="button" value=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"开通"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"暂停"';
                            }
                            newDataPartStr += ' class=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"btn_start"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"btn_pause"';
                            }
                            newDataPartStr+= ' onclick=';
                            if (data[i].status == 1) {
                                newDataPartStr +=  '"setPause(' + data[i].id + ');" />';
                            }else if (data[i].status == 0){
                                newDataPartStr += '"setStart(' + data[i].id + ');" />';
                            }
                            newDataPartStr += ' <a href="/netctoss/account/modi.do?&id='+data[i].id+'&pageNo='+endPage+'" ><input type="button" value="修改" class="btn_modify" /></a>\n'+
                                '<a href="/netctoss/account/del.do?&id='+data[i].id+'&pageNo='+endPage+'" ><input type="button" value="删除" class="btn_delete" /></a>' +
                                '</td>' +
                                '</tr>';
                            $("#tbodyData").append(newDataPartStr);
                        }
                    },
                    error:function (){alert("ajax error");}
                });

            }
            <!--上一页-->
            function prePage(pre) {
                $.ajax({
                    url:'/netctoss/jsonList.acc',
                    method:'get',
                    data:'pageNo='+pre ,
                    dataType:'json',
                    success:function (data) {
                        $("#tbodyData").empty();
                        for (var i = 0;i<data.length;i++){
                            var newDataPartStr = '<tr>\n' +
                                '<td>'+data[i].id+'</td>\n' +
                                '<td><a href="account_detail.html">'+data[i].realName+'</a></td>\n' +
                                '<td>'+data[i].idcardNo +'</td>\n' +
                                '<td>'+data[i].loginName+'</td>\n' +
                                '<td id="status'+data[i].id+'">';
                            if (data[i].status == 0) {
                                newDataPartStr += "暂停";
                            } else if (data[i].status == 1) {
                                newDataPartStr += "开通";
                            } else {
                                newDataPartStr += "删除";
                            }
                            newDataPartStr += '</td>\n' +
                                '<td>'+data[i].createDate+'</td>\n' +
                                '<td>'+data[i].lastLoginTime+'</td>\n' +
                                '<td class="td_modi" id="btn'+data[i].id+'">' +
                                '<input type="button" value=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"开通"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"暂停"';
                            }
                            newDataPartStr += ' class=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"btn_start"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"btn_pause"';
                            }
                            newDataPartStr+= ' onclick=';
                            if (data[i].status == 1) {
                                newDataPartStr +=  '"setPause(' + data[i].id + ');" />';
                            }else if (data[i].status == 0){
                                newDataPartStr += '"setStart(' + data[i].id + ');" />';
                            }
                            newDataPartStr += ' <a href="/netctoss/modi.acc?&id='+data[i].id+'&pageNo='+pre+'" ><input type="button" value="修改" class="btn_modify" /></a>\n'+
                                '<a href="/netctoss/del.acc?&id='+data[i].id+'&pageNo='+pre+'"><input type="button" value="删除" class="btn_delete" /></a>' +
                                '</td>' +
                                '</tr>';
                            $("#tbodyData").append(newDataPartStr);
                        }
                    },
                    error:function (){alert("ajax error");}
                });

            }
            <!--下一页-->
            function nextPage(next) {

                $.ajax({
                    url:'/netctoss/jsonList.acc',
                    method:'get',
                    data:'pageNo='+ next ,
                    dataType:'json',
                    success:function (data) {
                        $("#tbodyData").empty();
                        for (var i = 0;i<data.length;i++){
                            var newDataPartStr = '<tr>\n' +
                                '<td>'+data[i].id+'</td>\n' +
                                '<td><a href="account_detail.html">'+data[i].realName+'</a></td>\n' +
                                '<td>'+data[i].idcardNo +'</td>\n' +
                                '<td>'+data[i].loginName+'</td>\n' +
                                '<td id="status'+data[i].id+'">';
                            if (data[i].status == 0) {
                                newDataPartStr += "暂停";
                            } else if (data[i].status == 1) {
                                newDataPartStr += "开通";
                            } else {
                                newDataPartStr += "删除";
                            }
                            newDataPartStr += '</td>\n' +
                                '<td>'+data[i].createDate+'</td>\n' +
                                '<td>'+data[i].lastLoginTime+'</td>\n' +
                                '<td class="td_modi" id="btn'+data[i].id+'">' +
                                '<input type="button" value=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"开通"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"暂停"';
                            }
                            newDataPartStr += ' class=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"btn_start"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"btn_pause"';
                            }
                            newDataPartStr+= ' onclick=';
                            if (data[i].status == 1) {
                                newDataPartStr +=  '"setPause(' + data[i].id + ');" />';
                            }else if (data[i].status == 0){
                                newDataPartStr += '"setStart(' + data[i].id + ');" />';
                            }
                            newDataPartStr += ' <a href="/netctoss/modi.acc?&id='+data[i].id+'&pageNo='+ next +'" ><input type="button" value="修改" class="btn_modify" /></a>\n'+
                                '<a href="/netctoss/del.acc?&id='+data[i].id+'&pageNo='+ next +'" ><input type="button" value="删除" class="btn_delete" /></a>' +
                                '</td>' +
                                '</tr>';
                            $("#tbodyData").append(newDataPartStr);
                        }
                    },
                    error:function (){alert("ajax error");}
                });
            }
            <!--普通页码-->
            function normalPage(normal) {
                $.ajax({
                    url:'/netctoss/jsonList.acc',
                    method:'get',
                    data:'pageNo='+ normal ,
                    dataType:'json',
                    success:function (data) {
                        $("#tbodyData").empty();
                        for (var i = 0;i<data.length;i++){
                            var newDataPartStr = '<tr>\n' +
                                '<td>'+data[i].id+'</td>\n' +
                                '<td><a href="account_detail.html">'+data[i].realName+'</a></td>\n' +
                                '<td>'+data[i].idcardNo +'</td>\n' +
                                '<td>'+data[i].loginName+'</td>\n' +
                                '<td id="status'+data[i].id+'">';
                            if (data[i].status == 0) {
                                newDataPartStr += "暂停";
                            } else if (data[i].status == 1) {
                                newDataPartStr += "开通";
                            } else {
                                newDataPartStr += "删除";
                            }
                            newDataPartStr += '</td>\n' +
                                '<td>'+data[i].createDate+'</td>\n' +
                                '<td>'+data[i].lastLoginTime+'</td>\n' +
                                '<td class="td_modi" id="btn'+data[i].id+'">' +
                                '<input type="button" value=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"开通"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"暂停"';
                            }
                            newDataPartStr += ' class=';
                            if (data[i].status == 0) {
                                newDataPartStr += '"btn_start"';
                            } else if (data[i].status == 1) {
                                newDataPartStr += '"btn_pause"';
                            }
                            newDataPartStr+= ' onclick=';
                            if (data[i].status == 1) {
                                newDataPartStr +=  '"setPause(' + data[i].id + ');" />';
                            }else if (data[i].status == 0){
                                newDataPartStr += '"setStart(' + data[i].id + ');" />';
                            }
                            newDataPartStr += ' <a href="/netctoss/modi.acc?&id='+data[i].id+'&pageNo='+ normal +'" ><input type="button" value="修改" class="btn_modify" /></a>\n'+
                                '<a href="/netctoss/del.acc?&id='+data[i].id+'&pageNo='+ normal +'" ><input type="button" value="删除" class="btn_delete" /></a>' +
                                '</td>' +
                                '</tr>';
                            $("#tbodyData").append(newDataPartStr);
                        }
                    },
                    error:function (){alert("ajax error");}
                });
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
            <form action="${base}/account/list.do" method="get">
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input type="text" name="idcardNo" value="${param.idcardNo}" placeholder="不验证"  class="text_search" /></div>
                    <div>姓名：<input type="text" name="realName" value="${param.realName}" class="width70 text_search" placeholder="不验证"  /></div>
                    <div>登录名：<input type="text" name="loginName" value="${param.loginName}" placeholder="不验证"  class="text_search"/></div>
                    <div>
                        状态：
                        <select class="select_search" name="status">
                            <option value="-1" <c:if test="${param.status == '-1'}">selected</c:if>>全部</option>
                            <option value="1" <c:if test="${param.status == '1'}">selected</c:if>>开通</option>
                            <option value="0" <c:if test="${param.status == '0'}">selected</c:if>>暂停</option>
                            <option value="2" <c:if test="${param.status == '2'}">selected</c:if>>删除</option>
                        </select>
                    </div>
                    <div><input type="submit" value="搜索" class="btn_search" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${base}/account/add.do?pageNo=${endPage}&add=1';" />
                </div>  
                <!--删除等的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="${base}/static/images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功，且已删除其下属的业务账号！
                </div>   
                <!--数据区域：用表格展示数据-->

                <div id="data">
                    <table id="datalist">
                    <tr>
                        <th>账号ID</th>
                        <th>姓名</th>
                        <th class="width150">身份证</th>
                        <th>登录名</th>
                        <th>状态</th>
                        <th class="width100">创建日期</th>
                        <th class="width150">上次登录时间</th>
                        <th class="width200"></th>
                    </tr>
                        <tbody id="tbodyData">
                        <c:forEach var="account" items="${accounts}">
                            <tr>
                                <td>${account.id}</td>
                                <td>${account.realName}</td>
                                <td class="width150">${account.idcardNo}</td>
                                <td>${account.loginName}</td>
                                <td id="status${account.id}">
                                    <c:if test="${account.status == '0'}">暂停</c:if>
                                    <c:if test="${account.status == '1'}">开通</c:if>
                                    <c:if test="${account.status == '2'}">删除</c:if>
                                </td>
                                <td class="width100">${account.createDate}</td>
                                <td class="width150">${account.lastLoginTime}</td>
                                <td class="td_modi" id="btn${account.id}">
                                    <c:if test="${account.status == '1'}">
                                        <input type="button" value="暂停" class="btn_pause" onclick="setPause(${account.id});" />
                                        <a href="${base}/account/modi.do?&id=${account.id}&pageNo=${curPage}&idCard=${account.idcardNo}&realName=${account.realName}&loginName=${account.loginName}&status=${account.status}" ><input type="button" value="修改" class="btn_modify" /></a>
                                        <input type="button" value="删除" class="btn_delete" onclick="deleteStatus(${account.id})" /></a>
                                    </c:if>
                                    <c:if test="${account.status == '0'}">
                                        <input type="button" value="开通" class="btn_start" onclick="setStart(${account.id});" />
                                        <a href="${base}/account/modi.do?&id=${account.id}&pageNo=${curPage}&idCard=${account.idcardNo}&realName=${account.realName}&loginName=${account.loginName}&status=${account.status}"><input type="button" value="修改" class="btn_modify" /></a>
                                        <input type="button" value="删除" class="btn_delete" onclick="deleteStatus(${account.id})" /></a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                </table>

                <p>业务说明：<br />
                1、创建则开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、暂停账务账号，同时暂停下属的所有业务账号；<br />                
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br />
                7、删除账务账号，同时删除下属的所有业务账号。</p>
                </div>                   
                <!--分页-->
                <div id="pages">
                    <%--<a href="${base}/list.acc?pageNo=1&idCard=${param.idCard}&realName=${param.realName}&loginName=${param.loginName}&status=${param.status}">首页</a>--%>
                    <a onclick="firstPage()">首页</a>
                    <c:if test="${curPage <= 1}">
                        <a href="${base}/account/list.do?pageNo=1&idCard=${param.idCard}&realName=${param.realName}&loginName=${param.loginName}&status=${param.status}">上一页</a>
                        <%--<a onclick="firstPage()" >上一页</a>--%>
                    </c:if>
                    <c:if test="${curPage > 1}">
                        <a href="${base}/account/list.do?pageNo=${curPage - 1}&idCard=${param.idCard}&realName=${param.realName}&loginName=${param.loginName}&status=${param.status}">上一页</a>
                        <%--<a onclick="prePage(${curPage - 1})" >上一页</a>--%>
                    </c:if>
                    <!--处理endPage<5时 循环输出-->
                    <c:if test="${endPage <= 5}">
                        <c:forEach var="i" begin="1" end="${endPage}" step="1">
                            <c:if test="${curPage == i}">
                                <a href="${base}/account/list.do?pageNo=${i}" class="current_page">${i}</a>
                                <%--<a onclick="normalPage(${i})">${i}</a>--%>
                            </c:if>
                            <c:if test="${curPage != i}">
                                <a href="${base}/account/list.do?pageNo=${i}">${i}</a>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <!--处理endPage>=5时 -->
                    <c:if test="${endPage > 5}">
                        <c:choose>
                            <c:when test="${curPage == 1 || curPage == 2}">
                                <a onclick="normalPage(1)" <c:if test="${curPage == 1}"> class="current_page" </c:if>>1</a>
                                <a onclick="normalPage(2)" <c:if test="${curPage == 2}"> class="current_page" </c:if>>2</a>
                                <a onclick="normalPage(3)">3</a>
                                <a onclick="normalPage(4)">4</a>
                                <a onclick="normalPage(5)">5</a>
                            </c:when>
                            <c:when test="${curPage == endPage || curPage == endPage - 1 }">
                                <a onclick="normalPage(${endPage-4})">1</a>
                                <a onclick="normalPage(${endPage-3})">2</a>
                                <a onclick="normalPage(${endPage-2})">3</a>
                                <a onclick="normalPage(${endPage-1})"<c:if test="${curPage == endPage - 1}"> class="current_page" </c:if>>${endPage - 1}</a>
                                <a onclick="normalPage(${endPage})"<c:if test="${curPage == endPage}"> class="current_page" </c:if>>${endPage}</a>
                            </c:when>
                            <c:otherwise>
                                <a onclick="normalPage(${curPage-2})" >${curPage-2}</a>
                                <a onclick="normalPage(${curPage-1})">${curPage-1}</a>
                                <a onclick="normalPage(${curPage})" class="current_page">${curPage}</a>
                                <a onclick="normalPage(${curPage+1})">${curPage+1}</a>
                                <a onclick="normalPage(${curPage+2})">${curPage+2}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <c:choose>
                        <c:when test="${curPage == endPage}">
                            <a href="${base}/account/list.do?pageNo=${endPage}&idCard=${param.idCard}&realName=${param.realName}&loginName=${param.loginName}&status=${param.status}">下一页</a>
                            <%--<a onclick="lastPage(${endPage})" >下一页</a>--%>
                        </c:when>
                        <c:otherwise>
                            <a href="${base}/account/list.do?pageNo=${curPage + 1}&idCard=${param.idCard}&realName=${param.realName}&loginName=${param.loginName}&status=${param.status}">下一页</a>
                            <%--<a onclick="nextPage(${curPage + 1})" >下一页</a>--%>
                        </c:otherwise>
                    </c:choose>
                    <%--<a href="${base}/list.acc?pageNo=${endPage}&idCard=${param.idCard}&realName=${param.realName}&loginName=${param.loginName}&status=${param.status}">末页</a>--%>
                    <a onclick="lastPage(${endPage})">末页</a>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[地址：合肥市高新区云飞路与文曲路交口创新产业园二期F4栋12层]</p>
            <p>版权所有&copy;合肥宏晶信息科技有限公司 </p>
        </div>
    </body>
</html>