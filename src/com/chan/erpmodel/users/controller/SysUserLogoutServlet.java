package com.chan.erpmodel.users.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class SysUserLogoutServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null) {
            PrintWriter out = response.getWriter();
            out.println("非法访问！");
            return;
        }
        //ServletContext servletContext = session.getServletContext();
        session.removeAttribute("currentUser");
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}