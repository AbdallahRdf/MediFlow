package com.mediflow.controllers;

import com.google.gson.Gson;

import com.mediflow.models.Login;
import com.mediflow.models.Secretary;
import com.mediflow.utils.Encryptor;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SecretaryServlet", urlPatterns = "/secretary-servlet")
public class SecretaryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if(req.getParameter("id")!=null){
            Secretary secretary=Secretary.get(Integer.parseInt(req.getParameter("id")));
            req.getSession().setAttribute("id",secretary.getID());
            req.getSession().setAttribute("firstName",secretary.getFirstName());
            req.getSession().setAttribute("lastName",secretary.getLastName());
            req.getSession().setAttribute("cin",secretary.getCIN());
            req.getSession().setAttribute("email",secretary.getEmail());
            req.getSession().setAttribute("phone",secretary.getPhone());
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if(req.getParameter("id") == null)
        {
            Secretary.create(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim()
            );
            String password = Encryptor.encryptPassword(req.getParameter("cin").trim());
            int loginId=Login.create(req.getParameter("lastName").trim() + "@" + req.getParameter("firstName") ,password,"Secretary");
            Secretary.addLoginID(loginId,req.getParameter("cin").trim());
        } else if(req.getParameter("id") != null )
        {
            if(req.getParameter("cin") == null){
                int id = Integer.parseInt(req.getParameter("id"));
                Secretary secretary = Secretary.get(id);
                Secretary.delete(id);
                Login.delete(secretary.getLoginID());
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
