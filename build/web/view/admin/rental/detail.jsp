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
            ArrayList<Date> start_dates = (ArrayList<Date>) request.getAttribute("start_dates");
            ArrayList<Date> end_dates = (ArrayList<Date>) request.getAttribute("end_dates");

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
                        <form form="/admin/rental/detail?id=2" method="GET" class="flex items-center">
                            <input type="hidden" id="id" value="${roomRental.id}" name="id"/>
                            <div>
                                <select id="start_date" name="start_date" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-[120px] p-2.5">
                                    <option value="">Start date</option>
                                    <c:forEach items="${start_dates}" var="start_date">
                                        <option value="${start_date}">${start_date}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="ml-3">
                                <select id="end_date" name="end_date" class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-[120px] p-2.5">
                                    <option value="">End date</option>
                                    <c:forEach items="${end_dates}" var="end_date">
                                        <option value="${end_date}">${end_date}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button type="submit" class="ml-2 inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Search</button>
                        </form>
                    </div>
                    <div class="flex justify-end">
                        <!--<a href="/admin/rental/service/add?id=${roomRental.id}" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add service</a>-->
                        <button onclick="openAddServiceFrom(${roomRental.id})" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add service</button>
                    </div>
                </div>
                <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                        <div class="overflow-hidden shadow-md sm:rounded-lg">
                            <table class="min-w-full">
                                <thead class="bg-pink-300">
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
                                            <a href="/admin/rental/customer/edit?id=${roomRental.customer.id}" class="text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
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
                        <div class="mb-10 w-full">
                            <div class="flex w-full">
                                <div class="flex space-x-4">
                                    <p class="text-xl font-medium">Time: ${service.key}</p>
                                    <p class="text-xl font-medium">Price: <span id="price-${service.key}">${roomRental.getToltalPriceByDate(service.key)}</span></p>
                                    <script>
                                        var price = Number.parseInt($("#price-${service.key}").text());
                                        price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                        $("#price-${service.key}").text(price);
                                    </script>
                                </div>
                                <div class="ml-auto flex items-center">
                                    <input  data-name="payment-${service.key}[]" id="payment-${service.key}" onchange="paymentAllChange(this)" type="checkbox" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300">
                                    <label for="payment-${service.key}" class="ml-2 font-medium text-gray-900">Thanh to??n</label>
                                </div>
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
                                                        unit price
                                                    </th>
                                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                        quantity
                                                    </th>
                                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                        price
                                                    </th>
                                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase dark:text-gray-400">
                                                        payment
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
                                                            <c:choose>
                                                                <c:when test="${item.service_category.id == 1 || item.service_category.id==2}">
                                                                    ${item.old_indicator}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    -
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap ">
                                                            <c:choose>
                                                                <c:when test="${item.service_category.id == 1 || item.service_category.id==2}">
                                                                    ${item.new_indicator}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    -
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap " id="unit-price-${item.id}">
                                                            ${item.service_category.unit_price}
                                                        </td>
                                                <script>
                                                    var money = ${item.service_category.unit_price};
                                                    money = money.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                                    $("#unit-price-${item.id}").text(money);
                                                </script>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap ">
                                                    <c:choose>
                                                        <c:when test="${item.service_category.id == 1 || item.service_category.id==2}">
                                                            ${item.new_indicator - item.old_indicator }
                                                        </c:when>
                                                        <c:otherwise>
                                                            1
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap " id="price-service-${item.id}">
                                                    ${item.getPrice()}
                                                </td>
                                                <script>
                                                    var money = ${item.getPrice()};
                                                    money = money.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                                    $("#price-service-${item.id}").text(money);
                                                </script>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap ">
                                                    <c:choose>
                                                        <c:when test="${item.state}">
                                                            <input name="payment-${service.key}[]" data-payment="${service.key}" onchange="paymentChange(this)" value="${item.id}" type="checkbox" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300" checked>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input name="payment-${service.key}[]" data-payment="${service.key}" onchange="paymentChange(this)" value="${item.id}" type="checkbox" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium flex space-x-4 whitespace-nowrap">
                                                    <a href="/admin/rental/service/edit?id=${item.id}" class="text-pink-600 hover:underline">
                                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                                                    </a>
                                                    <a href="/admin/rental/service/delete?id=${item.id}" class="text-red-600 hover:underline">
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
                    </c:forEach>
                </div>
            </div>
            <div class="mt-10 w-full flex justify-center">
                <nav aria-label="Page navigation example">
                    <ul class="flex items-center -space-x-px">
                        <li>
                            <a data="<%=pagination.getPrev()%>" class="cursor-pointer flex page-link py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                                <svg class="mr-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd"></path></svg>
                                Prev
                            </a>
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
                            <a data="<%=pagination.getNext()%>"  class="cursor-pointer flex page-link py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                                Next
                                <svg class="ml-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <button id="button-add-servide-modal" class="hidden none text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center" type="button" data-modal-toggle="add-servide-modal">
                report modal
            </button>

            <!-- Main modal -->
            <div id="add-servide-modal" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
                <div class="relative px-4 min-w-xl h-full md:h-auto">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow">
                        <div class="flex justify-end p-2">
                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="add-servide-modal">
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                            </button>
                        </div>
                        <div class="p-10">
                            <jsp:include page="addService.jsp" />
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
    <script>
        const url_string = window.location.href;
        const url = new URL(url_string);
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
    <script>
        const openAddServiceFrom = (id) => {
            $("#button-add-servide-modal").click();
            $("#id").val(id);
        };

        <c:forEach items="${roomRental.services}" var="service">
        var quantity = 0;
        $("input[name='payment-${service.key}[]']").each(function (item) {
            if ($(this).is(":checked")) {
                quantity++;
            }
        })
        if ($("input[name='payment-${service.key}[]']").length == quantity) {
            $("#payment-${service.key}").prop('checked', true);
        }
        </c:forEach>
        const paymentAllChange = (e) => {
            const name = $(e).attr("data-name");
            const isChecked = $(e).is(':checked');
            const data = {
                payment: [],
                state: isChecked,
            };
            $("input[name='" + name + "']").each(function (item) {
                $(this).prop('checked', isChecked);
                data.payment.push($(this).val());
            })
            $.ajax({
                method: "post",
                url: "/admin/rental/service/state/update",
                data: data,
            }).done(function (data) {

            })
        }

        const paymentChange = (e) => {
            const data = {
                payment: [$(e).val()],
                state: $(e).is(':checked'),
            };
            var quantity = 0;
            $("input[name='" + $(e).attr("name") + "']").each(function (item) {
                if ($(this).is(":checked")) {
                    quantity++;
                }
            })
            if ($("input[name='" + $(e).attr("name") + "']").length == quantity) {
                $("#payment-" + $(e).attr("data-payment")).prop('checked', true)
            } else {
                $("#payment-" + $(e).attr("data-payment")).prop('checked', false)
            }
            $.ajax({
                method: "post",
                url: "/admin/rental/service/state/update",
                data: data,
            }).done(function (data) {

            })
        }
    </script>
    <jsp:include page="../base/footer.jsp" />
</body>
</html>
