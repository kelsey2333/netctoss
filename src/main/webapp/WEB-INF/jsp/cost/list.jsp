<%@page contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
pageContext.setAttribute("base",request.getContextPath());
%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>宏晶信息－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${base}/static/styles/global_color.css" />
        <script type="text/javascript" src="${base}/static/jquery-1.4.3.js"></script>
        <script type="text/javascript" src="${base}/static/json.js"></script>
        <script language="javascript" type="text/javascript">
            //排序按钮的点击事件
            function sort(btnObj) {
                if (btnObj.className == "sort_desc"){
                    // btnObj.className = "sort_asc";
                    location.href="${base}/cost/list.do?costSort=DESC";
                } else{
                    // btnObj.className = "sort_desc";
                    location.href="${base}/cost/list.do?costSort=ASC";
                }

            }

            //启用
            function startFee(id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                if (r) {
                    //获取当前行的id和status
                    //将当前行的id和status发送给/cost/status.do
                    //success:function(data){}如果数据库修改成功，动态返回到表中具体体现在status和class
                    $.ajax({
                        url: '/netctoss/cost/status.do',
                        method: 'get',
                        data: 'id='+id+'&status=1',
                        dataType: 'json',
                        success: function (data) {
                            //1修改表中状态为启用
                            $("#status" + id).text("开通");
                            //2、修改表中无任何数据
                            $("#modiStatus" + id).empty();
                        }
                    });
                }
            }
            //删除
            function deleteFee(id) {
                var r = window.confirm("确定要删除此资费吗？");
                if (r) {
                    //获取当前行的id
                    //将当前行的id和status发送给/cost/delete.do
                    $.ajax({
                        url: '/netctoss/cost/status.do',
                        method: 'get',
                        data: 'id='+id+"&status=2",
                        dataType: 'json',
                        success: function (data) {
                            //1、修改表中状态为删除
                            $("#status" + id).text("删除");
                            //2、修改表中无任何数据
                            $("#modiStatus" + id).empty();
                        }
                    });
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
                <li><a href="${base}/static/html/index.html" class="index_off"></a></li>
                <li><a href="${base}/static/role/role_list.html" class="role_off"></a></li>
                <li><a href="${base}/static/admin/admin_list.html" class="admin_off"></a></li>
                <li><a href="${base}/static/fee/fee_list.html" class="fee_on"></a></li>
                <li><a href="${base}/static/account/accountList.jsp" class="account_off"></a></li>
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
            <form action="" method="">
                <!--排序-->
                <div class="search_add">
                    <div>
                         <input type="button" value="基费" class="sort_${costSort}" onclick="location.href='${base}/cost/list.do?sortName=cost&costSort=${costSort}';" />
                         <input type="button" value="时长" class="sort_${timeSort}" onclick="location.href='${base}/cost/list.do?sortName=duration&timeSort=${timeSort}';" />
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${base}/cost/addCost.do?pageNo=${endPage}';" />
                </div> 
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="${base}/static/images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长</th>
                            <th>基本费用</th>
                            <th>单位费用</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>
                        <tbody>
                         <c:forEach items="${costs}" var="cost">
                            <tr>
                                <td>${cost.id}</td>
                                <td><a href="${base}/static/fee/fee_detail.html">${cost.name}</a></td>
                                <td>${cost.baseDuration}</td>
                                <td>${cost.baseCost}</td>
                                <td>${cost.unitCost}</td>
                                <td>${cost.creatime}</td>
                                <td id="starTime${cost.id}"></td>
                                <%--todo startime记载--%>
                                <c:if test="${cost.status == '1'}">
                                     <td id="status${cost.id}">开通</td>
                                     <td></td>
                                </c:if>
                                <c:if test="${cost.status == '2'}">
                                     <td id="status${cost.id}">删除</td>
                                    <td></td>
                                </c:if>
                                <c:if test="${cost.status == '0'}">
                                    <td id="status${cost.id}">暂停</td>
                                    <td id="modiStatus${cost.id}">
                                        <input type="button" value="启用" class="btn_start" onclick="startFee(${cost.id});" />
                                        <input type="button" value="修改" class="btn_modify" onclick="location.href='${base}/cost/modiCost.do?id=${cost.id}&status=0&name=${cost.name}&baseDuration=${cost.baseDuration}&baseCost=${cost.baseDuration}&unitCost=${cost.unitCost}';" />
                                        <input type="button" value="删除" class="btn_delete" onclick="deleteFee(${cost.id});" />
                                    </td>
                                </c:if>
                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
                        <c:choose>
                            <c:when test="${curPage <= 1}">
                                <c:choose>
                                    <c:when test="${sortName == null}">
                                        <a href="${base}/cost/list.do?pageNo=1">上一页</a>
                                    </c:when>
                                    <c:when test="${sortName == 'cost'}">
                                        <a href="${base}/cost/list.do?pageNo=1&sortName=cost&costSort=${param.costSort}">上一页</a>
                                    </c:when>
                                    <c:when test="${sortName == 'duration'}">
                                        <a href="${base}/cost/list.do?pageNo=1&sortName=duration&timeSort=${param.timeSort}">上一页</a>
                                    </c:when>
                                </c:choose>
                            </c:when>
                            <c:when test="${curPage > 1}">
                                <c:choose>
                                    <c:when test="${sortName == null}">
                                        <a href="${base}/cost/list.do?pageNo=${curPage - 1}">上一页</a>
                                    </c:when>
                                    <c:when test="${sortName == 'cost'}">
                                        <a href="${base}/cost/list.do?pageNo=${curPage - 1}&sortName=cost&costSort=${param.costSort}">上一页</a>
                                    </c:when>
                                    <c:when test="${sortName == 'duration'}">
                                        <a href="${base}/cost/list.do?pageNo=${curPage - 1}&sortName=duration&timeSort=${param.timeSort}">上一页</a>
                                    </c:when>
                                </c:choose>
                            </c:when>
                        </c:choose>

                    <!--处理endPage<5时 循环输出-->
                    <c:if test="${endPage <= 5}">
                        <c:forEach var="i" begin="1" end="${endPage}" step="1">
                            <c:if test="${curPage == i}">
                                <a href="${base}/cost/list.do?pageNo=${i}" class="current_page">${i}</a>
                            </c:if>
                            <c:if test="${curPage != i}">
                                <a href="${base}/cost/list.do?pageNo=${i}">${i}</a>
                            </c:if>
                        </c:forEach>
                    </c:if>

                    <!--处理endPage>=5时 -->
                    <c:if test="${endPage > 5}">
                        <c:choose>
                            <c:when test="${curPage == 1 || curPage == 2}">
                                <a href="${base}/cost/list.do?pageNo=1"<c:if test="${curPage == 1}"> class="current_page" </c:if>>1</a>
                                <a href="${base}/cost/list.do?pageNo=2"<c:if test="${curPage == 2}"> class="current_page" </c:if>>2</a>
                                <a href="${base}/cost/list.do?pageNo=3">3</a>
                                <a href="${base}/cost/list.do?pageNo=4">4</a>
                                <a href="${base}/cost/list.do?pageNo=5">5</a>
                            </c:when>
                            <c:when test="${curPage == endPage || curPage == endPage - 1 }">
                                <a href="${base}/cost/list.do?pageNo=${endPage-4}">1</a>
                                <a href="${base}/cost/list.do?pageNo=${endPage-3}">2</a>
                                <a href="${base}/cost/list.do?pageNo=${endPage-2}">3</a>
                                <a href="${base}/cost/list.do?pageNo=${endPage-1}"<c:if test="${curPage == endPage - 1}"> class="current_page" </c:if>>${endPage - 1}</a>
                                <a href="${base}/cost/list.do?pageNo=${endPage}"<c:if test="${curPage == endPage}"> class="current_page" </c:if>>${endPage}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${base}/cost/list.do?pageNo=${curPage-2}" >${curPage-2}</a>
                                <a href="${base}/cost/list.do?pageNo=${curPage-1}">${curPage-1}</a>
                                <a href="${base}/cost/list.do?pageNo=${curPage}" class="current_page">${curPage}</a>
                                <a href="${base}/cost/list.do?pageNo=${curPage+1}">${curPage+1}</a>
                                <a href="${base}/cost/list.do?pageNo=${curPage+2}">${curPage+2}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <c:choose>
                        <c:when test="${curPage < endPage}">
                            <c:choose>
                                <c:when test="${sortName == null}">
                                    <a href="${base}/cost/list.do?pageNo=${curPage + 1}">下一页</a>
                                </c:when>
                                <c:when test="${sortName == 'cost'}">
                                    <a href="${base}/cost/list.do?pageNo=${curPage + 1}&sortName=cost&costSort=${param.costSort}">下一页</a>
                                </c:when>
                                <c:when test="${sortName == 'duration'}">
                                    <a href="${base}/cost/list.do?pageNo=${curPage + 1}&sortName=duration&timeSort=${param.timeSort}">下一页</a>
                                </c:when>
                            </c:choose>
                        </c:when>
                        <c:when test="${curPage >= endPage}">
                            <c:choose>
                                <c:when test="${sortName == null}">
                                    <a href="${base}/cost/list.do?pageNo=${endPage}">下一页</a>
                                </c:when>
                                <c:when test="${sortName == 'cost'}">
                                    <a href="${base}/cost/list.do?pageNo=${endPage}&sortName=cost&costSort=${param.costSort}">下一页</a>
                                </c:when>
                                <c:when test="${sortName == 'duration'}">
                                    <a href="${base}/cost/list.do?pageNo=${endPage}&sortName=duration&timeSort=${param.timeSort}">下一页</a>
                                </c:when>
                            </c:choose>
                        </c:when>
                    </c:choose>
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
