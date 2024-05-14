package com.mediflow.filters;

import com.mediflow.validation.Validator;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/loginServlet")
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        String username = servletRequest.getParameter("username");
        String password = servletRequest.getParameter("password");
        String role = servletRequest.getParameter("role");

        if(Validator.isNullOrEmpty(username) || Validator.isNullOrEmpty(password) || Validator.isNullOrEmpty(role)){
            ((HttpServletResponse)servletResponse).sendRedirect("index.jsp");
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }
}
