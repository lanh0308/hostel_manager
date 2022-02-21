<%-- 
    Document   : login
    Created on : Feb 21, 2022, 11:35:51 PM
    Author     : lanh0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/static/css/styleLogin.css" />
    </head>
    <body>
        <div class="container">
            <h1>Register</h1>
            <form action="/login" method="post">
                <div class="form-control">
                    <input type="text" id="username" name="username" placeholder="Username" />
                    <span></span>
                    <small></small>
                </div>
                <div class="form-control">
                    <input type="password" id="password" name="password" placeholder="Password" />
                    <span></span>
                    <small></small>
                </div>
                <input type="submit" value="Login" />
                <div class="signup_link"></div>
            </form>
        </div>
        <script src="/static/js/validateLogin.js"></script>
    </body>
    
</html>
