<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Profile | MediFlow - Hospital Appointment System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
<%@include file="/component/adminSidebar.jsp"%>
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
                <a href="profile.html" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Profile page</a>
            </div>
        </div>
    </div>
    <!-- Page Title End -->

    <div class="grid lg:grid-cols-2 grid-cols-1 gap-6 mt-8">
        <div class="col-span-2">
            <div class="card">
                <div class="card-header">
                    <div class="flex items-center">
                        <h4 class="card-title">Personal data</h4>
                    </div>
                </div>

                <div class="p-6">
                    <form id="form" method="post" action="/profile-servlet">
                        <div class="grid grid-cols-1 md:grid-cols-2  gap-6">
                            <input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
                            <div>
                                <label for="cin" class="text-gray-800 text-sm font-medium inline-block mb-2">CIN</label>
                                <input type="text" class="form-input" id="cin" name="cin" value="<%=session.getAttribute("cin")%>" disabled>
                            </div>

                            <div>
                                <label for="firstName" class="text-gray-800 text-sm font-medium inline-block mb-2">First Name</label>
                                <input type="text" class="form-input" id="firstName" name="firstName" value="<%=session.getAttribute("firstName")%>" disabled>
                            </div>

                            <div>
                                <label for="lastName" class="text-gray-800 text-sm font-medium inline-block mb-2">Last Name</label>
                                <input type="text" class="form-input" id="lastName" name="lastName" value="<%=session.getAttribute("lastName")%>" disabled>
                            </div>

                            <div>
                                <label for="username" class="text-gray-800 text-sm font-medium inline-block mb-2">Username</label>
                                <input type="text" class="form-input" id="username" name="username" value="<%=session.getAttribute("username")%>" disabled>
                            </div>

                            <div>
                                <label for="email" class="text-gray-800 text-sm font-medium inline-block mb-2">E-Mail</label>
                                <input type="email" class="form-input" id="email" name="email" value="<%=session.getAttribute("email")%>" disabled>
                            </div>

                            <div>
                                <label for="phone" class="text-gray-800 text-sm font-medium inline-block mb-2">Phone Number</label>
                                <input type="tel" class="form-input" id="phone" name="phone" value="<%=session.getAttribute("phone")%>" disabled>
                            </div>
                        </div>

                        <button type="submit" class="btn bg-success text-white mt-5" id="submitBtn">Click to Update your information</button>
                        <button type="button" class="btn bg-gray-400 text-white mt-5 hidden" id="cancelBtn">Cancel</button>
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
<script src="../../assets/libs/simplebar/simplebar.min.js"></script>
<script src="../../assets/libs/feather-icons/feather.min.js"></script>
<script src="../../assets/libs/@frostui/tailwindcss/frostui.js"></script>

<!-- App Js -->
<script src="../../assets/js/app.js"></script>

<!-- Gridjs Plugin js -->
<script src="../../assets/libs/gridjs/gridjs.umd.js"></script>

<script src="/assets/js/profile.js"></script>

</body>
</html>