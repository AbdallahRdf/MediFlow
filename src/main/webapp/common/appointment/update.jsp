<%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 16/05/2024
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% Appointment appointment =  (Appointment)session.getAttribute("appointment"); %>
<form>
    <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
        <div>
            <label for="example-select1" class="text-gray-800 text-sm font-medium inline-block mb-2">Select doctor</label>
            <select class="form-select" id="example-select1" required>
                <%
                    for(Doctor doctor : (ArrayList<Doctor>)session.getAttribute("doctors")){
                        String selceted = (appointment.getDoctor().getID() == doctor.getID()) ? "selected" : "";
                        out.println("<option " + selceted + " value="+doctor.getID()+">"+doctor.getFirstName()+" "+doctor.getLastName()+"</option>");
                    }
                %>
            </select>
        </div>
        <div>
            <label for="example-select2" class="text-gray-800 text-sm font-medium inline-block mb-2">Select Patient</label>
            <select class="form-select" id="example-select2" required>
                <%
                    for(Patient patient : (ArrayList<Patient>)session.getAttribute("patients")){
                        String selceted = (appointment.getPatient().getID() == patient.getID()) ? "selected" : "";
                        out.println("<option " + selceted + " value="+patient.getID()+">"+patient.getFirstName()+" "+patient.getLastName()+"</option>");
                    }
                %>
            </select>
        </div>
        <div>
            <label for="input1" class="text-gray-800 text-sm font-medium inline-block mb-2">Date</label>
            <input type="date" class="form-input" id="input1" value="<%=appointment.getDate().getTime()%>" required>
        </div>
        <div>
            <label for="input2" class="text-gray-800 text-sm font-medium inline-block mb-2">Time</label>
            <input type="time" class="form-input" id="input2" value="<%=appointment.getTime().toString()%>" required>
        </div>
        <div>
            <label for="example-select3" class="text-gray-800 text-sm font-medium inline-block mb-2">Select Room</label>
            <select class="form-select" id="example-select3" required>
                <%
                    for(Room room : Room.values()){
                        String selceted = (appointment.getRoom() == room) ? "selected" : "";
                        out.println("<option " + selceted + " value="+room.toString()+">"+room.toString()+"</option>");
                    }
                %>
            </select>
        </div>
        <div>
            <label for="example-select" class="text-gray-800 text-sm font-medium inline-block mb-2">Select Status</label>
            <select class="form-select" id="example-select" required>
                <%
                    for(AppointmentStatus status : AppointmentStatus.values()){
                        String selceted = (appointment.getAppointmentStatus() == status) ? "selected" : "";
                        out.println("<option + " + selceted + " value="+status.toString()+">"+status.toString()+"</option>");
                    }
                %>
            </select>
        </div>
    </div>

    <button type="submit" class="btn bg-success text-white mt-5">Update Appointment</button>
</form>
</body>
</html>
