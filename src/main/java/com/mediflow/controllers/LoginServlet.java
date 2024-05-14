package com.mediflow.controllers;

import com.mediflow.enums.Role;
import com.mediflow.models.*;
import com.mediflow.utils.Encryptor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/dashboard")
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
            req.setAttribute("appointmentsCount", Appointment.all().size());
            req.setAttribute("doctorsCount", Doctor.all().size());
            if(req.getParameter("role").equals(Role.ADMIN.toString()))
            {
                req.setAttribute("patientsCount", Patient.all().size());
                req.setAttribute("secretariesCount", Secretary.all().size());
                req.getRequestDispatcher("admin/dashboard.jsp").forward(req, res);
            }
            else if(req.getParameter("role").equals(Role.SECRETARY.toString()))
            {
                req.getRequestDispatcher("secretary/dashboard.jsp").forward(req, res);
            }
        } else {
            res.sendRedirect("index.jsp");
        }
    }
}
