package com.mediflow.filters;

import com.mediflow.utils.Validator;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/login-servlet")
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if(((HttpServletRequest)servletRequest).getSession().getAttribute("username") == null) {
            String username = servletRequest.getParameter("username");
            String password = servletRequest.getParameter("password");
            String role = servletRequest.getParameter("role");

            if(Validator.isNullOrEmpty(username) || Validator.isNullOrEmpty(password) || Validator.isNullOrEmpty(role)){
                ((HttpServletResponse)servletResponse).sendRedirect("index.jsp");
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
