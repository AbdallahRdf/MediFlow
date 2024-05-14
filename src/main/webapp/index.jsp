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
                <form class="login-form" action="loginServlet" method="post">
                    <input type="text" placeholder="username" name="username" required/>
                    <input type="password" placeholder="password" name="password" required/>
                    <div>
                        <label class="select-label" for="select">Select you role</label>
                        <select id="select" name="role" required>
                            <option value="none" disabled selected>-- role</option>
                            <option value="admin">Admin</option>
                            <option value="secretary">Secretary</option>
                        </select>
                    </div>

                    <button>login</button>
                    <p class="message">Not registered? <a href="#">Create an account</a></p>
                </form>
            </div>
        </div>
    </body>
</html>