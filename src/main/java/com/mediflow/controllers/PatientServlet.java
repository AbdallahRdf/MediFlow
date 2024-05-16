package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.models.Doctor;
import com.mediflow.models.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "PatientServlet", urlPatterns = "/patient-servlet")
public class PatientServlet extends HttpServlet {

    private String method;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        method = req.getParameter("method");

        if (method == null || method.equals(HttpCustomVerbs.GET.toString())) {
            doGet(req, resp);
        } else if (method.equals(HttpCustomVerbs.DELETE.toString())){
            doDelete(req, resp);
        } else {
            doPost(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if(method == null){
            // Convert to JSON
            /*String json = new Gson().toJson(Patient.all());

            // Send JSON response
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);*/
            req.getSession().setAttribute("patients", Patient.all());
            resp.sendRedirect("common/patient/appointments.jsp");
        } else {
            req.getSession().setAttribute("patient", Patient.get((req.getParameter("cin"))));
            resp.sendRedirect("common/patient/updateAppointment.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if(method.equals(HttpCustomVerbs.CREATE.toString()))
        {
            Patient.create(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim()
            );
        } else if(method.equals(HttpCustomVerbs.UPDATE.toString()))
        {
            Patient.update(
                    Integer.parseInt(req.getParameter("id").trim()),
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim()
            );
        }
        method = null;
        doGet(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Patient.delete(Integer.parseInt(req.getParameter("id")));
        method = null;
        doGet(req, resp);
    }
}
