package com.mediflow.controllers;

import com.google.gson.Gson;

import com.mediflow.enums.Role;
import com.mediflow.models.Login;
import com.mediflow.models.Secretary;
import com.mediflow.utils.Encryptor;
import com.mediflow.utils.Hibernate;
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
            Secretary secretary = Hibernate.get(Secretary.class, Integer.parseInt(req.getParameter("id")));
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
        String json = new Gson().toJson(Hibernate.all(Secretary.class));

        // Send JSON response
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        if(req.getParameter("id") == null)
        {
            Hibernate.create(new Secretary(
                    req.getParameter("cin").trim(),
                    req.getParameter("firstName").trim(),
                    req.getParameter("lastName").trim(),
                    req.getParameter("email").trim(),
                    req.getParameter("phone").trim()
            ));
            String password = Encryptor.encryptPassword(req.getParameter("cin").trim());
            String username = req.getParameter("lastName").trim() + "@" + req.getParameter("firstName");
            Hibernate.create(new Login(username ,password, Role.SECRETARY));
            Login login = Login.getByUsername(username);
            System.out.println("form the secretary servlet: " + login.getUsername());
            Secretary.updateLoginID(login, req.getParameter("cin").trim());
        } else if(req.getParameter("id") != null )
        {
            if(req.getParameter("cin") == null){
                int id = Integer.parseInt(req.getParameter("id"));
                Secretary secretary = Hibernate.get(Secretary.class, id);
                Hibernate.delete(Login.class, secretary.getLogin().getId());
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
