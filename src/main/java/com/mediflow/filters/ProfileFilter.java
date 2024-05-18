package com.mediflow.filters;

import com.mediflow.enums.HttpCustomVerbs;
import com.mediflow.utils.Validator;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/profile-servlet")
public class ProfileFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String role = ((HttpServletRequest) servletRequest).getSession().getAttribute("role").toString().toLowerCase();

        if(((HttpServletRequest)servletRequest).getMethod().equals(HttpCustomVerbs.POST.toString())){
            String cin = servletRequest.getParameter("cin");
            String firstName = servletRequest.getParameter("firstName");
            String lastName = servletRequest.getParameter("lastName");
            String email = servletRequest.getParameter("email");
            String phone = servletRequest.getParameter("phone");
            if(Validator.isPersonInfoValid(cin, firstName, lastName, email, phone)){
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                ((HttpServletResponse)servletResponse).sendRedirect( role + "/profile/profile.jsp");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
