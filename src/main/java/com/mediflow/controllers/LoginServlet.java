package com.mediflow.controllers;

import com.mediflow.enums.AppointmentStatus;
import com.mediflow.enums.DoctorSpecialty;
import com.mediflow.enums.Role;
import com.mediflow.enums.Room;
import com.mediflow.models.*;
import com.mediflow.utils.Encryptor;
import com.mediflow.utils.Hibernate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.spi.SessionFactoryServiceRegistryBuilder;

import javax.print.Doc;
import java.io.IOException;
import java.sql.Time;
import java.util.Date;

@WebServlet(name = "LoginServlet", urlPatterns = "/login-servlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("username");
        session.removeAttribute("role");
        session.invalidate();
        resp.sendRedirect("index.jsp");
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        String username = req.getParameter("username").trim();
        String password = Encryptor.encryptPassword(req.getParameter("password").trim());
        String role = req.getParameter("role").trim();

        if(Login.authenticate(username, password, Role.valueOf(role)))
        {
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("username", username);
            httpSession.setAttribute("role", role);
            res.sendRedirect(role.toLowerCase() + "/dashboard.jsp");
        } else {
            String error = "Invalid username or password";
            req.setAttribute("error", error);
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}
