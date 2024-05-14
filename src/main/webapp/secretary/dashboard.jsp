<%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 14/05/2024
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../component/secretaryAuthenticationCheck.jsp"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Welcome Secretary</h1>
    <p>Appointments count: <%= session.getAttribute("appointmentsCount") %></p>
    <p>Doctors count: <%= session.getAttribute("doctorsCount") %></p>

    <a href="patient-servlet">Patient page</a>

</body>
</html>
