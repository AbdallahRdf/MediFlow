<%@ page import="com.mediflow.models.Admin" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MediFlow | Login page</title>
        <link type="text/css" rel="stylesheet" href="assets/styles/index.css" >
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <h2 class="form-heading">Welcome back!</h2>
                <form class="login-form" action="/loginServlet" method="post">
                    <input type="text" placeholder="username" name="username"/>
                    <input type="password" placeholder="password" name="password"/>
                    <button>login</button>
                    <p class="message">Not registered? <a href="#">Create an account</a></p>
                </form>
            </div>
        </div>
    </body>
</html>