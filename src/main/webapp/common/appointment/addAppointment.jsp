<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mediflow.models.Doctor" %>
<%@ page import="com.mediflow.models.Patient" %>
<%@ page import="com.mediflow.enums.Room" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../../component/authenticationCheck.jsp"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Appointments | MediFlow - Hospital Appointment System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="coderthemes" name="author">

    <!-- App favicon -->
    <link rel="shortcut icon" href="../../assets/images/favicon.ico">

    <!-- Gridjs Plugin css -->
    <link href="${pageContext.request.contextPath}/assets/libs/gridjs/theme/mermaid.min.css" rel="stylesheet" type="text/css" >

    <!-- App css -->
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css">

    <!-- Icons css -->
    <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css">

    <!-- Theme Config Js -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
</head>

<body>

    <!-- Include admin or secretary sidebar based on role -->
              <%
                  if (request.getSession().getAttribute("role").equals(Role.ADMIN.toString())) {
                      %><%@include file="/component/adminSidebar.jsp"%><%
                  } else if (request.getSession().getAttribute("role").equals(Role.SECRETARY.toString())) {
                      %><%@include file="/component/secretarySidebar.jsp"%><%
                  }
              %>

       <%@include file="../../component/header.jsp"%>

            <main class="flex-grow p-6">

                <!-- Page Title Start -->
                <div class="flex justify-between items-center mb-6">
                    <h4 class="text-slate-900 dark:text-slate-200 text-lg font-medium"></h4>

                    <div class="md:flex hidden items-center gap-2.5 text-sm font-semibold">
                        <div class="flex items-center gap-2">
                            <a href="../dashboard.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400">MediFlow</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="#" class="text-sm font-medium text-slate-700 dark:text-slate-400">Menu</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="appointments.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400">Appointments</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="addAppointment.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Add New Appointment</a>
                        </div>
                    </div>
                </div>
                <!-- Page Title End -->

                <div class="grid lg:grid-cols-2 grid-cols-1 gap-6">
                    <div class="col-span-2">
                        <div class="card">
                            <div class="card-header">
                                <div class="flex items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg>
                                    <h4 class="card-title ms-2">Add New Appointment</h4>
                                </div>
                            </div>

                            <div class="p-6">
                                <form method="post" action="/appointment-servlet">
                                    <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
                                        <div>
                                            <label for="example-select" class="text-gray-800 text-sm font-medium inline-block mb-2">Select doctor</label>
                                            <select class="form-select" id="example-select" name="doctor_id" required>
                                                <option name="doctor_id" value="" selected disabled>-- select doctor</option>
                                                <%
                                                    ArrayList<Doctor> doctors = (ArrayList<Doctor>)session.getAttribute("doctors");
                                                    for(Doctor doctor : doctors){
                                                        out.println("<option value="+doctor.getID()+">"+doctor.getFirstName()+" "+doctor.getLastName()+"</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="example-select2" class="text-gray-800 text-sm font-medium inline-block mb-2">Select Patient</label>
                                            <select name="patient_id" class="form-select" id="example-select2" required>
                                                <option value="" selected disabled>-- select patient</option>
                                                <%
                                                    ArrayList<Patient> patients = (ArrayList<Patient>)session.getAttribute("patients");
                                                    for(Patient patient : patients){
                                                        out.println("<option value="+patient.getID()+">"+patient.getFirstName()+" "+patient.getLastName()+"</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="input1" class="text-gray-800 text-sm font-medium inline-block mb-2">Date</label>
                                            <input name="date" type="date" class="form-input" id="input1"required>
                                        </div>
                                        <div>
                                            <label for="input2" class="text-gray-800 text-sm font-medium inline-block mb-2">Time</label>
                                            <input name="time" type="time" class="form-input" id="input2" placeholder="Last name" required>
                                        </div>
                                        <div>
                                            <label for="example-select" class="text-gray-800 text-sm font-medium inline-block mb-2">Select Room</label>
                                            <select name="room" class="form-select" id="example-select" required>
                                                <option value="" selected disabled>Room</option>
                                                <%
                                                    for(Room room : Room.values()){
                                                        out.println("<option value="+room.toString()+">"+room.toString()+"</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn bg-success text-white mt-5">Add Appointment</button>
                                </form>
                                <div id="GridFormHtml" class="hidden w-full overflow-hidden transition-[height] duration-300">
                                    <pre class="language-html h-56">
                                        <code>
                                            &lt;form&gt;
                                                &lt;div class=&quot;grid grid-cols-1 md:grid-cols-2  gap-6&quot;&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputEmail4&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Email&lt;/label&gt;
                                                        &lt;input type=&quot;email&quot; class=&quot;form-input&quot; id=&quot;inputEmail4&quot; placeholder=&quot;Email&quot;&gt;
                                                    &lt;/div&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputPassword4&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Password&lt;/label&gt;
                                                        &lt;input type=&quot;password&quot; class=&quot;form-input&quot; id=&quot;inputPassword4&quot; placeholder=&quot;Password&quot;&gt;
                                                    &lt;/div&gt;

                                                    &lt;div class=&quot;lg:col-span-2&quot;&gt;
                                                        &lt;label for=&quot;inputAddress&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Address&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputAddress&quot; placeholder=&quot;1234 Main St&quot;&gt;
                                                    &lt;/div&gt;

                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputAddress2&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Address 2&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputAddress2&quot; placeholder=&quot;Apartment, studio, or floor&quot;&gt;
                                                    &lt;/div&gt;

                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputCity&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;City&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputCity&quot;&gt;
                                                    &lt;/div&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputState&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;State&lt;/label&gt;
                                                        &lt;select id=&quot;inputState&quot; class=&quot;form-select&quot;&gt;
                                                            &lt;option&gt;Choose&lt;/option&gt;
                                                            &lt;option&gt;Option 1&lt;/option&gt;
                                                            &lt;option&gt;Option 2&lt;/option&gt;
                                                            &lt;option&gt;Option 3&lt;/option&gt;
                                                        &lt;/select&gt;
                                                    &lt;/div&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputZip&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Zip&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputZip&quot;&gt;
                                                    &lt;/div&gt;
                                                &lt;/div&gt;

                                                &lt;div class=&quot;flex items-center gap-2 my-3&quot;&gt;
                                                    &lt;input type=&quot;checkbox&quot; class=&quot;form-checkbox rounded border border-gray-200&quot; id=&quot;customCheck11&quot;&gt;
                                                    &lt;label class=&quot;text-gray-800 text-sm font-medium inline-block&quot; for=&quot;customCheck11&quot;&gt;Check this custom checkbox !&lt;/label&gt;
                                                &lt;/div&gt;

                                                &lt;button type=&quot;submit&quot; class=&quot;btn bg-primary text-white&quot;&gt;Sign in&lt;/button&gt;
                                            &lt;/form&gt;
                                        </code>
                                    </pre>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>


            </main>


           <%@include file="../../component/footer.jsp"%>


    <%@include file="../../component/js/scripts.jsp"%>

    <!-- Gridjs Plugin js -->
    <script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.umd.js"></script>


</body>
</html>