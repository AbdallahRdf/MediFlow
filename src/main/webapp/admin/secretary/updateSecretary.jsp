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
    <link href="../../assets/libs/gridjs/theme/mermaid.min.css" rel="stylesheet" type="text/css" >

    <!-- App css -->
    <link href="../../assets/css/app.min.css" rel="stylesheet" type="text/css">

    <!-- Icons css -->
    <link href="../../assets/css/icons.min.css" rel="stylesheet" type="text/css">

    <!-- Theme Config Js -->
    <script src="../../assets/js/config.js"></script>
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
                            <a href="updateSecretary.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Modify Secretary</a>
                        </div>
                    </div>
                </div>
                <!-- Page Title End -->

                <div class="grid lg:grid-cols-2 grid-cols-1 gap-6">
                    <div class="col-span-2">
                        <div class="card">
                            <div class="card-header">
                                <div class="flex items-center">
                                    <h4 class="card-title ms-2">Modify Secretary</h4>
                                </div>
                            </div>

                            <div class="p-6">
                                <form method="post" action="/secretary-servlet">
                                    <% Map<String, String> errors = (Map<String, String>) session.getAttribute("errors"); %>

                                    <input type="hidden" name="id" value="<%= session.getAttribute("id")%>">
                                    <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
                                        <div>
                                            <label for="input1" class="text-gray-800 text-sm font-medium inline-block mb-2">First name</label>
                                            <input name="firstName" value="<%= session.getAttribute("firstName")%>" type="text" class="form-input" id="input1" placeholder="First name">
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("firstName") ? errors.get("firstName") : "" %>
                                            </span>
                                        </div>
                                        <div>
                                            <label for="input2" class="text-gray-800 text-sm font-medium inline-block mb-2">Last name</label>
                                            <input name="lastName" value="<%= session.getAttribute("lastName")%>" type="text" class="form-input" id="input2" placeholder="Last name">
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("lastName") ? errors.get("lastName") : "" %>
                                            </span>
                                        </div>

                                          <div>
                                            <label for="input3" class="text-gray-800 text-sm font-medium inline-block mb-2">CIN</label>
                                            <input name="cin" value="<%= session.getAttribute("cin")%>" type="text" class="form-input" id="input3" placeholder="CIN">
                                              <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("cin") ? errors.get("cin") : "" %>
                                            </span>
                                          </div>

                                        <div>
                                            <label for="input4" class="text-gray-800 text-sm font-medium inline-block mb-2">Email</label>
                                            <input name="email" value="<%= session.getAttribute("email")%>" type="email" class="form-input" id="input4" placeholder="Email">
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("email") ? errors.get("email") : "" %>
                                            </span>
                                        </div>

                                        <div>
                                            <label for="input5" class="text-gray-800 text-sm font-medium inline-block mb-2">Telephone</label>
                                            <input name="phone" value="<%= session.getAttribute("phone")%>" type="number" class="form-input" id="input5" placeholder="Telephone">
                                            <span class="text-red-500 text-sm">
                                                <%= errors != null && errors.containsKey("phone") ? errors.get("phone") : "" %>
                                            </span>
                                        </div>

                                    </div>

                                    <button type="submit" class="btn bg-success text-white mt-5">Modify Secretary</button>
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

    <!-- Back to Top Button -->
    <button data-toggle="back-to-top" class="fixed hidden h-10 w-10 items-center justify-center rounded-full z-10 bottom-20 end-14 p-2.5 bg-primary cursor-pointer shadow-lg text-white">
        <i class="mgc_arrow_up_line text-lg"></i>
    </button>


    <!-- Plugin Js -->
    <script src="../../assets/libs/simplebar/simplebar.min.js"></script>
    <script src="../../assets/libs/feather-icons/feather.min.js"></script>
    <script src="../../assets/libs/%40frostui/tailwindcss/frostui.js"></script>

    <!-- App Js -->
    <script src="../../assets/js/app.js"></script>

    <!-- Gridjs Plugin js -->
    <script src="../../assets/libs/gridjs/gridjs.umd.js"></script>


</body>
</html>