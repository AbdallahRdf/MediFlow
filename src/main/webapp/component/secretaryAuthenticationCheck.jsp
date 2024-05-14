<%@ page import="com.mediflow.enums.Role" %><%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 14/05/2024
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // for HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //for HTTP 1.0
    response.setHeader("Expires", "0"); // for proxies
    if(request.getSession().getAttribute("username") == null || !request.getSession().getAttribute("role").equals(Role.SECRETARY.toString())){
        response.sendRedirect("../index.jsp");
    }
%>