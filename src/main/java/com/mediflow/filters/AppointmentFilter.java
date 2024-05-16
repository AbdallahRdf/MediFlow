package com.mediflow.filters;

import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.utils.Validator;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/appointment-servlet")
public class AppointmentFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if(
                ((HttpServletRequest)servletRequest).getMethod().equals(HttpCustomVerbs.POST.toString()) &&
                        (
                                servletRequest.getParameter("id") == null ||
                                        (servletRequest.getParameter("id") != null && servletRequest.getParameter("cin") != null)
                        )
        ){
            if(Validator.isAppointmentValid(
                    servletRequest.getParameter("patient_id").trim(),
                    servletRequest.getParameter("doctor_id").trim(),
                    servletRequest.getParameter("room").trim()
            )) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                if(servletRequest.getParameter("id") == null){
                    ((HttpServletResponse)servletResponse).sendRedirect(((HttpServletRequest)servletRequest).getSession().getAttribute("role")+"/appointment/addAppointment.jsp");
                } else {
                    ((HttpServletResponse)servletResponse).sendRedirect(((HttpServletRequest)servletRequest).getSession().getAttribute("role")+"/appointment/addAppointment.jsp");
                }
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
