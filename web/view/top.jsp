<%@ page import="com.chan.erpmodel.users.domain.SysUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div style="width: 100%; height: 100%; border-bottom: #afafaf 1px solid">
    <div style="position: absolute; top: 0; left:0; width: 100%; height: 180px">
        <img src="../img/top.jpg" alt="">
    </div>
    <%
        //显示用户信息
        String currentUsername = "";
        Object currentUserObj = session.getAttribute("currentUser");
        if (currentUserObj != null) {
            SysUser currentUser = (SysUser) currentUserObj;
            currentUsername = currentUser.getName();
        }

        //显示在线人数
        int onlineNum = 0;
        Object onlineNumObj = application.getAttribute("onlineNum");
        if (onlineNumObj != null) {
            onlineNum = (Integer) onlineNumObj;
        }
    %>
    <div style="position: absolute; top: 180px; right: 20px; height: 30px; line-height: 30px">
        用户名称【${sessionScope.currentUser.name}】
        在线人数：${applicationScope.onlineNum}
        <%
            request.setCharacterEncoding("UTF-8");
            if (request.getParameter("location") != null) {
        %>
        当前位置：${param.location}
        <%} else {%>
        <a href="worker.jsp">首页</a>
        <%}%>
        <a href="${pageContext.request.contextPath}/SysUserLogout">退出系统</a>
    </div>
</div>
