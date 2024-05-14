package com.mediflow.controllers;

import com.mediflow.enums.Role;
import com.mediflow.models.Login;
import com.mediflow.utils.Encryptor;
import com.sun.security.jgss.GSSUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        String username = req.getParameter("username").trim();
        String password = Encryptor.encryptPassword(req.getParameter("password").trim());
        System.out.println(password);
        String role = req.getParameter("role").trim();

        if(Login.authenticate(username, password, role))
        {
            req.getSession().setAttribute("username", username);
            req.getSession().setAttribute("role", role);
            if(req.getParameter("role").equals(Role.ADMIN.toString())){
                res.sendRedirect("admin/dashboard.jsp");
            } else if(req.getParameter("role").equals(Role.SECRETARY.toString())){
                res.sendRedirect("secretary/dashboard.jsp");
            }
        } else {
            req.setAttribute("error", true);
            req.getRequestDispatcher("index.jsp").forward(req, res);
        }
    }
}
