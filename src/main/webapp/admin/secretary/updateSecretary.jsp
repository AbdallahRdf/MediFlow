<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mediflow.models.Patient" %>
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

                                    <button type="submit" class="btn bg-success text-white mt-5">Modify Secretary</button>
                                </form>
                                <div id="GridFormHtml" class="hidden w-full overflow-hidden transition-[height] duration-300">
                                    <pre class="language-html h-56">
                                        <code>
                                            &lt;form&gt;
                                                &lt;div class=&quot;grid grid-cols-1 md:grid-cols-2  gap-6&quot;&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputEmail4&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Email&lt;/label&gt;
                                                        &lt;input type=&quot;email&quot; class=&quot;form-input&quot; id=&quot;inputEmail4&quot; placeholder=&quot;Email&quot;&gt;
                                                    &lt;/div&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputPassword4&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Password&lt;/label&gt;
                                                        &lt;input type=&quot;password&quot; class=&quot;form-input&quot; id=&quot;inputPassword4&quot; placeholder=&quot;Password&quot;&gt;
                                                    &lt;/div&gt;

                                                    &lt;div class=&quot;lg:col-span-2&quot;&gt;
                                                        &lt;label for=&quot;inputAddress&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Address&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputAddress&quot; placeholder=&quot;1234 Main St&quot;&gt;
                                                    &lt;/div&gt;

                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputAddress2&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Address 2&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputAddress2&quot; placeholder=&quot;Apartment, studio, or floor&quot;&gt;
                                                    &lt;/div&gt;

                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputCity&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;City&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputCity&quot;&gt;
                                                    &lt;/div&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputState&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;State&lt;/label&gt;
                                                        &lt;select id=&quot;inputState&quot; class=&quot;form-select&quot;&gt;
                                                            &lt;option&gt;Choose&lt;/option&gt;
                                                            &lt;option&gt;Option 1&lt;/option&gt;
                                                            &lt;option&gt;Option 2&lt;/option&gt;
                                                            &lt;option&gt;Option 3&lt;/option&gt;
                                                        &lt;/select&gt;
                                                    &lt;/div&gt;
                                                    &lt;div&gt;
                                                        &lt;label for=&quot;inputZip&quot; class=&quot;text-gray-800 text-sm font-medium inline-block mb-2&quot;&gt;Zip&lt;/label&gt;
                                                        &lt;input type=&quot;text&quot; class=&quot;form-input&quot; id=&quot;inputZip&quot;&gt;
                                                    &lt;/div&gt;
                                                &lt;/div&gt;

                                                &lt;div class=&quot;flex items-center gap-2 my-3&quot;&gt;
                                                    &lt;input type=&quot;checkbox&quot; class=&quot;form-checkbox rounded border border-gray-200&quot; id=&quot;customCheck11&quot;&gt;
                                                    &lt;label class=&quot;text-gray-800 text-sm font-medium inline-block&quot; for=&quot;customCheck11&quot;&gt;Check this custom checkbox !&lt;/label&gt;
                                                &lt;/div&gt;

                                                &lt;button type=&quot;submit&quot; class=&quot;btn bg-primary text-white&quot;&gt;Sign in&lt;/button&gt;
                                            &lt;/form&gt;
                                        </code>
                                    </pre>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>


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