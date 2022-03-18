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
                    <form style="width: 500px" action="/admin/rental/edit" method="post" class="border border-gray-500 rounded-lg p-10">
                        <input type="hidden" value="${requestScope.roomRental.customer.id}" name="idCustomer"/>
                        <input type="hidden" value="${requestScope.roomRental.id}" name="idRoomRental"/>
                        <div class="mb-6">
                            <label for="room" class="block mb-2 text-sm font-medium text-gray-900">Room</label>
                            <select id="room" name="room" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                <option value="${requestScope.roomRental.room.id}" selected>${requestScope.roomRental.room.name}</option>
                                <c:forEach items="${requestScope.rooms}" var="room">
                                    <option value="${room.id}">${room.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Name customer</label>
                            <input required type="text" id="name" name="name" value="${requestScope.roomRental.customer.name}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="phone_number" class="block mb-2 text-sm font-medium text-gray-900">phone number</label>
                            <input required type="text" id="phone_number" name="phone_number" value="${requestScope.roomRental.customer.phone_number}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="address" class="block mb-2 text-sm font-medium text-gray-900">Address</label>
                            <input required type="text" id="address" name="address" value="${requestScope.roomRental.customer.address}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email</label>
                            <input required type="email" id="email" name="email" value="${requestScope.roomRental.customer.email}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="cmnd" class="block mb-2 text-sm font-medium text-gray-900">cmnd</label>
                            <input required type="text" id="cmnd" name="cmnd" value="${requestScope.roomRental.customer.cmnd}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="deposit_money" class="block mb-2 text-sm font-medium text-gray-900">Deposit money</label>
                            <input required type="number" id="deposit_money" name="deposit_money" value="${requestScope.roomRental.deposit_money}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="start_date" class="block mb-2 text-sm font-medium text-gray-900">Start date</label>
                            <input required type="date" id="start_date" name="start_date" value="${requestScope.roomRental.start_date}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="end_date" class="block mb-2 text-sm font-medium text-gray-900">End date</label>
                            <input required type="date" id="end_date" name="end_date" value="${requestScope.roomRental.end_date}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="flex items-center h-5 mb-6">

                            <jsp:useBean id="now" class="java.util.Date" />
                            <c:choose>
                                <c:when test="${requestScope.roomRental.state && roomRental.end_date.time gt now.time }">
                                    <input disabled checked id="state" name="state" aria-describedby="state" value="true" type="checkbox" class="mr-3 w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300">
                                </c:when>
                                <c:otherwise>
                                    <input id="state" name="state" aria-describedby="state" value="true" type="checkbox" class="mr-3 w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300">
                                </c:otherwise>
                            </c:choose>
                            <label for="state" class="font-medium text-gray-900">Còn hiệu lực</label>
                        </div>
                        <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>

