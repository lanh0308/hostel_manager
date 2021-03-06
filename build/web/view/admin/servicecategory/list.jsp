<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:56:49 PM
    Author     : lanh0
--%>

<%@page import="model.ServiceCategory"%>
<%@page import="model.RoomCategory"%>
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
            ArrayList<ServiceCategory> serviceCategorys = (ArrayList<ServiceCategory>) request.getAttribute("serviceCategorys");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="flex flex-col">
                    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                            <div>
                                <div class="mb-6 flex justify-end">
                                    <a href="/admin/service/category/add" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add category</a>
                                </div>
                            </div>
                            <div class="overflow-hidden shadow-md sm:rounded-lg">
                                <table class="min-w-full">
                                    <thead class="bg-pink-300">
                                        <tr>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Id
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Name
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                               Price
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                               Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${serviceCategorys}" var="serviceCategory">
                                            <tr class="bg-white border-b">
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                    ${serviceCategory.id}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap">
                                                    ${serviceCategory.name}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap" id="price-${serviceCategory.id}">
                                                    ${serviceCategory.unit_price}
                                                    <script>
                                                        var price = ${serviceCategory.unit_price};
                                                        price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                                        $("#price-${serviceCategory.id}").text(price);
                                                    </script>
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-right whitespace-nowrap flex space-x-4">
                                                    <a href="/admin/service/category/edit?id=${serviceCategory.id}" class="text-pink-600 hover:underline">
                                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                                                    </a>
                                                    <a href="/admin/service/category/delete?id=${serviceCategory.id}" class="text-red-600 hover:underline">
                                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../base/footer.jsp" />
</html>
