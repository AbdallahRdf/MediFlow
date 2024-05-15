<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mediflow.models.Patient" %><%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 14/05/2024
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../../component/authenticationCheck.jsp"  %>
<html>
<head>
    <title>MediFlow | Patients page</title>
</head>
<body>
    <a href="addPatient.jsp">Add New Patient</a>
    <%
        ArrayList<Patient> patients = (ArrayList<Patient>)session.getAttribute("patients");
        if(patients == null){
            out.println("<p>No patients to show</p>");
        } else {
            for(Patient patient: patients){
                out.println("<p>" + patient.getCIN() + "</p>");
                out.println("<p>" + patient.getFirstName() + "</p>");
                out.println("<p>" + patient.getLastName() + "</p>");
                out.println("<p>" + patient.getEmail() + "</p>");
                out.println("<p>" + patient.getPhone() + "</p>");
                out.println("<form action='/patient-servlet' method='post'>");
                out.println("<input type='hidden' name='method' value='update'>");
                out.println("<input type='hidden' name='cin' value=" + patient.getCIN() + ">");
                out.println("<input type='submit' value='submit'>");
                out.println("</form><br>");
            }
        }
    %>
</body>
</html>
