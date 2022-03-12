<%-- 
    Document   : index
    Created on : Mar 13, 2022, 12:40:00 AM
    Author     : lanh0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trọ minh anh</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.4/dist/flowbite.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="container mx-auto">
            <div>
                <nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded ">
                    <div class="container flex flex-wrap justify-between items-center mx-auto">
                        <a href="/" class="flex items-center">
                            <img src="https://flowbite.com/docs/images/logo.svg" class="mr-3 h-6 sm:h-10" alt="Flowbite Logo" />
                            <span class="self-center text-xl font-semibold whitespace-nowrap">Trọ minh anh</span>
                        </a>
                        <button data-collapse-toggle="mobile-menu" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200" aria-controls="mobile-menu-2" aria-expanded="false">
                            <span class="sr-only">Open main menu</span>
                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
                            <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        </button>
                        <div class="hidden w-full md:block md:w-auto" id="mobile-menu">
                            <ul class="flex flex-col mt-4 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium">
                                <li>
                                    <a href="/" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0">Home</a>
                                </li>
                                <li>
                                    <a href="/room" class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0" aria-current="page">Room</a>
                                </li>
                                <li>
                                    <a href="/login" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0">login</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="mt-10">
                <h2 class="text-center text-6xl mb-10">Rooms</h2>
                <div class="w-full px-10 py-5">
                    <div class="w-full grid lg:grid-cols-3 xl:grid-cols-4 gap-4">
                        <c:forEach items="${rooms}" var="room">
                            <div class="max-w-sm bg-white rounded-lg border border-gray-200 shadow-md 
                                 <c:if test="${!room.isEmpty}">
                                     bg-red-200
                                 </c:if>
                                 ">
                                <div class="flex flex-col items-center pb-10 pt-10">
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
        </div>
        <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>
    </body>
</html>
