<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../component/adminAuthenticationCheck.jsp"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Dashboard | MediFlow - Hospital Appointment System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="MediFlow - Hospital Appointment System" name="description">
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


    <%@include file="/component/adminSidebar.jsp"%>
    
            <%@include file="/component/header.jsp"%>
    
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
                                            <p id="secretariesCount"></p>
                                        </div>
                                        <div>
                                            <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                                <i class="mgc_more_2_fill text-xl"></i>
                                            </button>

                                            <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                                <a href="secretary/addSecretary.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" >
                                                    Add new
                                                </a>
                                                <a href="secretary/secretaries.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200">
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
                                            <p id="doctorsCount"></p>
                                        </div>
                                        <div>
                                            <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                                <i class="mgc_more_2_fill text-xl"></i>
                                            </button>

                                            <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                                <a href="doctor/addDoctor.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" >
                                                    Add new
                                                </a>
                                                <a href="doctor/doctors.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" >
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
                                            <p id="patientsCount"></p>
                                        </div>
                                        <div>
                                            <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                                <i class="mgc_more_2_fill text-xl"></i>
                                            </button>

                                            <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                                <a href="patient/addPatient.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" >
                                                    Add new
                                                </a>
                                                <a href="patient/patients.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" >
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
                                        <p id="appointmentsCount"></p>
                                    </div>
                                    <div>
                                        <button class="text-gray-600 dark:text-gray-400" data-fc-type="dropdown" data-fc-placement="left-start" type="button">
                                            <i class="mgc_more_2_fill text-xl"></i>
                                        </button>

                                        <div class="hidden fc-dropdown fc-dropdown-open:opacity-100 opacity-0 w-36 z-50 mt-2 transition-[margin,opacity] duration-300 bg-white dark:bg-gray-800 shadow-lg border border-gray-200 dark:border-gray-700 rounded-lg p-2">
                                            <a href="appointment/addAppointment.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200" >
                                                Add new
                                            </a>
                                            <a href="appointment/appointments.jsp" class="flex items-center gap-1.5 py-1.5 px-3.5 rounded text-sm transition-all duration-300 bg-transparent text-gray-800 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-200">
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
    
           <%@include file="/component/footer.jsp"%>

   <%@include file="/component/js/scripts.jsp"%>

    <!-- Apexcharts js -->
    <script src="../assets/libs/apexcharts/apexcharts.min.js"></script>

    <!-- Dashboard Project Page js -->
    <script src="../assets/js/pages/dashboard.js"></script>

    <%@include file="/component/dashboardStatsScript.jsp"%>

</body>


</html>