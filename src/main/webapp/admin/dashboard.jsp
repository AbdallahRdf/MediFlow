<%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 14/05/2024
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../component/adminAuthenticationCheck.jsp"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Dashboard | MediFlow - Hospital Appointment System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="coderthemes" name="author">

    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- App css -->
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css">

    <!-- Icons css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css">

    <!-- Theme Config Js -->
    <script src="../assets/js/config.js"></script>
</head>

<body>

    <div class="flex wrapper">

        <!-- Sidenav Menu -->
        <div class="app-menu">

            <!-- Sidenav Brand Logo -->
            <a href="dashboard.jsp" class="logo-box">
                <!-- Light Brand Logo -->
                <div class="logo-light">
                    <img src="../assets/images/logo-light.png" class="logo-lg h-12" alt="Light logo" style="height: 3.5rem;">
                    <img src="../assets/images/logo-sm.png" class="logo-sm" alt="Small logo">
                </div>

                <!-- Dark Brand Logo -->
                <div class="logo-dark">
                    <img src="../assets/images/logo-dark.png" class="logo-lg h-12" alt="Dark logo" style="height: 3.5rem;">
                    <img src="../assets/images/logo-sm.png" class="logo-sm" alt="Small logo">
                </div>
            </a>

            <!-- Sidenav Menu Toggle Button -->
            <button id="button-hover-toggle" class="absolute top-5 end-2 rounded-full p-1.5">
                <span class="sr-only">Menu Toggle Button</span>
                <i class="mgc_round_line text-xl"></i>
            </button>

            <!--- Menu -->
            <div class="srcollbar" data-simplebar>
                <ul class="menu" data-fc-type="accordion">

                    <li class="menu-item mt-6">
                        <a href="dashboard.jsp" class="menu-link">
                            <span class="menu-icon"><i class="mgc_home_3_line"></i></span>
                            <span class="menu-text"> Dashboard </span>
                        </a>
                    </li>

                    <li class="menu-title">Menu</li>

                    <li class="menu-item">
                        <a href="list_secretaires.jsp" class="menu-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            <span class="menu-text"> Secretaries </span>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="list_doctors.jsp" class="menu-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            <span class="menu-text"> Doctors </span>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="list_patients.jsp" class="menu-link">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            <span class="menu-text"> Patients </span>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="list_appointments.jsp" class="menu-link">
                            <span class="menu-icon"><i class="mgc_task_2_line"></i></span>
                            <span class="menu-text">Appointments</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Sidenav Menu End  -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <div class="page-content">

            <!-- Topbar Start -->
            <header class="app-header flex items-center px-4 gap-3">
                <!-- Sidenav Menu Toggle Button -->
                <button id="button-toggle-menu" class="nav-link p-2">
                    <span class="sr-only">Menu Toggle Button</span>
                    <span class="flex items-center justify-center h-6 w-6">
                        <i class="mgc_menu_line text-xl"></i>
                    </span>
                </button>

                <!-- Topbar Brand Logo -->
                <a href="dashboard.jsp" class="logo-box">
                    <!-- Light Brand Logo -->
                    <div class="logo-light">
                        <img src="../assets/images/logo-light.png" class="logo-lg h-6" alt="Light logo">
                        <img src="../assets/images/logo-sm.png" class="logo-sm" alt="Small logo">
                    </div>

                    <!-- Dark Brand Logo -->
                    <div class="logo-dark">
                        <img src="../assets/images/logo-dark.png" class="logo-lg h-6" alt="Dark logo">
                        <img src="../assets/images/logo-sm.png" class="logo-sm" alt="Small logo">
                    </div>
                </a>

                <!-- Topbar Search Modal Button -->
                <button type="button" data-fc-type="modal" data-fc-target="topbar-search-modal" class="nav-link p-2 me-auto">
                    <span class="sr-only">Search</span>
                    <span class="flex items-center justify-center h-6 w-6">
                        <i class="mgc_search_line text-2xl"></i>
                    </span>
                </button>

                <!-- Fullscreen Toggle Button -->
                <div class="md:flex hidden">
                    <button data-toggle="fullscreen" type="button" class="nav-link p-2">
                        <span class="sr-only">Fullscreen Mode</span>
                        <span class="flex items-center justify-center h-6 w-6">
                            <i class="mgc_fullscreen_line text-2xl"></i>
                        </span>
                    </button>
                </div>


                <!-- Light/Dark Toggle Button -->
                <div class="flex">
                    <button id="light-dark-mode" type="button" class="nav-link p-2">
                        <span class="sr-only">Light/Dark Mode</span>
                        <span class="flex items-center justify-center h-6 w-6">
                            <i class="mgc_moon_line text-2xl"></i>
                        </span>
                    </button>
                </div>

                <!-- Profile Dropdown Button -->
                <div class="relative">
                    <button data-fc-type="dropdown" data-fc-placement="bottom-end" type="button" class="nav-link">
                        <img src="../assets/images/users/avatar-4.jpg" alt="user-image" class="rounded-full h-10">
                    </button>
                    <div class="fc-dropdown fc-dropdown-open:opacity-100 hidden opacity-0 w-44 z-50 transition-[margin,opacity] duration-300 mt-2 bg-white shadow-lg border rounded-lg p-2 border-gray-200 dark:border-gray-700 dark:bg-gray-800">
                        <a class="flex items-center py-2 px-3 rounded-md text-sm text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-300" href="pages-gallery.jsp">
                            <i class="mgc_user_1_line  me-2"></i>
                            <span>Profile</span>
                        </a>
                        <hr class="my-2 -mx-2 border-gray-200 dark:border-gray-700">
                        <a class="flex items-center py-2 px-3 rounded-md text-sm text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-300" href="auth-login.jsp">
                            <i class="mgc_exit_line  me-2"></i>
                            <span>Log Out</span>
                        </a>
                    </div>
                </div>
            </header>
            <!-- Topbar End -->

            <!-- Topbar Search Modal -->
            <div>
                <div id="topbar-search-modal" class="fc-modal hidden w-full h-full fixed top-0 start-0 z-50">
                    <div class="fc-modal-open:opacity-100 fc-modal-open:duration-500 opacity-0 transition-all sm:max-w-lg sm:w-full m-12 sm:mx-auto">
                        <div class="mx-auto max-w-2xl overflow-hidden rounded-xl bg-white shadow-2xl transition-all dark:bg-slate-800">
                            <div class="relative">
                                <div class="pointer-events-none absolute top-3.5 start-4 text-gray-900 text-opacity-40 dark:text-gray-200">
                                    <i class="mgc_search_line text-xl"></i>
                                </div>
                                <input type="search" class="h-12 w-full border-0 bg-transparent ps-11 pe-4 text-gray-900 placeholder-gray-500 dark:placeholder-gray-300 dark:text-gray-200 focus:ring-0 sm:text-sm" placeholder="Search...">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <main class="flex-grow p-6">

                <!-- Page Title Start -->
                <div class="flex justify-between items-center mb-6">
                    <h4 class="text-slate-900 dark:text-slate-200 text-lg font-medium">Dashboard</h4>

                    <div class="md:flex hidden items-center gap-2.5 text-sm font-semibold">
                        <div class="flex items-center gap-2">
                            <a href="#" class="text-sm font-medium text-slate-700 dark:text-slate-400">MediFlow</a>
                        </div>

                        <div class="flex items-center gap-2">
                            <i class="mgc_right_line text-lg flex-shrink-0 text-slate-400 rtl:rotate-180"></i>
                            <a href="dashboard.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Dashboard</a>
                        </div>
                    </div>
                </div>
                <!-- Page Title End -->
                <div class="grid lg:grid-cols-4 md:grid-cols-2 gap-6 mb-6">
                    <div class="col-span-1">
                        <div class="card" style="height: 100%">
                            <div class="p-6">
                                <div class="flex items-baseline">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="w-12 h-12 flex justify-center items-center rounded text-primary bg-primary/25">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        </div>
                                    </div>
                                    <div class="flex" style="width: -webkit-fill-available;">
                                        <div class="flex-grow">
                                            <h5 class="mb-1">Total Secretaries</h5>
                                            <p><%= session.getAttribute("secretariesCount") %></p>
                                        </div>
                                        <div>
                                            <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                                <i class="mgc_more_2_fill text-xl"></i>
                                            </button>

                                            <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                                <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                    Add new
                                                </a>
                                                <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                    Show list
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-span-1">
                        <div class="card" style="height: 100%">
                            <div class="p-6">
                                <div class="flex items-baseline">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="w-12 h-12 flex justify-center items-center rounded text-primary bg-primary/25">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        </div>
                                    </div>
                                    <div class="flex" style="width: -webkit-fill-available;">
                                        <div class="flex-grow">
                                            <h5 class="mb-1">Total Doctors</h5>
                                            <p><%= session.getAttribute("doctorsCount") %></p>
                                        </div>
                                        <div>
                                            <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                                <i class="mgc_more_2_fill text-xl"></i>
                                            </button>

                                            <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                                <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                    Add new
                                                </a>
                                                <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                    Show list
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-span-1">
                        <div class="card" style="height: 100%">
                            <div class="p-6">
                                <div class="flex items-baseline">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="w-12 h-12 flex justify-center items-center rounded text-primary bg-primary/25">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        </div>
                                    </div>
                                    <div class="flex" style="width: -webkit-fill-available;">
                                        <div class="flex-grow">
                                            <h5 class="mb-1">Total Patients</h5>
                                            <p><%= session.getAttribute("patientsCount") %></p>
                                        </div>
                                        <div>
                                            <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                                <i class="mgc_more_2_fill text-xl"></i>
                                            </button>

                                            <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                                <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                    Add new
                                                </a>
                                                <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                    Show list
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-span-1">
                        <div class="card" style="height: 100%">
                            <div class="p-6 flex">
                                <div class="flex items-baseline">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="w-12 h-12 flex justify-center items-center rounded text-primary bg-primary/25">
                                            <i class="mgc_task_2_line text-xl"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex" style="width: -webkit-fill-available;">
                                    <div class="flex-grow">
                                        <h5 class="mb-1">Total Appointments</h5>
                                        <p><%= session.getAttribute("appointmentsCount") %></p>
                                    </div>
                                    <div>
                                        <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                            <i class="mgc_more_2_fill text-xl"></i>
                                        </button>

                                        <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                            <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                Add new
                                            </a>
                                            <a class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" href="javascript:void(0)">
                                                Show list
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid 2xl:grid-cols-4 gap-6 mb-6">
                    <div class="2xl:col-span-3">
                        <div class="grid lg:grid-cols-3 gap-6">
                            <div class="col-span-1">
                                <div class="card">
                                    <div class="p-6">
                                        <h4 class="card-title mb-6">Appointments Statistics</h4>

                                        <div id="donut_chart" class="apex-charts" dir="ltr"></div>

                                    </div>
                                </div>
                            </div>
                            <div class="lg:col-span-2">
                                <div class="card">
                                    <div class="p-6">
                                        <div class="flex justify-between items-center">
                                            <h4 class="card-title">Project Statistics</h4>
                                            <div class="flex gap-2">
                                                <button type="button" class="btn btn-sm bg-primary/25 text-primary hover:bg-primary hover:text-white">
                                                    All
                                                </button>
                                                <button type="button" class="btn btn-sm bg-gray-400/25 text-gray-400 hover:bg-gray-400 hover:text-white">
                                                    6M
                                                </button>
                                                <button type="button" class="btn btn-sm bg-gray-400/25 text-gray-400 hover:bg-gray-400 hover:text-white">
                                                    1Y
                                                </button>
                                            </div>
                                        </div>

                                        <div dir="ltr" class="mt-2">
                                            <div id="crm-project-statistics" class="apex-charts" data-colors="#cbdcfc,#3073F1"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div> <!-- Grid End -->

            </main>

            <!-- Footer Start -->
            <footer class="footer h-16 flex items-center px-6 bg-white shadow dark:bg-gray-800">
                <div class="flex justify-center w-full gap-4">
                    <div>
                        <script>document.write(new Date().getFullYear())</script> © MediFlow - Created by IDOUFKIR Kamal & ZEKRI Hamza & RADFI Abdallah</a>
                    </div>
                </div>
            </footer>
            <!-- Footer End -->

        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->

    </div>

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

    <!-- Apexcharts js -->
    <script src="../assets/libs/apexcharts/apexcharts.min.js"></script>

    <!-- Dashboard Project Page js -->
    <script src="../assets/js/pages/dashboard.js"></script>


    <script>
        var options = {
            chart: {
                height: 350,
                type: 'donut',
            },
            series: [1, 2, 1],
            labels: ["Scheduled","Cancelled","Completed"],
            colors: ["#4073F1","#f1b44c","#0acf97"],
            legend: {
                position: 'bottom',
            },
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
        };

        var chart = new ApexCharts(document.querySelector("#donut_chart"), options);
        chart.render();

    </script>
</body>


</html>