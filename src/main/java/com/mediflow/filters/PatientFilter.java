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
        if(
                servletRequest.getParameter("method") == null ||
                (Validator.isCINValid(servletRequest.getParameter("cin").trim()) &&
                Validator.isNameValid(servletRequest.getParameter("firstName").trim()) &&
                Validator.isNameValid(servletRequest.getParameter("lastName").trim()) &&
                Validator.isEmailValid(servletRequest.getParameter("email").trim()) &&
                Validator.isPhoneNumberValid(servletRequest.getParameter("phone").trim()))
        ){
            filterChain.doFilter(servletRequest, servletResponse);
        }
        else
        {
            ((HttpServletResponse)servletResponse).sendRedirect("common/patient/addPatient.jsp");
        }
    }
}
