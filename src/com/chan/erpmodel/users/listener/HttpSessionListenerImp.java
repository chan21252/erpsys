package com.chan.erpmodel.users.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HttpSessionListenerImp implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        ServletContext servletContext = session.getServletContext();
        Object onlineNumObj = servletContext.getAttribute("onlineNum");

        if (onlineNumObj != null) {
            int onlineNum = (Integer) onlineNumObj;
            servletContext.setAttribute("onlineNum", onlineNum + 1);
        } else {
            servletContext.setAttribute("onlineNum", 1);
        }

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        ServletContext servletContext = session.getServletContext();
        Object onlineNumObj = servletContext.getAttribute("onlineNum");
        if (onlineNumObj != null) {
            int onlineNum = (Integer) onlineNumObj;
            servletContext.setAttribute("onlineNum", onlineNum - 1);
        }
    }
}
