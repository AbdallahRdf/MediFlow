package com.mediflow.controllers;

import com.mediflow.enums.Role;
import com.mediflow.models.Admin;
import com.mediflow.models.Login;
import com.mediflow.models.Secretary;
import com.mediflow.utils.Hibernate;
import jakarta.servlet.ServletException;
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = req.getSession().getAttribute("role").toString();
        int id = Integer.parseInt(req.getParameter("id"));
        String cin = req.getParameter("cin");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        if(role.equals(Role.ADMIN.toString())){
            Hibernate.update(new Admin(id, cin, firstName, lastName, email, phone));
        } else if(role.equals(Role.SECRETARY.toString())) {
            Hibernate.update(new Secretary(id, cin, firstName, lastName, email, phone));
        }
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
