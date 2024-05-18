package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.enums.DoctorSpecialty;
import com.mediflow.models.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "DoctorServlet", urlPatterns = "/doctor-servlet")
public class DoctorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if(req.getParameter("id")!=null){
            Doctor doctor=Doctor.get(Integer.parseInt(req.getParameter("id")));
            HttpSession session = req.getSession();
            session.setAttribute("id",doctor.getID());
            session.setAttribute("firstName",doctor.getFirstName());
            session.setAttribute("lastName",doctor.getLastName());
            session.setAttribute("cin",doctor.getCIN());
            session.setAttribute("email",doctor.getEmail());
            session.setAttribute("phone",doctor.getPhone());
            session.setAttribute("speciality",doctor.getSpeciality());
            session.setAttribute("registration_num",doctor.getRegistrationNum());
            resp.sendRedirect("admin/doctor/updateDoctor.jsp");
            return;
        }
        // Convert to JSON
        String json = new Gson().toJson(Doctor.all());

        // Send JSON response
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if(req.getParameter("id") == null)
        {
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
        resp.sendRedirect("admin/doctor/doctors.jsp");
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
