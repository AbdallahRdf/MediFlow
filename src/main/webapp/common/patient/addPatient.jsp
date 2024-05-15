<%@ page import="com.mediflow.enums.HttpCustomVerbs" %><%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 14/05/2024
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../component/authenticationCheck.jsp"  %>
<html>
<head>
    <title>MediFlow | add new patient</title>
</head>
<body>
<form action="/patient-servlet" method="post">
    <input type="hidden" name="method" value="<%=HttpCustomVerbs.CREATE.toString()%>">
    <input type="text" name="cin" placeholder="CIN">
    <input type="text" name="firstName" placeholder="first name">
    <input type="text" name="lastName" placeholder="last name">
    <input type="email" name="email" placeholder="email">
    <input type="tel" name="phone" placeholder="phone">
    <input type="submit">
</form>
</body>
</html>
