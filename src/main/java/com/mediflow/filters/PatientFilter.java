package com.mediflow.filters;

import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.utils.Validator;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/patient-servlet")
public class PatientFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String method = servletRequest.getParameter("method");

        if(method == null || method.equals(HttpCustomVerbs.GET.toString()) || method.equals(HttpCustomVerbs.DELETE.toString())){
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            String cin = servletRequest.getParameter("cin");
            String firstName = servletRequest.getParameter("firstName");
            String lastName = servletRequest.getParameter("lastName");
            String email = servletRequest.getParameter("email");
            String phone = servletRequest.getParameter("phone");

            if(method.equals(HttpCustomVerbs.CREATE.toString()) || method.equals(HttpCustomVerbs.UPDATE.toString()))
            {
                if(Validator.isPersonInfoValid(cin, firstName, lastName, email, phone)) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else if (method.equals(HttpCustomVerbs.CREATE.toString())) {
                    ((HttpServletResponse)servletResponse).sendRedirect("common/patient/addAppointment.jsp");
                } else {
                    ((HttpServletResponse)servletResponse).sendRedirect("common/patient/updateAppointment.jsp");
                }
            }
        }
    }
}
