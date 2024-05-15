package com.mediflow.controllers;

import com.mediflow.enums.DoctorSpecialty;
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

        if(req.getParameter("id")!=null){
          req.setAttribute("doctor", Doctor.get(Integer.parseInt(req.getParameter("id"))));
          resp.sendRedirect("admin/doctor/editDoctor.jsp");
          return;
        }
        req.getSession().setAttribute("doctors", Doctor.all());
        resp.sendRedirect("admin/doctor/doctors.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post request");

        if(req.getParameter("id") == null)
        {
            System.out.println("create doctor");
            Doctor.create(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim(),
                    getSpeciality(req.getParameter("speciality").trim()),
                    Integer.parseInt(req.getParameter("registration_num").trim())
            );
        } else if(req.getParameter("id") != null )
        {
            if(req.getParameter("cin") == null){
                Doctor.delete(Integer.parseInt(req.getParameter("id")));
            } else {
                Doctor.update(
                        Integer.parseInt(req.getParameter("id").trim()),
                        req.getParameter("cin").trim(),
                        req.getParameter("firstName").trim(),
                        req.getParameter("lastName").trim(),
                        req.getParameter("email").trim(),
                        req.getParameter("phone").trim(),
                        getSpeciality(req.getParameter("speciality").trim()),
                        Integer.parseInt(req.getParameter("registration_num").trim())
                );
            }
        }
        doGet(req, resp);
    }

    private DoctorSpecialty getSpeciality(String selectedSpeciality) {
            for (DoctorSpecialty s : DoctorSpecialty.values()) {
                if (s.name().equalsIgnoreCase(selectedSpeciality)) {
                    return s;
                }
            }
            return null;
        }

}
