<%-- 
    Document   : detail
    Created on : Mar 6, 2022, 5:22:30 AM
    Author     : lanh0
--%>

<%@page import="model.RoomRental"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bed Category</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%
            RoomRental roomRental = (RoomRental) request.getAttribute("roomRental");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
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
                                <thead class="bg-pink-100">
                                    <tr>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            Name
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            phone
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            address
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            cmnd
                                        </th>
                                        <th scope="col" class="relative py-3 px-6">
                                            <span class="sr-only">Edit</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="bg-white border-b">
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            ${roomRental.customer.name}
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap ">
                                            ${roomRental.customer.phone_number}
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap ">
                                            ${roomRental.customer.address}
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap ">
                                            ${roomRental.customer.cmnd}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-right whitespace-nowrap">
                                            <a href="#" class="text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-10">
                <div class="flex flex-col">
                    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                            <div class="overflow-hidden shadow-md sm:rounded-lg">
                                <table class="min-w-full">
                                    <thead class="bg-pink-100">
                                        <tr>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                Name
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                start date
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                end date
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                old indicator
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                new indicator
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${roomRental.services}" var="service">
                                            <tr class="bg-white border-b">
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                    ${service.service_category.name}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap ">
                                                    ${service.start_date}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap ">
                                                    ${service.end_date}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap ">
                                                    ${service.old_indicator}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-500 whitespace-nowrap ">
                                                    ${service.new_indicator}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium whitespace-nowrap">
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
    </div>
    <jsp:include page="../base/footer.jsp" />
</body>
</html>
