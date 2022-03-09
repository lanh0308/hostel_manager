<%-- 
    Document   : add
    Created on : Mar 9, 2022, 7:05:57 PM
    Author     : lanh0
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add rental Page</title>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="flex justify-center items-center" style="min-height: 93vh">
                    <form style="width: 500px" action="/admin/rental/add" method="post">
                        <div class="mb-6">
                            <label for="room" class="block mb-2 text-sm font-medium text-gray-900">Room</label>
                            <select id="room" name="room" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                <c:forEach items="${requestScope.rooms}" var="room">
                                    <option value="${room.id}">${room.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Name customer</label>
                            <input required type="text" id="name" name="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="phone_number" class="block mb-2 text-sm font-medium text-gray-900">phone number</label>
                            <input required type="text" id="phone_number" name="phone_number" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                         <div class="mb-6">
                            <label for="address" class="block mb-2 text-sm font-medium text-gray-900">Address</label>
                            <input required type="text" id="address" name="address" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email</label>
                            <input required type="email" id="email" name="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="cmnd" class="block mb-2 text-sm font-medium text-gray-900">cmnd</label>
                            <input required type="text" id="cmnd" name="cmnd" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="deposit_money" class="block mb-2 text-sm font-medium text-gray-900">Deposit money</label>
                            <input required type="number" id="deposit_money" name="deposit_money" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="start_date" class="block mb-2 text-sm font-medium text-gray-900">Start date</label>
                            <input required type="date" id="start_date" name="start_date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="end_date" class="block mb-2 text-sm font-medium text-gray-900">End date</label>
                            <input required type="date" id="end_date" name="end_date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>

