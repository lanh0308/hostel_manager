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
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.4/dist/flowbite.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%
            RoomRental roomRental = (RoomRental) request.getAttribute("roomRental");

            Pagination pagination = (Pagination) request.getAttribute("pagination");
            ArrayList<Date> start_dates = (ArrayList<Date>) request.getAttribute("start_dates");
            ArrayList<Date> end_dates = (ArrayList<Date>) request.getAttribute("end_dates");
        %>
    </head>
    <div>
        <div class="w-full px-10 py-5 mt-10">
            <div class="flex flex-col mb-6 ">
                <div class="flex justify-between items-center">
                    <div>
                        <form form="/history?id=2" method="GET" class="flex items-center">
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
                    <div class="flex justify-end space-x-4">
                        <a href="/view" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">View</a>
                        <a href="/history" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">History</a>
                        <a href="/report" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Report</a>
                        <a href="/logout" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">logout</a>
                    </div>
                </div>
                <div class="overflow-x-auto sm:-mx-6 lg:-mx-8 mt-5">
                    <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                        <div class="overflow-hidden shadow-md sm:rounded-lg">
                            <table class="min-w-full">
                                <thead class="bg-blue-400">
                                    <tr>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase ">
                                            Room
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase ">
                                            Area
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase">
                                            Start date
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase ">
                                            End date
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase ">
                                            Name
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase">
                                            Phone
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase">
                                        </th>
                                        <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-white uppercase ">
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
                                            P${roomRental.room.name}
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

                                </div>
                                <div class="ml-auto flex items-center">
                                    <input disabled data-name="payment-${service.key}[]" id="payment-${service.key}" onchange="paymentAllChange(this)" type="checkbox" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300">
                                    <label for="payment-${service.key}" class="ml-2 font-medium text-gray-900">Thanh to??n</label>
                                </div>
                            </div>

                            <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                                <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                                    <div class="overflow-hidden shadow-md sm:rounded-lg">
                                        <table class="min-w-full">
                                            <thead class="bg-pink-100 table-serive">
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
                                                            <input disabled name="payment-${service.key}[]" data-payment="${service.key}" onchange="paymentChange(this)" value="${item.id}" type="checkbox" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300" checked>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input disabled name="payment-${service.key}[]" data-payment="${service.key}" onchange="paymentChange(this)" value="${item.id}" type="checkbox" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="flex ml-auto justify-end mt-5 font-medium items-center">
                                        <div>
                                            <p class="texl-md text-red-600" id="checkout-${service.key}">Ch??a thanh to??n</p>
                                            <p class="text-xl font-medium">Total price: <span id="price-${service.key}">${roomRental.getToltalPriceByDate(service.key)}</span></p>
                                            <script>
                                                var price = Number.parseInt($("#price-${service.key}").text());
                                                price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                                $("#price-${service.key}").text(price);
                                            </script>
                                        </div>
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
        </div>
    </div>
    <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>                    
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
        <c:forEach items="${roomRental.services}" var="service">
        var quantity = 0;
        $("input[name='payment-${service.key}[]']").each(function (item) {
            if ($(this).is(":checked")) {
                quantity++;
            }
        })
        if ($("input[name='payment-${service.key}[]']").length == quantity) {
            $("#payment-${service.key}").prop('checked', true);
            $("#checkout-${service.key}").text("???? thanh to??n");
            $("#checkout-${service.key}").removeClass("text-red-600");
            $("#checkout-${service.key}").addClass("text-green-600");
        } else {
            $("#checkout-${service.key}").text("Ch??a thanh to??n");
            $("#checkout-${service.key}").removeClass("text-green-600");
            $("#checkout-${service.key}").addClass("text-red-600");
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
        }
    </script>
</body>
</html>
