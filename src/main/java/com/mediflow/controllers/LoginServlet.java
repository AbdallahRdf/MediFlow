package com.mediflow.controllers;

import com.mediflow.models.Login;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        if(Login.authenticate(req.getParameter("username"), req.getParameter("password"), req.getParameter("role"))){
            req.getSession().setAttribute("username", req.getParameter("username"));
            req.getSession().setAttribute("role", req.getParameter("role"));
            if(req.getParameter("role").equals("admin")){
                res.sendRedirect("views/admin/dashboard.jsp");
            } else if(req.getParameter("role").equals("secretary")){
                res.sendRedirect("views/secretary/dashboard.jsp");
            }
        } else {
            req.setAttribute("error", true);
            req.getRequestDispatcher("index.jsp").forward(req, res);
        }
    }
}
