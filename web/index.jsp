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
                                    <a href="/" class="block py-2 pr-4 pl-3 text-white bg-pink-700 rounded md:bg-transparent md:text-pink-700 md:p-0" aria-current="page">Home</a>
                                </li>
                                <li>
                                    <a href="/room" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-pink-50 md:hover:bg-transparent md:border-0 md:hover:text-pink-700 md:p-0">Room</a>
                                </li>
                                <li>
                                    <a href="/login" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-pink-50 md:hover:bg-transparent md:border-0 md:hover:text-pink-700 md:p-0">login</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div>
                <div id="default-carousel" data-carousel="slide" class="relative">

                    <!-- Carousel wrapper -->
                    <div class="overflow-hidden relative h-56 rounded-lg sm:h-64 xl:h-80 2xl:h-96">

                        <!-- Item 1 -->
                        <div class="hidden duration-700 ease-in-out" data-carousel-item="active">
                            <img src="https://flowbite.com/docs/images/carousel/carousel-1.svg" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2" alt="...">
                        </div>

                        <!-- Item 2 -->
                        <div class="hidden duration-700 ease-in-out" data-carousel-item="">
                            <img src="https://flowbite.com/docs/images/carousel/carousel-2.svg" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2" alt="...">
                        </div>

                        <!-- Item 3 -->
                        <div class="hidden duration-700 ease-in-out" data-carousel-item="">
                            <img src="https://flowbite.com/docs/images/carousel/carousel-3.svg" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2" alt="...">
                        </div>

                        <!-- Item 4 -->
                        <div class="hidden duration-700 ease-in-out" data-carousel-item="">
                            <img src="https://flowbite.com/docs/images/carousel/carousel-4.svg" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2" alt="...">
                        </div>

                        <!-- Item 5 -->
                        <div class="hidden duration-700 ease-in-out" data-carousel-item="">
                            <img src="https://flowbite.com/docs/images/carousel/carousel-5.svg" class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2" alt="...">
                        </div>
                    </div>

                    <!-- Slider indicators -->
                    <div class="flex absolute bottom-5 left-1/2 space-x-3 -translate-x-1/2">
                        <button type="button" class="w-3 h-3 bg-white rounded-full" aria-current="true" aria-label="Slide 1" data-carousel-slide-to="0"></button>
                        <button type="button" class="w-3 h-3 rounded-full bg-white/50 hover:bg-white" aria-current="false" aria-label="Slide 2" data-carousel-slide-to="1"></button>
                        <button type="button" class="w-3 h-3 rounded-full bg-white/50 hover:bg-white" aria-current="false" aria-label="Slide 3" data-carousel-slide-to="2"></button>
                        <button type="button" class="w-3 h-3 rounded-full bg-white/50 hover:bg-white" aria-current="false" aria-label="Slide 4" data-carousel-slide-to="3"></button>
                        <button type="button" class="w-3 h-3 rounded-full bg-white/50 hover:bg-white" aria-current="false" aria-label="Slide 5" data-carousel-slide-to="4"></button>
                    </div>

                    <!-- Slider controls -->
                    <button type="button" class="flex absolute top-0 left-0 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none" data-carousel-prev>
                        <span class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30 group-hover:bg-white/50 group-focus:ring-4 group-focus:ring-white group-focus:outline-none">
                            <svg class="w-5 h-5 text-white sm:w-6 sm:h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
                            <span class="hidden">Previous</span>
                        </span>
                    </button>
                    <button type="button" class="flex absolute top-0 right-0 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none" data-carousel-next>
                        <span class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30 group-hover:bg-white/50  group-focus:ring-4 group-focus:ring-white group-focus:outline-none">
                            <svg class="w-5 h-5 text-white sm:w-6 sm:h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                            <span class="hidden">Next</span>
                        </span>
                    </button>
                </div>
            </div>
            <div class="w-full mt-20">
                <h3 class="mt-10 text-5xl mb-10 text-center">Giá phòng</h3>
                <div class="grid grid-cols-3 gap-10">
                    <c:forEach items="${requestScope.roomCategorys}" var="roomCategory">
                        <div class="p-4 max-w-lg bg-white rounded-lg border shadow-md sm:p-8">
                            <h5 class="mb-4 text-xl font-medium text-gray-500">Standard plan</h5>
                            <div class="flex items-baseline text-gray-900">
                                <span class="text-5xl font-extrabold tracking-tight" id="price-${roomCategory.ID}">${roomCategory.unit_price}</span>
                                <script>
                                    var price = ${roomCategory.unit_price};
                                    price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                    $("#price-${roomCategory.ID}").text(price);
                                </script>
                                <span class="ml-1 text-xl font-normal text-gray-500 dark:text-gray-400">/tháng</span>
                            </div>
                            <!-- List -->
                            <ul role="list" class="my-7 space-y-5">
                                <li class="flex space-x-3">
                                    <!-- Icon -->
                                    <svg class="flex-shrink-0 w-5 h-5 text-pink-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">${roomCategory.areage}m&sup2</span>
                                </li>
                                <li class="flex space-x-3">
                                    <svg class="flex-shrink-0 w-5 h-5 text-pink-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">Wifi</span>
                                </li>
                                <li class="flex space-x-3">
                                    <svg class="flex-shrink-0 w-5 h-5 text-pink-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">Điều hòa</span>
                                </li>
                                <li class="flex space-x-3">
                                    <svg class="flex-shrink-0 w-5 h-5 text-pink-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">Nóng lạnh</span>
                                </li>
                                <li class="flex space-x-3">
                                    <svg class="flex-shrink-0 w-5 h-5 text-pink-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">${roomCategory.desk_number} bàn học</span>
                                </li>
                                <li class="flex space-x-3 <c:if test="${!roomCategory.is_balcony}">line-through decoration-gray-500</c:if>">
                                        <svg class="flex-shrink-0 w-5 h-5
                                        <c:choose>
                                            <c:when test="${roomCategory.is_balcony}">
                                                text-pink-600
                                            </c:when> 
                                            <c:otherwise>
                                                text-gray-400
                                            </c:otherwise>  
                                        </c:choose>" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">Ban công</span>
                                </li>
                                <li class="flex space-x-3 <c:if test="${!roomCategory.is_kitchen}">line-through decoration-gray-500</c:if>">
                                        <svg class="flex-shrink-0 w-5 h-5
                                        <c:choose>
                                            <c:when test="${roomCategory.is_kitchen}">
                                                text-pink-600
                                            </c:when> 
                                            <c:otherwise>
                                                text-gray-400
                                            </c:otherwise>  
                                        </c:choose>" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">Phòng bếp</span>
                                </li>
                                <li class="flex space-x-3 <c:if test="${!roomCategory.is_window}">line-through decoration-gray-500</c:if>">
                                        <svg class="flex-shrink-0 w-5 h-5
                                        <c:choose>
                                            <c:when test="${roomCategory.is_window}">
                                                text-pink-600
                                            </c:when> 
                                            <c:otherwise>
                                                text-gray-400
                                            </c:otherwise>  
                                        </c:choose>" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                    <span class="text-base font-normal leading-tight text-gray-500">Cửa sổ</span>
                                </li>
                            </ul>
                            <button type="button" class="text-white bg-pink-600 hover:bg-pink-700 focus:ring-4 focus:ring-blue-200 font-medium rounded-lg text-sm px-5 py-2.5 inline-flex justify-center w-full text-center">Liên hệ</button>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="mt-20">
                <footer class="p-4 bg-white rounded-lg shadow md:px-6 md:py-8">
                    <div class="sm:flex sm:items-center sm:justify-between">
                        <a href="https://flowbite.com" class="flex items-center mb-4 sm:mb-0">
                            <img src="https://flowbite.com/docs/images/logo.svg" class="mr-3 h-8" alt="Flowbite Logo" />
                            <span class="self-center text-2xl font-semibold whitespace-nowrap">Flowbite</span>
                        </a>
                        <ul class="flex flex-wrap items-center mb-6 text-sm text-gray-500 sm:mb-0">
                            <li>
                                <a href="#" class="mr-4 hover:underline md:mr-6 ">About</a>
                            </li>
                            <li>
                                <a href="#" class="mr-4 hover:underline md:mr-6">Privacy Policy</a>
                            </li>
                            <li>
                                <a href="#" class="mr-4 hover:underline md:mr-6 ">Licensing</a>
                            </li>
                            <li>
                                <a href="#" class="hover:underline">Contact</a>
                            </li>
                        </ul>
                    </div>
                    <hr class="my-6 border-gray-200 sm:mx-auto lg:my-8" />
                    <span class="block text-sm text-gray-500 sm:text-center">© 2022 <a href="https://flowbite.com" class="hover:underline">Flowbite™</a>. All Rights Reserved.
                    </span>
                </footer>
            </div>
        </div>
        <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>
    </body>
</html>
