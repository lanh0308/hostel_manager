<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:56:49 PM
    Author     : lanh0
--%>

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
            ArrayList<BedCategory> bedCategorys = (ArrayList<BedCategory>) request.getAttribute("bedCategorys");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="mb-6 flex justify-end">
                    <a href="/admin/bedcategory/add" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add category</a>
                </div>
                <div class="w-full grid lg:grid-cols-4 xl:grid-cols-6 gap-4">
                    <c:forEach items="${bedCategorys}" var="item">
                        <div class="max-w-sm bg-white rounded-lg border border-gray-200 shadow-md">
                            <div class="flex justify-end px-4 pt-4">
                                <button id="dropdownButton" data-dropdown-toggle="dropdown-${item.getId()}" class="hidden sm:inline-block text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-gray-200 rounded-lg text-sm p-1.5" type="button">
                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z"></path></svg>
                                </button>
                                <div id="dropdown-${item.getId()}" class="hidden z-10 w-44 text-base list-none bg-white rounded divide-y divide-gray-100 shadow ">
                                    <ul class="py-1" aria-labelledby="dropdownButton">
                                        <li>
                                            <a href="/admin/bedcategory/edit?id=${item.getId()}" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 ">Edit</a>
                                        </li>
                                        <li>
                                            <a href="/admin/bedcategory/delete?id=${item.getId()}" class="block py-2 px-4 text-sm text-red-600 hover:bg-gray-100">Delete</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="flex flex-col items-center pb-10">
                                <h3 class="mb-1 text-xl font-medium text-gray-900">${item.getName()}</h3>
                                <span class="text-sm text-gray-500">${item.getId()}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../base/footer.jsp" />
</html>
