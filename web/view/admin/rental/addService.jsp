<%-- 
    Document   : edit
    Created on : Feb 27, 2022, 2:41:37 AM
    Author     : lanh0
--%>

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
            Service service = (Service) request.getAttribute("service");
        %>
    </head>
    <body>
        <form style="width: 500px" id="form-add-service">
            <div id="error" class="hidden">
                <div id="error-content" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                </div>
            </div>
            <div id="success" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                <span id="success-content" class="font-medium"></span>
            </div>
            <input id="id" name="id" type="hidden"/>
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
                <input required type="date" id="start_date_add" name="start_date"  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
            </div>
            <div class="mb-6">
                <label for="end_date" class="block mb-2 text-sm font-medium text-gray-900">End Date</label>
                <input required type="date" id="end_date_add" name="end_date" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
            </div>
            <div class="mb-6">
                <label for="old_indicator" class="block mb-2 text-sm font-medium text-gray-900">Old Indicator</label>
                <input required type="number" id="old_indicator" name="old_indicator"  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
            </div>
            <div class="mb-6">
                <label for="new_indicator" class="block mb-2 text-sm font-medium text-gray-900">New Indicator</label>
                <input required type="number" id="new_indicator" name="new_indicator" value=""  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
            </div>
            <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
        </form>
        <script>
            $("#form-add-service").on("submit", function(e){
                e.preventDefault();
                const data = {
                    id: $("#id").val(),
                    service_category: $("#service_category").val(),
                    start_date: $("#start_date_add").val(),
                    end_date: $("#end_date_add").val(),
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
                                $('#success-content').text("Create success");
                                $("#success").removeClass("hidden")
                                location.reload();
                            }
                        })
            })
        </script>
    </body>
</html>
