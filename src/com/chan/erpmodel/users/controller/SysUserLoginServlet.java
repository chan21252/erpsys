package com.chan.erpmodel.users.controller;

import com.chan.erpmodel.users.service.SysUserService;
import com.chan.erpmodel.users.service.SysUserServiceImp;
import com.chan.erpmodel.users.domain.SysUser;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * 处理登录请求的servlet
 *
 * @author CuiCan
 */
public class SysUserLoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* 设置编码 */
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        /* 是否是非法访问 */
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        /* 获取请求参数 */
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        /* 身份验证 */
        SysUser loginUser = new SysUser();
        loginUser.setName(username);
        loginUser.setPassword(password);
        SysUserService sysUserService = new SysUserServiceImp();
        SysUser currentUser = sysUserService.validateLogin(loginUser);

        //登录成功
        if (currentUser != null) {
            /* 是否保存用户名和密码 */
            saveLoginInfo(request, response);

            session.removeAttribute("loginMsg");
            session.setAttribute("currentUser", currentUser);
            response.sendRedirect(request.getContextPath() + "/view/worker.jsp");
        } else {
            session.setAttribute("loginMsg", "用户名或密码错误！");
            response.sendRedirect("login.jsp");
        }
    }

    private void saveLoginInfo(HttpServletRequest request, HttpServletResponse response) {
        //登录信息cookie字段名称
        final String loginCookieName = "loginInfo";

        //勾选保存密码的值为on
        final String on = "on";

        final String username = request.getParameter("username");
        final String password = request.getParameter("password");
        final String savePwd = request.getParameter("savepwd");
        final String loginInfo = username + " " + password;

        //cookie过期时间15天
        final int expiredTime = 3600 * 24 * 15;

        //获取客户端的cookie
        Cookie[] cookies = request.getCookies();

        //勾选了保存密码
        if (on.equals(savePwd)) {
            //cookie存在
            if (cookies != null && cookies.length > 0) {
                //是否有登录信息cookie标记
                boolean hasLoginCookie = false;
                for (Cookie c : cookies) {
                    if (c.getName().equals(loginCookieName)) {
                        c.setValue(loginInfo);
                        c.setMaxAge(expiredTime);
                        hasLoginCookie = true;
                        break;
                    }
                }
                //没有登录信息cookie就创建
                if (!hasLoginCookie) {
                    Cookie loginCookie = new Cookie(loginCookieName, loginInfo);
                    response.addCookie(loginCookie);
                }
            } else {
                //没有cookie就new
                Cookie loginCookie = new Cookie(loginCookieName, loginInfo);
                response.addCookie(loginCookie);
            }
        }

        //没有勾选保存密码
        if (savePwd == null) {
            if (cookies != null && cookies.length > 0) {
                for (Cookie c : cookies) {
                    if (c.getName().equals(loginCookieName)) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
        }
    }
}
