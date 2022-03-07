<%-- 
    Document   : edit
    Created on : Feb 27, 2022, 2:41:37 AM
    Author     : lanh0
--%>

<%@page import="model.RoomRental"%>
<%@page import="model.Service"%>
<%@page import="model.ServiceCategory"%>
<%@page import="model.RoomCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BedCategory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <%
            ArrayList<ServiceCategory> serviceCategorys = (ArrayList<ServiceCategory>) request.getAttribute("serviceCategorys");
            RoomRental roomRental =(RoomRental) request.getAttribute("roomRental");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5 ">
                <div class="mb-6">
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center text-xl">
                                <a href="/dashboard" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
                                    Dashboard
                                </a>
                            </li>
                            <li class="inline-flex items-center text-xl">
                                <a href="/admin/rental" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900">
                                    <svg class="w-6 h-6 text-xl" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    Rental
                                </a>
                            </li>
                            <li aria-current="page">
                                <div class="flex items-center">
                                    <svg class="w-6 h-6 text-gray-400 text-xl" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-400 md:ml-2 dark:text-gray-500" id="category-show-name"> Edit</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="flex justify-center items-center min-h-screen">
                    <form style="width: 500px" id="form-edit">
                        <input id="id" name="id" value="${roomRental.id}" type="hidden"/>
                        <div id="error" class="hidden">
                            <div id="error-content" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                            </div>
                        </div>
                        <div id="success" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                            <span id="success-content" class="font-medium"></span>
                        </div>
                        <div class="mb-6">
                            <label for="service_category" class="block mb-2 text-sm font-medium text-gray-900">Service Category</label>
                            <select id="service_category" name="service_category" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                <c:forEach items="${serviceCategorys}" var="service_category">
                                    <c:choose>
                                        <c:when test="${service.service_category.id==service_category.id}">
                                            <option value="${service_category.id}" selected>${service_category.name}</option>
                                        </c:when>    
                                        <c:otherwise>
                                            <option value="${service_category.id}">${service_category.name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label for="start_date" class="block mb-2 text-sm font-medium text-gray-900">Start Date</label>
                            <input required type="date" id="start_date" name="start_date"  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="end_date" class="block mb-2 text-sm font-medium text-gray-900">End Date</label>
                            <input required type="date" id="end_date" name="end_date" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="old_indicator" class="block mb-2 text-sm font-medium text-gray-900">Old Indicator</label>
                            <input required type="number" id="old_indicator" name="old_indicator""  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="new_indicator" class="block mb-2 text-sm font-medium text-gray-900">New Indicator</label>
                            <input required type="number" id="new_indicator" name="new_indicator"  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            $("#form-edit").on("submit", function(e){
            e.preventDefault();
            const data = {
                    id: $("#id").val(),
                    service_category: $("#service_category").val(),
                    start_date: $("#start_date").val(),
                    end_date: $("#end_date").val(),
                    old_indicator: $("#old_indicator").val(),
                    new_indicator: $("#new_indicator").val(),
            }
            console.log(data);
                $.ajax({
                    method: "POST",
                    url: "/admin/rental/service/add",
                    data: data,
                    statusCode: {
                    404: function() {
                            $("#success").addClass("hidden")
                            $('#error-content').text("Page not found");
                            $("#error").removeClass("hidden")
                    },
                    500: function(){
                            $("#success").addClass("hidden")
                            $('#error-content').text("Server error");
                            $("#error").removeClass("hidden")
                        }
                    }
                }).done(function(data){
                    if (data?.detailMessage) {
                        $("#success").addClass("hidden")
                         $('#error-content').text(data?.detailMessage);
                        $("#error").removeClass("hidden")
                    } else{
                        $("#error").addClass("hidden")
                        $('#success-content').text("Add success");
                        $("#success").removeClass("hidden")
                        location.href="/admin/rental/detail?id=${roomRental.id}";
                    }
                })
            })
        </script>
    </body>
    <jsp:include page="../base/footer.jsp" />
</html>
