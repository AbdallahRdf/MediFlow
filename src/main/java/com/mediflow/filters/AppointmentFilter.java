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
            System.out.println(servletRequest.getParameter("time"));
            System.out.println(servletRequest.getParameter("date"));
            if(Validator.isAppointmentValid(
                    servletRequest.getParameter("patient_id"),
                    servletRequest.getParameter("doctor_id"),
                    servletRequest.getParameter("date"),
                    servletRequest.getParameter("time"),
                    servletRequest.getParameter("room")
            )) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                String folder = ((HttpServletRequest)servletRequest).getSession().getAttribute("role").toString().toLowerCase();
                if(servletRequest.getParameter("id") == null){
                    ((HttpServletResponse)servletResponse).sendRedirect(folder + "/appointment/addAppointment.jsp");
                } else {
                    ((HttpServletResponse)servletResponse).sendRedirect(folder + "/appointment/addAppointment.jsp");
                }
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
