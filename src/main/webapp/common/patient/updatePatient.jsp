<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.mediflow.models.Patient" %>
<%@ page import="com.mediflow.enums.HttpCustomVerbs" %>
<%@ include file="../../component/authenticationCheck.jsp"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Patients | MediFlow - Hospital Appointment System</title>
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
                            <a href="patients.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400">Patients</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="updatePatient.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Modify Patient</a>
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
                                    <h4 class="card-title ms-2">Modify Patient</h4>
                                </div>
                            </div>

                            <div class="p-6">
                                <% Patient patient =  (Patient)session.getAttribute("patient"); %>

                                <form action="/patient-servlet" method="post">
                                    <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
                                        <input type="hidden" name="id" value="<%= patient.getID() %>">
                                        <div>
                                            <label for="input1" class="text-gray-800 text-sm font-medium inline-block mb-2">First name</label>
                                            <input value="<%= patient.getFirstName() %>" name="firstName" type="text" class="form-input" id="input1" placeholder="First name" >
                                        </div>
                                        <div>
                                            <label for="input2" class="text-gray-800 text-sm font-medium inline-block mb-2">Last name</label>
                                            <input value="<%= patient.getLastName() %>" name="lastName" type="text" class="form-input" id="input2" placeholder="Last name" >
                                        </div>

                                          <div>
                                            <label for="input3" class="text-gray-800 text-sm font-medium inline-block mb-2">CIN</label>
                                            <input value="<%= patient.getCIN() %>" name="cin" type="text" class="form-input" id="input3" placeholder="CIN" >
                                        </div>

                                        <div>
                                            <label for="input4" class="text-gray-800 text-sm font-medium inline-block mb-2">Email</label>
                                            <input value="<%= patient.getEmail() %>" name="email" type="email" class="form-input" id="input4" placeholder="Email" >
                                        </div>

                                        <div>
                                            <label for="input5" class="text-gray-800 text-sm font-medium inline-block mb-2">Telephone</label>
                                            <input value="<%= patient.getPhone() %>" name="phone" type="number" class="form-input" id="input5" placeholder="Telephone">
                                        </div>

                                    </div>

                                    <button type="submit" class="btn bg-success text-white mt-5">Modify Patient</button>
                                </form>
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