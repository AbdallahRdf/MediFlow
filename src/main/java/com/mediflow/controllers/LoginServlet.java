package com.mediflow.controllers;

import com.mediflow.enums.Role;
import com.mediflow.models.*;
import com.mediflow.utils.Encryptor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login-servlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("username");
        session.removeAttribute("role");
        session.invalidate();
        ((HttpServletResponse)resp).sendRedirect("index.jsp");
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        String username = req.getParameter("username").trim();
        String password = Encryptor.encryptPassword(req.getParameter("password").trim());
        String role = req.getParameter("role").trim();

        if(Login.authenticate(username, password, role))
        {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);
            session.setAttribute("appointmentsCount", Appointment.all().size());
            session.setAttribute("doctorsCount", Doctor.all().size());
            if(role.equals(Role.ADMIN.toString()))
            {
                session.setAttribute("patientsCount", Patient.all().size());
                session.setAttribute("secretariesCount", Secretary.all().size());
            }
            res.sendRedirect(role.toLowerCase() + "/dashboard.jsp");
        } else {
            String error = "Invalid username or password";
            req.setAttribute("error", error);
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}
