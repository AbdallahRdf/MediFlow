<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mediflow.models.Doctor" %>
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
    <!--<meta content="coderthemes" name="author">-->

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
                <a href="addDoctor.jsp"><button type="button" class="btn border-success text-success hover:bg-success hover:text-white"><i class="mgc_add_line me-1"></i>Add New Doctor</button></a>

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
                        <a href="doctors.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Doctors</a>
                    </div>
                </div>
            </div>
            <!-- Page Title End -->

            <div class="flex flex-col gap-6">

                <div class="card">
                    <div class="card-header">
                        <div class="flex justify-between items-center">
                            <h4 class="card-title">List of Doctors</h4>
                        </div>
                    </div>
                    <div class="p-6">
                        <div id="table-search"></div>
                    </div>
                </div>

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
<script src="../../assets/libs/%40frostui/tailwindcss/frostui.js"></script>

<!-- App Js -->
<script src="../../assets/js/app.js"></script>

<!-- Gridjs Plugin js -->
<script src="../../assets/libs/gridjs/gridjs.umd.js"></script>



<script>
    class GridDatatable {
        init() {
            this.basicTableInit();
        }

        basicTableInit() {
            if (document.getElementById("table-search")) {
                fetch('${pageContext.request.contextPath}/doctor-servlet')
                    .then(response => response.json())
                    .then(data => {
                        console.log("date",data);
                        const grid = new gridjs.Grid({
                            columns: [
                                "CIN",
                                "First name",
                                "Last name",
                                "Email",
                                "Telephone",
                                "Speciality",
                                "Registration",
                                {
                                    name: "Actions",
                                    width: "88px",
                                    sort: false,
                                    formatter: (cell, row) => {
                                        return gridjs.html(`
                                                <div class="flex">
                                                    <a href="updateDoctor.jsp" class="me-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg></a>
                                                    <a href=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></i></a>
                                                </div>
                                            `);
                                    }
                                }
                            ],

                            pagination: { limit: 5 },
                            search: true,
                            sort: true,
                            data: data.map(doctor => [
                                doctor.cin,
                                doctor.firstName,
                                doctor.lastName,
                                doctor.email,
                                doctor.phone,
                                doctor.speciality,
                                doctor.registrationNum
                            ])
                        });

                        grid.render(document.getElementById("table-search"));
                    });
            }
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        const gridDatatable = new GridDatatable();
        gridDatatable.init();
    });

</script>



</body>
</html>