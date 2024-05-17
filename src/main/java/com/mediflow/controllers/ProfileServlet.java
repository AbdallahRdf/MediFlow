package com.mediflow.controllers;

import com.mediflow.enums.Role;
import com.mediflow.models.Admin;
import com.mediflow.models.Login;
import com.mediflow.models.Secretary;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = "/profile-servlet")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = session.getAttribute("username").toString();
        if(session.getAttribute("role").equals(Role.ADMIN.toString())){
            session.setAttribute("admin", Admin.getByLogginID(Login.getID(username)));
        } else if(session.getAttribute("role").equals(Role.SECRETARY.toString())){
            session.setAttribute("secretary", Secretary.getByLogginID(Login.getID(username)));
        }
        resp.sendRedirect(req.getSession().getAttribute("role").toString().toLowerCase() + "/profile.jsp" );
    }
}
