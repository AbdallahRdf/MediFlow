package com.mediflow.filters;

import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.utils.Validator;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/patient-servlet")
public class PatientFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if(
                ((HttpServletRequest)servletRequest).getMethod().equals(HttpCustomVerbs.POST.toString()) &&
                        (
                                servletRequest.getParameter("id") == null ||
                                        (servletRequest.getParameter("id") != null && servletRequest.getParameter("cin") != null)
                        )
        ){
            if(Validator.isPersonInfoValid(
                    servletRequest.getParameter("cin"),
                    servletRequest.getParameter("firstName"),
                    servletRequest.getParameter("lastName"),
                    servletRequest.getParameter("email"),
                    servletRequest.getParameter("phone")
            )) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                if(servletRequest.getParameter("id") == null){
                    ((HttpServletResponse)servletResponse).sendRedirect(((HttpServletRequest)servletRequest).getSession().getAttribute("role").toString().toLowerCase()+"/patient/addPatient.jsp");
                } else {
                    ((HttpServletResponse)servletResponse).sendRedirect(((HttpServletRequest)servletRequest).getSession().getAttribute("role").toString().toLowerCase()+"/patient/updatePatient.jsp");
                }
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
