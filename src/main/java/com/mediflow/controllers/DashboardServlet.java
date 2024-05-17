package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.enums.AppointmentStatus;
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
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(name = "DashboardServlet", urlPatterns = "/dashboard-servlet")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        HashMap<String, Integer> appointmentsCount = new HashMap<>();
        appointmentsCount.put(AppointmentStatus.SCHEDULED.toString(), Appointment.getAppointmentStatusCount(AppointmentStatus.SCHEDULED.toString()));
        appointmentsCount.put(AppointmentStatus.COMPLETED.toString(), Appointment.getAppointmentStatusCount(AppointmentStatus.COMPLETED.toString()));
        appointmentsCount.put(AppointmentStatus.CANCELLED.toString(), Appointment.getAppointmentStatusCount(AppointmentStatus.CANCELLED.toString()));

        HashMap<String, Object> stats = new HashMap<>();
        stats.put("appointments", Appointment.all().size());
        stats.put("patients", Patient.all().size());
        if(req.getParameter("role").equals(Role.ADMIN.toString())){
            stats.put("doctors", Doctor.all().size());
            stats.put("secretaries", Secretary.all().size());
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
