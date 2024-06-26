<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mediflow.enums.HttpCustomVerbs" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../../component/authenticationCheck.jsp"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Appointments | MediFlow - Hospital Appointment System</title>
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
      <!-- Include admin or secretary sidebar based on role -->
          <%
              if (request.getSession().getAttribute("role").equals(Role.ADMIN.toString())) {
                  %><%@include file="/component/adminSidebar.jsp"%><%
              } else if (request.getSession().getAttribute("role").equals(Role.SECRETARY.toString())) {
                  %><%@include file="/component/secretarySidebar.jsp"%><%
              }
          %>

    <%@include file="/component/header.jsp"%>

        <main class="flex-grow p-6">

            <!-- Page Title Start -->
            <div class="flex justify-between items-center mb-6">
                <a href="/appointment-servlet?method=<%=HttpCustomVerbs.CREATE.toString()%>"><button type="button" class="btn border-success text-success hover:bg-success hover:text-white"><i class="mgc_add_line me-1"></i>Add New Appointment</button></a>

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
                        <a href="appointments.jsp" class="text-sm font-medium text-slate-700 dark:text-slate-400" aria-current="page">Appointments</a>
                    </div>
                </div>
            </div>
            <!-- Page Title End -->

            <div class="flex flex-col gap-6">

                <div class="card">
                    <div class="card-header">
                        <div class="flex justify-between items-center">
                            <h4 class="card-title">List of Appointments</h4>
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

<!-- Gridjs Plugin js -->
<script src="../../assets/libs/gridjs/gridjs.umd.js"></script>



<script>
    class GridDatatable {
        init() {
            this.basicTableInit();
        }

        async basicTableInit() {
            if (document.getElementById("table-search")) {
                fetch('${pageContext.request.contextPath}/appointment-servlet')
                    .then(data => data.json())
                    .then(data => {
                        const grid = new gridjs.Grid({
                            columns: [
                                {
                                    name :"id",
                                    hidden: true
                                },
                                "Patient",
                                "Doctor",
                                "Date",
                                "Time",
                                {
                                    name: "Room",
                                    width: "220px"
                                },
                                {
                                    name: "Status",
                                    width: "130px",
                                    formatter: (cell, row) => {
                                        const status = row._cells[6].data;
                                        let badgeClass;
                                        switch (status) {
                                            case 'SCHEDULED':
                                                badgeClass = 'bg-purple-500';
                                                break;
                                            case 'CANCELLED':
                                                badgeClass = 'bg-yellow-500';
                                                break;
                                            case 'COMPLETED':
                                                badgeClass = 'bg-green-500';
                                                break;
                                            default:
                                                badgeClass = 'badge badge-secondary';
                                        }
                                        return gridjs.html(`
                                        <span class="inline-flex items-center gap-1.5 py-1.5 px-3 rounded-full text-xs font-medium ` + badgeClass + ` text-white">` + status + `</span>

                                        `);
                                    }
                                }
,
                                {
                                    name: "Actions",
                                    width: "88px",
                                    sort: false,
                                    formatter: (cell, row) => {
                                        const appointmentID = row._cells[0].data;
                                        return gridjs.html(`
                                    <div class="flex">
                                        <a href="/appointment-servlet?id=` + appointmentID + `" class="me-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg></a>
                                        <form action="/appointment-servlet" method="post">
                                            <input type="hidden" name="id" value="` + appointmentID + `" />
                                            <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></i><button/>
                                        </form>
                                    </div>
                                   `);
                                    }
                                }
                            ],
                            pagination: {limit: 5},
                            search: true,
                            sort: true,
                            data: data.map(appointment => {
                                var timeComponents = appointment.time.split(" "); // Split the string into components

                                var timeParts = timeComponents[0].split(":"); // Split the time part into hours, minutes, and seconds
                                var hours = parseInt(timeParts[0], 10); // Parse hours as an integer
                                var minutes = parseInt(timeParts[1], 10); // Parse minutes as an integer
                                var seconds = parseInt(timeParts[2], 10); // Parse seconds as an integer

// Adjust hours for AM/PM format
                                if (timeComponents[1].toLowerCase() === "pm" && hours < 12) {
                                    hours += 12;
                                } else if (timeComponents[1].toLowerCase() === "am" && hours === 12) {
                                    hours = 0;
                                }

// Create a new Date object with the specified time
                                var time = new Date();
                                time.setHours(hours);
                                time.setMinutes(minutes);
                                time.setSeconds(seconds);
                                time.setMilliseconds(0);

                                const appointmentHours = time.getHours().toString().length == 1 ? "0"+time.getHours() : time.getHours();
                                const appointmentMinutes = time.getMinutes().toString().length == 1 ? "0"+time.getMinutes() : time.getMinutes();

                                return [
                                    appointment.id,
                                    appointment.patient.firstName + " " + appointment.patient.lastName,
                                    appointment.doctor.firstName + " " + appointment.doctor.lastName,
                                    appointment.date,
                                    appointmentHours + ":" + appointmentMinutes,
                                    appointment.room,
                                    appointment.appointmentStatus
                                ];
                            })
                        });

                        grid.render(document.getElementById("table-search"));
                    })
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