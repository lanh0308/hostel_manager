<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:56:49 PM
    Author     : lanh0
--%>

<%@page import="model.Room"%>
<%@page import="model.BedCategory"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bed Category</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%
            ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="mb-6 flex items-center">
                    <a href="/admin/room/add" class="ml-auto inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add room</a>
                </div>
                <div class="w-full grid lg:grid-cols-4 xl:grid-cols-6 gap-4">
                    <c:forEach items="${rooms}" var="room">
                        <div class="max-w-sm bg-white rounded-lg border border-gray-200 shadow-md 
                             <c:if test="${!room.isEmpty}">
                                 bg-pink-100
                             </c:if>
                             ">
                            <div class="flex justify-end px-4 pt-4">
                                <button id="dropdownButton" data-dropdown-toggle="dropdown-${room.id}" class="hidden sm:inline-block text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-gray-200 rounded-lg text-sm p-1.5" type="button">
                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z"></path></svg>
                                </button>
                                <div id="dropdown-${room.id}" class="hidden z-10 w-44 text-base list-none bg-white rounded divide-y divide-gray-100 shadow ">
                                    <ul class="py-1" aria-labelledby="dropdownButton">
                                        <li>
                                            <a href="/admin/room/edit?id=${room.id}" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 ">Edit</a>
                                        </li>
                                        <li>
                                            <a href="/admin/room/changepass?id=${room.id}" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 ">Change pass</a>
                                        </li>
                                        <li>
                                            <a href="/admin/room/delete?id=${room.id}" class="block py-2 px-4 text-sm text-red-600 hover:bg-gray-100">Delete</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="flex flex-col items-center pb-10">
                                <h3 class="mb-1 text-xl font-medium text-gray-900">${room.name}</h3>
                                <span class="text-sm text-gray-500">${room.roomCategory.name}</span>
                                <c:choose>
                                    <c:when test="${!room.isEmpty}">
                                        <span class="text-sm text-red-500">Phòng đã cho thuê</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-sm text-green-500">Phòng đang trống</span>
                                    </c:otherwise>
                                </c:choose>
                                <span class="text-md font-medium text-blue-500" id="price-${room.id}">${room.roomCategory.unit_price}</span>
                                <script>
                                    var price = ${room.roomCategory.unit_price};
                                    price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                    $("#price-${room.id}").text(price);
                                </script>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../base/footer.jsp" />
</html>
