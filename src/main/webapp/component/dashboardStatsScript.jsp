<%@ page import="com.mediflow.enums.Role" %><%--
  Created by IntelliJ IDEA.
  User: abdallah
  Date: 18/05/2024
  Time: 00:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>

    const getData = async () => {
        try {
            const data = await fetch("http://localhost:8080/dashboard-servlet?role=<%=session.getAttribute("role").toString()%>");
            return await data.json();
        } catch (e) {
            console.log("error: " + e);
        }
    }

    const renderStats = async () => {
        const data = await getData();
        document.getElementById("appointmentsCount").textContent = data.appointments;
        document.getElementById("patientsCount").textContent = data.patients;

        <%
            if(session.getAttribute("role").toString().equals(Role.ADMIN.toString())){
                out.println("document.getElementById('doctorsCount').textContent = data.doctors;\n" +
"        document.getElementById('secretariesCount').textContent = data.secretaries;");
            }
        %>
        renderChart(data.appointmentsStatus.CANCELLED, data.appointmentsStatus.COMPLETED, data.appointmentsStatus.SCHEDULED);
    }

    const renderChart = (cancelled, completed, scheduled) => {
        var options = {
            chart: {
                height: 350,
                type: 'donut',
            },
            series: [scheduled, cancelled, completed],
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
    }

    renderStats();


</script>
