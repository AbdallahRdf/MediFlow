package com.mediflow.controllers;

import com.mediflow.enums.Role;
import com.mediflow.models.Appointment;
import com.mediflow.models.Doctor;
import com.mediflow.models.Patient;
import com.mediflow.models.Secretary;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "DashboardServlet", urlPatterns = "/dashboard-servlet")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session = req.getSession();
        String role = session.getAttribute("role").toString();
        session.setAttribute("appointmentsCount", Appointment.all().size());
        session.setAttribute("patientsCount", Patient.all().size());
        if(role.equals(Role.ADMIN.toString()))
        {
            session.setAttribute("doctorsCount", Doctor.all().size());
            session.setAttribute("secretariesCount", Secretary.all().size());
        }
        resp.sendRedirect(role.toLowerCase() + "/dashboard.jsp");
    }

}
