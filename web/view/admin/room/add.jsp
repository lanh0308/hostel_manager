<%-- 
    Document   : edit
    Created on : Feb 22, 2022, 6:56:40 PM
    Author     : lanh0
--%>

<%@page import="model.RoomCategory"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add room Page</title>
        <%
            ArrayList<RoomCategory> roomCategorys = (ArrayList<RoomCategory>) request.getAttribute("roomCategorys");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="flex justify-center items-center" style="height: 80vh">
                    <form style="width: 500px" id="form-status-edit" action="/admin/room/add" method="post" class="border border-gray-500 rounded-lg p-10">
                        
                        <div class="mb-6">
                            <label for="roomCategory" class="block mb-2 text-sm font-medium text-gray-900">Room category</label>
                            <select id="roomCategory" name="roomCategory" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                <c:forEach items="${roomCategorys}" var="roomCategory">
                                    <option value="${roomCategory.ID}">${roomCategory.name} tầng ${roomCategory.floor_number}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Name room</label>
                            <input required type="text" id="name" name="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>
