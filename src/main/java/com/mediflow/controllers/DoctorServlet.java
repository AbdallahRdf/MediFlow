package com.mediflow.controllers;

import com.mediflow.models.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DoctorServlet", urlPatterns = "/doctor-servlet")
public class DoctorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("doctors", Doctor.all());
        resp.sendRedirect("admin/doctor/doctors.jsp");
    }
/*
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("method").equals("create"))
        {
            Doctor.create(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim(),
                    req.getParameter("speciality").trim(),
                    req.getParameter("registration_num").trim()

            );
        } else if(req.getParameter("method").equals("update"))
        {
            if(req.getParameter("id") == null){
                req.getSession().setAttribute("doctor", Doctor.get((req.getParameter("id"))));
                resp.sendRedirect("common/doctor/updateDoctor.jsp");
                return;
            } else {
                Doctor.update(
                        Integer.parseInt(req.getParameter("id").trim()),
                        req.getParameter("cin").trim(),
                        req.getParameter("firstName").trim(),
                        req.getParameter("lastName").trim(),
                        req.getParameter("email").trim(),
                        req.getParameter("phone").trim()
                );
            }
        }
        doGet(req, resp);
    }*/
}
