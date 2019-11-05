<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
</head>
<body>
    <%
        //登录提示信息
        String loginMsg = (String) session.getAttribute("loginMsg");
        if (loginMsg == null) {
            loginMsg = "";
        }

        //从cookie读取用户名和密码
        String username = "";
        String password = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("loginInfo")) {
                    String loginInfo = cookie.getValue();
                    username = loginInfo.substring(0, loginInfo.indexOf(" "));
                    password = loginInfo.substring(loginInfo.indexOf(" ") + 1);
                    break;
                }
            }
        }
    %>
    <form action="${pageContext.request.contextPath}/SysUserLogin" method="post">
        <label>
            用户名称：<input type="text" name="username" value="<%= username %>" />
        </label><br/>
        <label>
            登录密码：<input type="password" name="password" value="<%= password %>" />
        </label>
        <input type="checkbox" name="savepwd" id="savepwd" checked /><label for="savepwd">保存密码</label><br/>
        <label style="color: red"><%=loginMsg%></label><br/>
        <input type="submit" value="登录" />
    </form>
</body>
</html>
