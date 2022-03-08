<%-- 
    Document   : detail
    Created on : Mar 6, 2022, 5:22:30 AM
    Author     : lanh0
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pagination"%>
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
            Pagination pagination = (Pagination) request.getAttribute("pagination");
            ArrayList<Date> start_dates = (ArrayList<Date>)request.getAttribute("start_dates");
            ArrayList<Date> end_dates = (ArrayList<Date>)request.getAttribute("end_dates");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <div class="flex">
        <div class="w-64  bg-gray-50">
            <jsp:include page="../navbar/navbar.jsp" />
        </div>
        <div class="w-full px-10 py-5">
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
                                <span class="ml-1 text-sm font-medium text-gray-400 md:ml-2 dark:text-gray-500" id="category-show-name"> ${roomRental.room.name}</span>
                            </div>
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="flex flex-col mb-6 ">
                <div class="flex justify-between items-center">
                    <div>
                        <label for="table-search" class="sr-only">Search</label>
                        <form form="/admin/rental/detail?id=2" method="GET">
                            <input type="hidden" id="id" value="${roomRental.id}" name="id"/>
                            <div class="relative mt-1">
                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                    <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
                                </div>
                                <input type="text" name="search" id="search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-80 pl-10 p-2.5" placeholder="Search date">
                            </div>
                        </form>
                    </div>
                    <div class="flex justify-end">
                        <a href="/admin/rental/service/add?id=${roomRental.id}" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add service</a>
                    </div>
                </div>
                <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                        <div class="overflow-hidden shadow-md sm:rounded-lg">
                            <table class="min-w-full">
                                <thead class="bg-pink-100">
                                    <tr>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            Room
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            Area
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            Start date
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                            End date
                                        </th>
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
                                            ${roomRental.room.name}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            ${roomRental.room.roomCategory.areage}m&sup2;
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            ${roomRental.start_date}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            ${roomRental.end_date}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            ${roomRental.customer.name}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium  text-gray-900 whitespace-nowrap ">
                                            ${roomRental.customer.phone_number}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium  text-gray-900 whitespace-nowrap ">
                                            ${roomRental.customer.address}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium  text-gray-900 whitespace-nowrap ">
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
                    <c:forEach items="${roomRental.services}" var="service">
                        <div class="mb-10">
                            <div class="flex space-x-4">
                                <p class="text-xl font-medium">Time: ${service.key}</p>
                                <p class="text-xl font-medium">Price: <span id="price-${service.key}">${roomRental.getToltalPriceByDate(service.key)}</span></p>
                                <script>
                                    var price = Number.parseInt($("#price-${service.key}").text());
                                    price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                    $("#price-${service.key}").text(price);
                                </script>
                            </div>
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
                                                <c:forEach items="${service.value}" var="item">
                                                    <tr class="bg-white border-b">
                                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                            ${item.service_category.name}
                                                        </td>
                                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap ">
                                                            ${item.start_date}
                                                        </td>
                                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap ">
                                                            ${item.end_date}
                                                        </td>
                                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap ">
                                                            ${item.old_indicator}
                                                        </td>
                                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap ">
                                                            ${item.new_indicator}
                                                        </td>
                                                        <td class="py-4 px-6 text-sm font-medium whitespace-nowrap">
                                                            <a href="/admin/rental/service/edit?id=${item.id}" class="text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                                                            <a href="/admin/rental/service/delete?id=${item.id}" class="ml-6 text-red-600 dark:text-red-500 hover:underline">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="mt-10 w-full flex justify-center">
                <nav aria-label="Page navigation example">
                    <ul class="inline-flex -space-x-px">
                        <li>
                            <a data="<%=pagination.getPrev()%>" class="page-link py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">Previous</a>
                        </li>
                        <c:if test="${pagination.getPageIndex()>2}">
                            <li>
                                <a  data="<%=pagination.getPageIndex() - 2%>" class="page-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"><%=pagination.getPageIndex() - 2%></a>
                            </li>
                        </c:if>
                        <c:if test="${pagination.getPageIndex()>1}">
                            <li>
                                <a data="<%=pagination.getPageIndex() - 1%>" class="page-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"><%=pagination.getPageIndex() - 1%></a>
                            </li>
                        </c:if>
                        <li>
                            <a  data="<%=pagination.getPageIndex()%>" aria-current="page" class="page-link py-2 px-3 text-blue-600 bg-blue-50 border border-gray-300 hover:bg-blue-100 hover:text-blue-700"><%=pagination.getPageIndex()%></a>
                        </li>
                        <c:if test="${pagination.getPageIndex()<pagination.getCount()}">
                            <li>
                                <a data="<%=pagination.getPageIndex() + 1%>" class="page-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"><%=pagination.getPageIndex() + 1%></a>
                            </li>
                        </c:if>
                        <c:if test="${pagination.getPageIndex()+1<pagination.getCount()}">
                            <li>
                                <a  data="<%=pagination.getPageIndex() + 2%>" class="page-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"><%=pagination.getPageIndex() + 2%></a>
                            </li>
                        </c:if>
                        <li>
                            <a data="<%=pagination.getNext()%>"  class="page-link py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <script>
        const url_string = window.location.href;
        const url = new URL(url_string);
        const search = url.searchParams.get("q");
        const paginationLinks = document.querySelectorAll(".page-link");
        if (paginationLinks) {
            paginationLinks.forEach(item => {
                var search = location.search.substring(1);
                const params = search ? JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"')
                        .replace(/&/g, '","').replace(/=/g, '":"') + '"}') : {};
                const page = item.getAttribute("data");
                params.page = page;
                const href = new URLSearchParams(params).toString();
                item.setAttribute("href", "?" + href);
            })
        }
    </script>
    <jsp:include page="../base/footer.jsp" />
</body>
</html>
