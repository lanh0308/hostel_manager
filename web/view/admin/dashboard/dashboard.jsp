<%-- 
    Document   : dashboard
    Created on : Feb 27, 2022, 8:46:17 PM
    Author     : lanh0
--%>

<%@page import="model.RoomRental"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <%
            ArrayList<RoomRental> roomRentals = (ArrayList<RoomRental>) request.getAttribute("roomRentals");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="grid grid-cols-4 gap-10">
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Room empty</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium" id="room-quantity-empty">0</p>
                    </div>
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Payment in 1 month</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium"  id="payment-one-month">0</p>
                    </div>
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">In debt</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium" id="debit-payment">0</p>
                    </div>
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Total Payment</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium"n id="total-payment">0</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        var totalPaymentMonth = 0;
        var totalDebit = 0;
        <c:forEach items="${roomRentals}" var="roomRental">
            <c:forEach items="${roomRental.services}" var="service">
                <c:forEach items="${service.value}" var="item"> 
                    <c:choose>
                        <c:when test="${item.state}">
                            if(new Date("${service.key}").getYear()==new Date().getYear() &&(new Date("${service.key}").getMonth()==new Date().getMonth()-1)){
                                totalPaymentMonth+=${item.getPrice()};
                            }
                        </c:when>
                        <c:otherwise>
                            if(new Date("${service.key}").getYear()==new Date().getYear() &&(new Date("${service.key}").getMonth()==new Date().getMonth()-1)){
                                totalDebit+=${item.getPrice()};
                                isPayment=false;
                            }
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:forEach>
        </c:forEach>
        $("#payment-one-month").text(totalPaymentMonth.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
        $("#debit-payment").text(totalDebit.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
         var roomEmpty=0;
        <c:forEach items="${rooms}" var="room">
            <c:if test="${room.isEmpty}">
                roomEmpty+=1;
            </c:if>
        </c:forEach>
        $("#room-quantity-empty").text(roomEmpty);
    </script>
    <jsp:include page="../base/footer.jsp" />
</html>
