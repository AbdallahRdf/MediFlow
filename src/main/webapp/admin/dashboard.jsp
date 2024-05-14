<%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 14/05/2024
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../component/adminAuthenticationCheck.jsp"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Welcome Admin</h1>
    <div>
        <p>Appointments count: <%= session.getAttribute("appointmentsCount") %></p>
        <p>Doctors count: <%= session.getAttribute("doctorsCount") %></p>
        <p>Patients count: <%= session.getAttribute("patientsCount") %></p>
        <p>Secretaries count: <%= session.getAttribute("secretariesCount") %></p>
    </div>
    <div>
        <a href="/patient-servlet">Patient page</a>
    </div>
</body>
</html>
