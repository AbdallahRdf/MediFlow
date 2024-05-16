package com.mediflow.controllers;

import com.google.gson.Gson;
import com.mediflow.models.Secretary;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SecretaryServlet", urlPatterns = "/secretary-servlet")
public class SecretaryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get request");
        if(req.getParameter("id")!=null){
            req.setAttribute("secretary", Secretary.get(Integer.parseInt(req.getParameter("id"))));
            resp.sendRedirect("admin/secretary/updateSecretary.jsp");
            return;
        }
        // Convert to JSON
        String json = new Gson().toJson(Secretary.all());

        // Send JSON response
        System.out.println("get request");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        resp.sendRedirect("admin/secretary/secretaries.jsp");
    }



}
