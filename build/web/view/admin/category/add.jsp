<%-- 
    Document   : edit
    Created on : Feb 27, 2022, 2:41:37 AM
    Author     : lanh0
--%>

<%@page import="model.RoomCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BedCategory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Page</title>
        <%
            ArrayList<BedCategory> bedCategorys = (ArrayList<BedCategory>) request.getAttribute("bedCategorys");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5 flex justify-center items-center min-h-screen">
                <form style="width: 500px" id="form-edit" class="border border-gray-500 rounded-lg p-10">
                    <div id="error" class="hidden">
                        <div id="error-content" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                        </div>
                    </div>
                    <div id="success" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                        <span id="success-content" class="font-medium"></span>
                    </div>
                    <div class="mb-6">
                        <label for="bedCategory" class="block mb-2 text-sm font-medium text-gray-900">Bed category</label>
                        <select id="bedCategory" name="bedCategory" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                            <c:forEach items="${bedCategorys}" var="bedCategory">
                                <option value="${bedCategory.getId()}">${bedCategory.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-6">
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Name category</label>
                        <input required type="text" id="name" name="name"  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                    </div>
                    <div class="mb-6">
                        <label for="unit_price" class="block mb-2 text-sm font-medium text-gray-900">Price</label>
                        <input required type="number" id="unit_price" name="unit_price" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                    </div>
                    <div class="mb-6">
                        <label for="areage" class="block mb-2 text-sm font-medium text-gray-900">Areage</label>
                        <input required type="number" id="areage" name="areage"  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                    </div>
                    <div class="mb-6">
                        <label for="desk_number" class="block mb-2 text-sm font-medium text-gray-900">Desk number</label>
                        <input required type="number" id="desk_number" name="desk_number" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                    </div>
                    <div class="mb-6">
                        <label for="floor_number" class="block mb-2 text-sm font-medium text-gray-900">Floor number</label>
                        <input required type="number" id="floor_number" name="floor_number"  class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                    </div>
                    <div class="flex space-x-4">
                        <div class="flex items-center mb-6">
                            <input id="is_window" value="true" name="is_window" aria-describedby="is_window" type="checkbox" class="w-4 h-4 text-pink-600 bg-pink-100 rounded border-pink-300 focus:ring-pink-500">
                            <label for="is_window" class="ml-3 text-sm font-medium text-gray-900">window</label>
                        </div>
                        <div class="flex items-center mb-6">
                            <input id="is_balcony" value="true" name="is_balcony" aria-describedby="is_balcony" type="checkbox" class="w-4 h-4 text-pink-600 bg-pink-100 rounded border-pink-300 focus:ring-pink-500">
                            <label for="is_balcony" class="ml-3 text-sm font-medium text-gray-900">balcony</label>
                        </div>
                        <div class="flex items-center mb-6">
                            <input id="is_kitchen" value="true" name="is_kitchen" aria-describedby="is_kitchen" type="checkbox" class="w-4 h-4 text-pink-600 bg-pink-100 rounded border-pink-300 focus:ring-pink-500">
                            <label for="is_kitchen" class="ml-3 text-sm font-medium text-gray-900">kitchen</label>
                        </div>
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
                name: $("#name").val(),
                bedCategory: $("#bedCategory").val(),
                unit_price: $("#unit_price").val(),
                areage: $("#areage").val(),
                desk_number: $("#desk_number").val(),
                floor_number: $("#floor_number").val(),
                is_window: $("#is_window").is(":checked"),
                is_balcony: $("#is_balcony").is(":checked"),
                is_kitchen: $("#is_kitchen").is(":checked"),
            }
            console.log(data);
            $.ajax({
                method: "POST",
                url: "/admin/room/category/add",
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
                    location.pathname = "/admin/room/category";         
                }
            })
        })
    </script>
</body>
<jsp:include page="../base/footer.jsp" />
</html>
