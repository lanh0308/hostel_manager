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
            int i = 1;
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
                            <div class="overflow-hidden shadow-md sm:rounded-lg">
                                <table class="min-w-full">
                                    <thead class="bg-pink-50">
                                        <tr>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Id
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Name
                                            </th>
                                            <th scope="col" class="relative py-3 px-6">
                                                <span class="sr-only">Edit</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${bedCategorys}" var="bedCategory">
                                            <tr class="bg-white border-b">
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                    ${bedCategory.getId()}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap">
                                                     ${bedCategory.getName()}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-right whitespace-nowrap">
                                                    <a href="#" class="text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
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
