package com.mediflow.controllers;

import com.mediflow.models.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "PatientServlet", urlPatterns = "/patient-servlet")
public class PatientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("patients", Patient.all());
        resp.sendRedirect("common/patient/patients.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("method").equals("create"))
        {
            Patient.create(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim()
            );
        } else if(req.getParameter("method").equals("update"))
        {
            if(req.getParameter("id") == null){
                req.getSession().setAttribute("patient", Patient.get((req.getParameter("cin"))));
                resp.sendRedirect("common/patient/updatePatient.jsp");
                return;
            } else {
                Patient.update(
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
    }
}
