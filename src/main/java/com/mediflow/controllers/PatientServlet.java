package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.models.Doctor;
import com.mediflow.models.Patient;
import com.mediflow.models.Secretary;
import com.mediflow.utils.Hibernate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "PatientServlet", urlPatterns = "/patient-servlet")
public class PatientServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if(req.getParameter("id")!=null){
            req.getSession().setAttribute("patient", Hibernate.get(Patient.class, Integer.parseInt(req.getParameter("id"))));
            resp.sendRedirect(req.getSession().getAttribute("role").toString().toLowerCase()+"/patient/updatePatient.jsp");
            return;
        }
        // Convert to JSON
        String json = new Gson().toJson(Hibernate.all(Patient.class));

        // Send JSON response
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if(req.getParameter("id") == null)
        {
            Hibernate.create(new Patient(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim()
            ));
        } else if(req.getParameter("id") != null )
        {
            if(req.getParameter("cin") == null){
                Hibernate.delete(Patient.class, Integer.parseInt(req.getParameter("id")));
            } else {
                Hibernate.update(new Patient(
                        Integer.parseInt(req.getParameter("id").trim()),
                        req.getParameter("cin").trim(),
                        req.getParameter("firstName").trim(),
                        req.getParameter("lastName").trim(),
                        req.getParameter("email").trim(),
                        req.getParameter("phone").trim()
                ));
            }
        }
        resp.sendRedirect(req.getSession().getAttribute("role").toString().toLowerCase()+"/patient/patients.jsp");
    }
}
