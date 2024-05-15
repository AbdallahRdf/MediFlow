package com.mediflow.filters;

import com.mediflow.utils.Validator;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/patient-servlet")
public class PatientFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        String cin = servletRequest.getParameter("cin");
        String firstName = servletRequest.getParameter("firstName");
        String lastName = servletRequest.getParameter("lastName");
        String email = servletRequest.getParameter("email");
        String phone = servletRequest.getParameter("phone");
        String method = servletRequest.getParameter("method");

        if(method == null){
            filterChain.doFilter(servletRequest, servletResponse);
        }
        else if(method.equals("create"))
        {
            if(Validator.isPersonInfoValid(cin, firstName, lastName, email, phone)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                ((HttpServletResponse)servletResponse).sendRedirect("common/patient/addPatient.jsp");
            }
        }
        else if(method.equals("update") && servletRequest.getParameter("id") != null)
        {
            if(Validator.isPersonInfoValid(cin, firstName, lastName, email, phone)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                ((HttpServletResponse)servletResponse).sendRedirect("common/patient/updatePatient.jsp");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
