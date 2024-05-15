<%@ page import="com.mediflow.models.Patient" %>
<%@ page import="com.mediflow.enums.HttpCustomVerbs" %><%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 15/05/2024
  Time: 00:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../component/authenticationCheck.jsp"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% Patient patient = (Patient)session.getAttribute("patient"); %>
<form action="/patient-servlet" method="post">
    <input type="hidden" name="method" value="<%=HttpCustomVerbs.UPDATE.toString()%>">
    <input type="hidden" name="id" value="<%= patient.getID() %>">
    <input type="text" name="cin" value="<%= patient.getCIN() %>">
    <input type="text" name="firstName" value="<%= patient.getFirstName() %>">
    <input type="text" name="lastName" value="<%= patient.getLastName() %>">
    <input type="email" name="email" value="<%= patient.getEmail() %>">
    <input type="tel" name="phone" value="<%= patient.getPhone() %>">
    <input type="submit">
</form>
</body>
</html>
