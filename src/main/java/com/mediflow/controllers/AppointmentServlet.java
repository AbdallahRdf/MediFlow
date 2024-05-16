package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.enums.AppointmentStatus;
import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.enums.Room;
import com.mediflow.models.Appointment;
import com.mediflow.models.Doctor;
import com.mediflow.models.Patient;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "AppointmentServlet", urlPatterns = "/appointment-servlet")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if (req.getParameter("id") != null || req.getParameter("method") != null) {
            req.getSession().setAttribute("doctors", Doctor.all());
            req.getSession().setAttribute("patients", Patient.all());
            if(req.getParameter("id")!=null) {
                req.getSession().setAttribute("appointment", Appointment.get(Integer.parseInt(req.getParameter("id").trim())));
                resp.sendRedirect(req.getSession().getAttribute("role").toString().toLowerCase()+"/appointment/updateAppointment.jsp");
            } else {
                resp.sendRedirect(req.getSession().getAttribute("role").toString().toLowerCase()+"/appointment/addAppointment.jsp");
            }
        } else {
            // Convert to JSON
            String json = new Gson().toJson(Appointment.all());

            // Send JSON response
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if(req.getParameter("id") == null)
        {
            try {
                Appointment.create(
                        Integer.parseInt(req.getParameter("patient_id").trim()),
                        Integer.parseInt(req.getParameter("doctor_id").trim()),
                        new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("date").trim()),
                        new Time(new SimpleDateFormat("HH:mm").parse(req.getParameter("time").trim()).getTime()),
                        Room.valueOf(req.getParameter("room").trim())
                        );
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        } else if(req.getParameter("id") != null )
        {
            if(req.getParameter("patient_id") == null){
                Appointment.delete(Integer.parseInt(req.getParameter("id").trim()));
            } else {
                try {
                    Appointment.update(
                            Integer.parseInt(req.getParameter("id").trim()),
                            Integer.parseInt(req.getParameter("patient_id").trim()),
                            Integer.parseInt(req.getParameter("doctor_id").trim()),
                            new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("date").trim()),
                            new Time(new SimpleDateFormat("HH:mm").parse(req.getParameter("time").trim()).getTime()),
                            AppointmentStatus.valueOf(req.getParameter("status").trim()),
                            Room.valueOf(req.getParameter("room").trim())
                    );
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        resp.sendRedirect(req.getSession().getAttribute("role").toString().toLowerCase() +"/appointment/appointments.jsp");
    }
}
