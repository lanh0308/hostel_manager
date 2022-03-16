<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:56:49 PM
    Author     : lanh0
--%>

<%@page import="model.Pagination"%>
<%@page import="model.RoomRental"%>
<%@page import="model.Service"%>
<%@page import="model.ServiceCategory"%>
<%@page import="model.RoomCategory"%>
<%@page import="model.BedCategory"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bed Category</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%
            ArrayList<RoomRental> roomRentals = (ArrayList<RoomRental>) request.getAttribute("roomRentals");
            Pagination pagination = (Pagination) request.getAttribute("pagination");
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
                            <div class="mb-3">
                                <div class="flex justify-between items-center">
                                    <form class="flex items-center" method="GET" action="/admin/rental">
                                        <input type="text" id="search" name="search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                        <button type="submit" class="ml-3 inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Search</button>
                                    </form>
                                    <div class="flex items-center space-x-3">
                                       
                                        <a href="/admin/rental/add" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add rental</a>
                                    </div>
                                </div>
                            </div>
                            <div class="overflow-hidden shadow-md sm:rounded-lg">
                                <table class="min-w-full">
                                    <thead class="bg-pink-50">
                                        <tr>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Id
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Room name
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Customer name
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Email
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Phone
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Category
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Room Price
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Area
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Floor
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Window
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Balcony
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Kitchen
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Desk
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Deposit Money
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Start Date
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                End Date
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                State
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${roomRentals}" var="roomRental">
                                            <tr class="bg-white border-b">
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 font-medium whitespace-nowrap">
                                                    ${roomRental.id}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                                    ${roomRental.room.name}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                                    ${roomRental.customer.name}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                                    ${roomRental.customer.email}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                                    ${roomRental.customer.phone_number}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                                    ${roomRental.room.roomCategory.name}
                                                </td>
                                                <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap" id="price-${roomRental.id}">
                                                    ${roomRental.room.roomCategory.unit_price}
                                                </td>
                                        <script>
                                            var price = ${roomRental.room.roomCategory.unit_price};
                                            price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#price-${roomRental.id}").text(price);
                                        </script>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            ${roomRental.room.roomCategory.areage}m&sup2;
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            ${roomRental.room.roomCategory.floor_number}
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            <c:choose>
                                                <c:when test="${roomRental.room.roomCategory.is_window}">
                                                    Có
                                                </c:when>
                                                <c:otherwise>
                                                    Không
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            <c:choose>
                                                <c:when test="${roomRental.room.roomCategory.is_balcony}">
                                                    Có
                                                </c:when>
                                                <c:otherwise>
                                                    Không
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            <c:choose>
                                                <c:when test="${roomRental.room.roomCategory.is_kitchen}">
                                                    Có
                                                </c:when>
                                                <c:otherwise>
                                                    Không
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            ${roomRental.room.roomCategory.desk_number}
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap" id="money-${roomRental.id}">
                                            ${roomRental.deposit_money}
                                        </td>
                                        <script>
                                            var money = ${roomRental.deposit_money};
                                            money = money.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#money-${roomRental.id}").text(money);
                                        </script>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            ${roomRental.start_date}
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            ${roomRental.end_date}
                                        </td>
                                        <td class="py-4 px-6 text-sm text-gray-900 font-medium whitespace-nowrap">
                                            <jsp:useBean id="now" class="java.util.Date" />
                                            <c:choose>
                                                <c:when test="${roomRental.state && roomRental.end_date.time gt now.time }">
                                                    Còn hiệu lực
                                                </c:when>
                                                <c:otherwise>
                                                    Hết hạn
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-right whitespace-nowrap flex space-x-4">
                                            <a href="/admin/rental/detail?id=${roomRental.id}" class="text-pink-600 hover:underline">
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
                                            </a>
                                            <a href="/admin/rental/edit?id=${roomRental.id}" class="text-pink-600 hover:underline">
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                                            </a>
                                            <a href="/admin/rental/delete?id=${roomRental.id}" class="text-red-600 hover:underline">
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
    </body>
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
    <jsp:include page="../base/footer.jsp" />
</html>
