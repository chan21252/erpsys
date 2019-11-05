<%@ page import="java.util.List" %>
<%@ page import="com.chan.erpmodel.users.domain.Meeting" %>
<%@ page import="com.chan.erpmodel.users.service.MeetingService" %>
<%@ page import="com.chan.erpmodel.users.service.MeetingServiceImp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.chan.erpmodel.users.domain.SysUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>企业资源管理系统</title>
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
    <style>

        #btn-create-meeting {
            position: absolute;
            top: 40px;
            left: 100px;
        }

        .panel-meeting-detail {
            position: absolute;
            left: 100px;
            top: 50px;
            width: 500px;
            height: 500px;
            background-color: #dddddd;
            border: solid 1px #afafaf;
        }

        .btn-meeting-detail {
            color: #0be;
            cursor: pointer
        }

        .close {
            position: absolute;
            top: 0;
            right: 0;
            background-color: #0be;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 未登录，重定向到登录页面 -->
<c:if test="${sessionScope.currentUser eq null}">
    <c:redirect url="${pageContext.request.contextPath}/login.jsp"/>
</c:if>

<%
    String location = "会议管理";
    request.setCharacterEncoding("UTF-8");
%>
<table id="container-table">
    <tr id="top">
        <td colspan="2">
            <jsp:include page="top.jsp">
                <jsp:param name="location" value="<%=location%>" />
            </jsp:include>
        </td>
    </tr>
    <tr id="content">
        <td id="left">
            <jsp:include page="left.jsp" />
        </td>
        <td id="right">
            <div id="main-panel">
                <!-- 新建会议按钮 -->
                <%
                    SysUser currentUser = (SysUser) session.getAttribute("currentUser");
                    String role = currentUser.getRole();
                    final String MEETING_ADMIN_ROLE = "meetingadmin";
                    if (role.contains(MEETING_ADMIN_ROLE)) {%>
                        <button id="btn-create-meeting">新建会议</button>
                    <%}
                %>
                <!-- 会议表格 -->
                <table class="data-table">
                    <thead>
                        <tr>
                            <td>序号</td>
                            <td>标题</td>
                            <td>日期</td>
                            <td>与会场所</td>
                            <td>会议状态</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <tbody>
                    <%!
                        private MeetingService meetingService = new MeetingServiceImp();
                        private List<Meeting> meetingList = meetingService.queryAllMeeting();
                        private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    %>
                    <% if (meetingList != null) {
                            for (Meeting m : meetingList) { %>
                               <tr>
                                   <td><%=m.getId()%></td>
                                   <td><%=m.getTitle()%></td>
                                   <td><%=sdf.format(m.getStartDate())%></td>
                                   <td><%=m.getAddress()%></td>
                                   <td><%
                                       String meetingStatus;
                                       meetingStatus = (m.getStatus() == 0) ? "待执行" :
                                               ((m.getStatus() == 1) ? "完结" : "取消");
                                   %><%=meetingStatus%></td>
                                   <td id="btn-meeting-detail-<%=m.getId()%>" class="btn-meeting-detail">详情</td>
                               </tr>
                            <%}
                        }
                    %>
                    </tbody>
                </table>
                <%
                    if (meetingList != null) {
                        for (Meeting m : meetingList) { %>
                            <!-- 默认隐藏，点击显示 -->
                            <div id="panel-meeting-detail-<%=m.getId()%>" class="panel-meeting-detail hidden">
                                <div>会议内容：<%=m.getContent()%></div>
                                <div>与会人员：<%=m.getParticipant()%></div>
                                <div>持续时间：<%=m.getDuration()%>分钟</div>
                                <div>描述：<%=m.getDescs()%></div>
                                <div class="close">关闭</div>
                            </div>
                        <%}
                    }
                %>
            </div>
        </td>
    </tr>

    <tr id="footer">
        <td colspan="2">
            <jsp:include page="foot.jsp" />
        </td>
    </tr>
</table>
<script>
    var btn_meeting_detail = document.getElementsByClassName("btn-meeting-detail");
    for (var i = 0; i < btn_meeting_detail.length; i++) {
        btn_meeting_detail[i].addEventListener('click', function () {
            var btn_id = this.id;
            var panel_id = "panel-meeting-detail-" + btn_id.split("-")[3];
            console.log("查看" + panel_id);
            var panel_div = document.getElementById(panel_id);
            panel_div.classList.remove("hidden");
            var close_div = panel_div.querySelector(".close");
            close_div.addEventListener('click', function () {
                this.parentElement.classList.add("hidden");
            });
        });
    }
</script>
</body>
</html>
