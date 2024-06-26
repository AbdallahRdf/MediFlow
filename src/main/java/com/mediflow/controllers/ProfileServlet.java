package com.mediflow.controllers;

import com.mediflow.enums.Role;
import com.mediflow.models.Admin;
import com.mediflow.models.Login;
import com.mediflow.models.Secretary;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = "/profile-servlet")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        String username = session.getAttribute("username").toString();
        if(session.getAttribute("role").equals(Role.ADMIN.toString())){
            Admin admin = Admin.getByLogginID(Login.getByUsername(username));
            setSessionVariablesForProfile(session, admin.getID(), admin.getCIN(), admin.getFirstName(), admin.getLastName(), admin.getEmail(), admin.getPhone());
        } else if(session.getAttribute("role").equals(Role.SECRETARY.toString())){
            Secretary secretary = Secretary.getByLogginID(Login.getByUsername(username));
            setSessionVariablesForProfile(session, secretary.getID(), secretary.getCIN(), secretary.getFirstName(), secretary.getLastName(), secretary.getEmail(), secretary.getPhone());
        }
        resp.sendRedirect(req.getSession().getAttribute("role").toString().toLowerCase() + "/profile/profile.jsp" );
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String role = req.getSession().getAttribute("role").toString();
        int id = Integer.parseInt(req.getParameter("id"));
        String cin = req.getParameter("cin").trim();
        String firstName = req.getParameter("firstName").trim();
        String lastName = req.getParameter("lastName").trim();
        String email = req.getParameter("email").trim();
        String phone = req.getParameter("phone").trim();
        String username = req.getParameter("username").trim();
        if(role.equals(Role.ADMIN.toString())){
            Admin.update(id, cin, firstName, lastName, email, phone, username);
        } else if(role.equals(Role.SECRETARY.toString())) {
            Secretary.update(id, cin, firstName, lastName, email, phone, username);
        }
        req.getSession().setAttribute("username", username);
        doGet(req, resp);
    }

    public static void setSessionVariablesForProfile(HttpSession session, int id, String cin, String firstName, String lastName, String email, String phone){
        session.setAttribute("id", id);
        session.setAttribute("firstName", firstName);
        session.setAttribute("lastName", lastName);
        session.setAttribute("cin", cin);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
    }
}
