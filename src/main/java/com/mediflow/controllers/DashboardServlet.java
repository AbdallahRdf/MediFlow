package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.enums.AppointmentStatus;
import com.mediflow.enums.Role;
import com.mediflow.models.Appointment;
import com.mediflow.models.Doctor;
import com.mediflow.models.Patient;
import com.mediflow.models.Secretary;
import com.mediflow.utils.Hibernate;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(name = "DashboardServlet", urlPatterns = "/dashboard-servlet")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        HashMap<String, Long> appointmentsCount = new HashMap<>();
        appointmentsCount.put(AppointmentStatus.SCHEDULED.toString(), Appointment.getCountBy(AppointmentStatus.SCHEDULED));
        appointmentsCount.put(AppointmentStatus.COMPLETED.toString(), Appointment.getCountBy(AppointmentStatus.COMPLETED));
        appointmentsCount.put(AppointmentStatus.CANCELLED.toString(), Appointment.getCountBy(AppointmentStatus.CANCELLED));

        HashMap<String, Object> stats = new HashMap<>();
        stats.put("appointments", Hibernate.count(Appointment.class));
        stats.put("patients", Hibernate.count(Patient.class));
        if(req.getParameter("role").equals(Role.ADMIN.toString())){
            stats.put("doctors", Hibernate.count(Doctor.class));
            stats.put("secretaries", Hibernate.count(Secretary.class));
        }
        stats.put("appointmentsStatus", appointmentsCount);


       String json = new Gson().toJson(stats);

       // Send JSON response
       PrintWriter out = resp.getWriter();
       resp.setContentType("application/json");
       resp.setCharacterEncoding("UTF-8");
       System.out.println("2 - Content-Type: " + resp.getContentType());
       out.write(json);
       out.flush();
    }

}
