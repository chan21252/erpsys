<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>企业资源管理系统</title>
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- 未登录，重定向到登录页面 -->
    <c:if test="${sessionScope.currentUser eq null}">
        <c:redirect url="${pageContext.request.contextPath}/login.jsp"/>
    </c:if>

    <%
        String location = "首页";
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
            <td id="right">s1</td>
        </tr>
        <tr id="footer">
            <td colspan="2">
                <jsp:include page="foot.jsp" />
            </td>
        </tr>
    </table>
</body>
</html>
