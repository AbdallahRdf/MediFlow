<div class="flex wrapper">
    <!-- Sidenav Menu -->
    <div class="app-menu">

        <!-- Sidenav Brand Logo -->
        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="logo-box">
            <!-- Light Brand Logo -->
            <div class="logo-light">
                <img src="${pageContext.request.contextPath}/assets/images/logo-light.png" class="logo-lg h-12" alt="Light logo" style="height: 3.5rem;">
                <img src="${pageContext.request.contextPath}/assets/images/logo-sm.png" class="logo-sm" alt="Small logo">
            </div>

            <!-- Dark Brand Logo -->
            <div class="logo-dark">
                <img src="${pageContext.request.contextPath}/assets/images/logo-dark.png" class="logo-lg h-12" alt="Dark logo" style="height: 3.5rem;">
                <img src="${pageContext.request.contextPath}/assets/images/logo-sm.png" class="logo-sm" alt="Small logo">
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
                    <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="menu-link">
                        <span class="menu-icon"><i class="mgc_home_3_line"></i></span>
                        <span class="menu-text"> Dashboard </span>
                    </a>
                </li>

                <li class="menu-title">Menu</li>

                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/secretary/secretaries.jsp" class="menu-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                        <span class="menu-text"> Secretaries </span>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/doctor/doctors.jsp" class="menu-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                        <span class="menu-text"> Doctors </span>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/patient/patients.jsp" class="menu-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                        <span class="menu-text"> Patients </span>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/appointment/appointments.jsp" class="menu-link">
                        <span class="menu-icon"><i class="mgc_task_2_line"></i></span>
                        <span class="menu-text">Appointments</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Sidenav Menu End  -->
