<%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 14/05/2024
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../component/authenticationCheck.jsp"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Welcome Admin</h1>
    <div>
        <p>Appointments count: <%= request.getAttribute("appointmentsCount") %></p>
        <p>Doctors count: <%= request.getAttribute("doctorsCount") %></p>
        <p>Patients count: <%= request.getAttribute("patientsCount") %></p>
        <p>Secretaries count: <%= request.getAttribute("secretariesCount") %></p>
    </div>
</body>
</html>
