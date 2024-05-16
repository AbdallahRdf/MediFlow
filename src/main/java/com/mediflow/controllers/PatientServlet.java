package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.models.Doctor;
import com.mediflow.models.Patient;
import com.mediflow.models.Secretary;
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
            req.getSession().setAttribute("patient", Patient.get(Integer.parseInt(req.getParameter("id"))));
            resp.sendRedirect(req.getSession().getAttribute("role")+"/patient/updatePatient.jsp");
            return;
        }
        // Convert to JSON
            /*String json = new Gson().toJson(Patient.all());

            // Send JSON response
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);*/
        req.getSession().setAttribute("patients", Patient.all());
        resp.sendRedirect("common/patient/appointments.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println("post request");

        if(req.getParameter("id") == null)
        {
            System.out.println("create secretary");
            Secretary.create(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim()
            );
        } else if(req.getParameter("id") != null )
        {
            if(req.getParameter("cin") == null){
                Secretary.delete(Integer.parseInt(req.getParameter("id")));
            } else {
                Secretary.update(
                        Integer.parseInt(req.getParameter("id").trim()),
                        req.getParameter("cin").trim(),
                        req.getParameter("firstName").trim(),
                        req.getParameter("lastName").trim(),
                        req.getParameter("email").trim(),
                        req.getParameter("phone").trim()
                );
            }
        }
        resp.sendRedirect(req.getSession().getAttribute("role")+"/patient/patients.jsp");
    }
}
