<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mediflow.models.Patient" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../../component/authenticationCheck.jsp"  %>
<%@ include file="../../component/adminAuthenticationCheck.jsp"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Secretaries | MediFlow - Hospital Appointment System</title>
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

    <%@include file="../../component/adminSidebar.jsp"%>
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
                            <a href="secretaries.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400">Secretaries</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="addSecretary.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Add New Secretary</a>
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
                                    <h4 class="card-title ms-2">Add New Secretary</h4>
                                </div>
                            </div>

                            <div class="p-6">
                                <form method="post" action="/secretary-servlet">
                                    <% Map<String, String> errors = (Map<String, String>) session.getAttribute("errors"); %>

                                    <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
                                        <div>
                                            <label for="input1" class="text-gray-800 text-sm font-medium inline-block mb-2">First name</label>
                                            <input name="firstName" type="text" class="form-input" id="input1" placeholder="First name" required>
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("firstName") ? errors.get("firstName") : "" %>
                                            </span>
                                        </div>
                                        <div>
                                            <label for="input2" class="text-gray-800 text-sm font-medium inline-block mb-2">Last name</label>
                                            <input name="lastName" type="text" class="form-input" id="input2" placeholder="Last name" required>
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("lastName") ? errors.get("lastName") : "" %>
                                            </span>
                                        </div>

                                          <div>
                                            <label for="input3" class="text-gray-800 text-sm font-medium inline-block mb-2">CIN</label>
                                            <input name="cin" type="text" class="form-input" id="input3" placeholder="CIN" required>
                                              <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("cin") ? errors.get("cin") : "" %>
                                            </span>
                                          </div>

                                        <div>
                                            <label for="input4" class="text-gray-800 text-sm font-medium inline-block mb-2">Email</label>
                                            <input name="email" type="email" class="form-input" id="input4" placeholder="Email" required>
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("email") ? errors.get("email") : "" %>
                                            </span>
                                        </div>

                                        <div>
                                            <label for="input5" class="text-gray-800 text-sm font-medium inline-block mb-2">Telephone</label>
                                            <input name="phone" type="number" class="form-input" id="input5" placeholder="Telephone" required>
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("phone") ? errors.get("phone") : "" %>
                                            </span>
                                        </div>

                                    </div>
                                    <button type="submit" class="btn bg-success text-white mt-5">Add Secretary</button>
                                </form>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>

                <%
                    session.removeAttribute("errors");
                %>

            </main>


           <%@include file="../../component/footer.jsp"%>


    <%@include file="../../component/js/scripts.jsp"%>

    <!-- Gridjs Plugin js -->
    <script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.umd.js"></script>


</body>
</html>