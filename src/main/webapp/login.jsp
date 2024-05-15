<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.mediflow.enums.Role" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login | MediFlow - Hospital Appointment System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- App css -->
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css">

    <!-- Icons css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css">

    <!-- Theme Config Js -->
    <script src="assets/js/config.js"></script>
</head>

<body>

    <div class="bg-gradient-to-r from-rose-100 to-teal-100 dark:from-gray-700 dark:via-gray-900 dark:to-black">

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <div class="h-screen w-screen flex justify-center items-center">

            <div class="2xl:w-1/4 lg:w-1/3 md:w-1/2 w-full">
                <div class="card overflow-hidden sm:rounded-md rounded-none">
                    <div class="p-6">
                        <a href="#" class="block mb-6">
                            <img class="h-12 block dark:hidden" src="assets/images/logo-dark.png" alt="">
                            <img class="h-12 hidden dark:block" src="assets/images/logo-light.png" alt="">
                        </a>

                        <h1 class="text-gray-600 dark:text-gray-500 text-center text-2xl mb-4">Welcome back!</h1>
                        <form action="login-servlet" method="post">
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-600 dark:text-gray-200 mb-2" for="LoggingEmailAddress">Username</label>
                                <input name="username" id="LoggingEmailAddress" class="form-input" type="text" placeholder="Enter your username" required>
                            </div>

                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-600 dark:text-gray-200 mb-2" for="loggingPassword">Password</label>
                                <input name="password" id="loggingPassword" class="form-input" type="password" placeholder="Enter your password" required>
                            </div>

                            <div class="mb-4">
                              <label for="example-select" class="text-gray-800 text-sm font-medium inline-block mb-2">Select your role</label>
                                <select name="role" class="form-select" id="example-select" required>
                                    <option value="" selected disabled>-- role</option>
                                    <option value="<%=Role.SECRETARY.toString()%>">Secretary</option>
                                    <option value="<%=Role.ADMIN.toString()%>">Admin</option>
                                </select>
                            </div>

                            <div class="flex items-center justify-between mb-4">
                                <div class="flex items-center">
                                    <input type="checkbox" class="form-checkbox rounded" id="checkbox-signin">
                                    <label class="ms-2" for="checkbox-signin">Remember me</label>
                                </div>
                                <a href="auth-recoverpw.html" class="text-sm text-primary border-b border-dashed border-primary">Forget Password ?</a>
                            </div>

                            <div class="flex justify-center mb-6">
                                <button class="btn w-full text-white bg-primary"> Log In </button>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</body>
</html>