<%-- 
    Document   : login
    Created on : Feb 27, 2022, 7:51:58 PM
    Author     : lanh0
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.4/dist/flowbite.min.css" />
        <%
            String error = (String) request.getAttribute("error");
        %>
    </head>
    <body>
        <div class="min-h-screen flex justify-center items-center">
            <form  action="/admin/login" method="post" class="px-10 py-12 mx-auto rounded-md" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; min-width: 500px">
                <h3 class="text-4xl mb-6">Login</h3>
                <c:if test="${error!=null}">
                    <div id="showErrorForm">
                        <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                            ${error}
                        </div>
                    </div>
                </c:if>
                <div class="mb-6">
                    <label for="username" class="block mb-2 text-sm font-medium text-gray-900">Username</label>
                    <input type="text" id="username" name="username" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5" required>
                </div>
                <div class="mb-6">
                    <label for="password" class="block mb-2 text-sm font-medium text-gray-900">Password</label>
                    <input type="password" id="password" name="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5" required>
                </div>
                <!-- <div class="flex items-start mb-6">
                    <div class="flex items-center h-5">
                        <input id="remember" aria-describedby="remember" type="checkbox" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-pink-300" required>
                    </div>
                    <div class="ml-3 text-sm">
                        <label for="remember" class="font-medium text-gray-900">Remember me</label>
                    </div>
                </div>-->
                <button type="submit" class="text-white bg-pink-500 hover:bg-pink-600 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Login</button>
            </form>
        </div>
        <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>
    </body>
</html>
