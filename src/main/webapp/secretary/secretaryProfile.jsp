<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../component/secretaryAuthenticationCheck.jsp"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Secretaries | MediFlow - Hospital Appointment System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="coderthemes" name="author">

    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- Gridjs Plugin css -->
    <link href="../assets/libs/gridjs/theme/mermaid.min.css" rel="stylesheet" type="text/css" >

    <!-- App css -->
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css">

    <!-- Icons css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css">

    <!-- Theme Config Js -->
    <script src="../assets/js/config.js"></script>
</head>

<body>
            <%@include file="/component/secretarySidebar.jsp"%>
            <%@include file="/component/header.jsp"%>

            <main class="flex-grow p-6">

                <!-- Page Title Start -->
                <div class="flex justify-between items-center mb-6">
                    <h4 class="text-slate-900 dark:text-slate-200 text-lg font-medium">Profile Settings</h4>

                    <div class="md:flex hidden items-center gap-2.5 text-sm font-semibold">
                        <div class="flex items-center gap-2">
                            <a href="index.html" class="text-sm font-medium text-slate-700 dark:text-slate-400">MediFlow</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="#" class="text-sm font-medium text-slate-700 dark:text-slate-400">Menu</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="profile.html" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Profile Settings</a>
                        </div>
                    </div>
                </div>
                <!-- Page Title End -->

                <div class="grid lg:grid-cols-2 grid-cols-1 gap-6">
                    <div class="col-span-2">
                        <div class="card">
                            <div class="card-header">
                                <div class="flex items-center">
                                    <h4 class="card-title">Personal details</h4>
                                </div>
                            </div>

                            <div class="p-6">
                                <form>
                                    <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
                                        <div>
                                            <label for="input1" class="text-gray-800 text-sm font-medium inline-block mb-2">First name</label>
                                            <input type="text" class="form-input" id="input1" placeholder="First name">
                                        </div>
                                        <div>
                                            <label for="input2" class="text-gray-800 text-sm font-medium inline-block mb-2">Last name</label>
                                            <input type="text" class="form-input" id="input2" placeholder="Last name">
                                        </div>

                                          <div>
                                            <label for="input3" class="text-gray-800 text-sm font-medium inline-block mb-2">CIN</label>
                                            <input type="email" class="form-input" id="input3" placeholder="CIN">
                                        </div>

                                        <div>
                                            <label for="input4" class="text-gray-800 text-sm font-medium inline-block mb-2">Email</label>
                                            <input type="email" class="form-input" id="input4" placeholder="Email">
                                        </div>

                                        <div>
                                            <label for="input5" class="text-gray-800 text-sm font-medium inline-block mb-2">Telephone</label>
                                            <input type="number" class="form-input" id="input5" placeholder="Telephone">
                                        </div>

                                    </div>

                                    <button type="submit" class="btn bg-success text-white mt-5">Modify general Informations</button>
                                </form>

                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>

                <div class="grid lg:grid-cols-2 grid-cols-1 gap-6 mt-8">
                    <div class="col-span-2">
                        <div class="card">
                            <div class="card-header">
                                <div class="flex items-center">
                                    <h4 class="card-title">Password and security</h4>
                                </div>
                            </div>

                            <div class="p-6">
                                <form>
                                    <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
                                        <div>
                                            <label for="input1" class="text-gray-800 text-sm font-medium inline-block mb-2">Username</label>
                                            <input type="text" class="form-input" id="input1" placeholder="Username">
                                        </div>

                                          <div>
                                            <label for="input3" class="text-gray-800 text-sm font-medium inline-block mb-2">Password</label>
                                            <input type="password" class="form-input" id="input3" placeholder="Password">
                                        </div>
                                    </div>

                                    <button type="submit" class="btn bg-success text-white mt-5">Modify security informations</button>
                                </form>

                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>


            </main>


        <%@include file="/component/footer.jsp"%>
        <%@include file="/component/js/scripts.jsp"%>

    <!-- Back to Top Button -->
    <button data-toggle="back-to-top" class="fixed hidden h-10 w-10 items-center justify-center rounded-full z-10 bottom-20 end-14 p-2.5 bg-primary cursor-pointer shadow-lg text-white">
        <i class="mgc_arrow_up_line text-lg"></i>
    </button>


    <!-- Plugin Js -->
    <script src="../assets/libs/simplebar/simplebar.min.js"></script>
    <script src="../assets/libs/feather-icons/feather.min.js"></script>
    <script src="../assets/libs/%40frostui/tailwindcss/frostui.js"></script>

    <!-- App Js -->
    <script src="../assets/js/app.js"></script>

    <!-- Gridjs Plugin js -->
    <script src="../assets/libs/gridjs/gridjs.umd.js"></script>


</body>


<!-- Mirrored from coderthemes.com/MediFlow/layouts/tables-datatables.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 14:55:55 GMT -->
</html>