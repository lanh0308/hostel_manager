<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:56:49 PM
    Author     : lanh0
--%>

<%@page import="model.Pagination"%>
<%@page import="model.Room"%>
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
            ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
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
                <h3 class="mt-5 mb-10 text-5xl text-center">Report</h3>

                <div class="mb-5">
                    <form class="flex items-center" method="get" action="/admin/report">
                        <div class="mr-3">
                            <input type="text" id="search" name="search" placeholder="search..." class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mr-3">
                            <select id="status" name="status" class="w-[150px] bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                <option value="">status</option>
                                <option value="pending">pending</option>
                                <option value="approved">approved</option>
                                <option value="rejected">rejected</option>
                            </select>
                        </div>
                        <button class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">search</button>
                    </form>
                </div>
                <div class="flex flex-col">
                    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                            <div class="overflow-hidden shadow-md sm:rounded-lg">
                                <table class="min-w-full">
                                    <thead class="bg-pink-300">
                                        <tr>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                room
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                customer
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                title
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                content
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                created
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                process Note
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                status
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                updated
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${reports}" var="report">
                                            <tr class="bg-white border-b">
                                                <td class="py-4 px-6 text-sm font-medium text-red-600">
                                                    P${report.room.name}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900">
                                                    ${report.customer.name}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900">
                                                    ${report.title}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900">
                                                    ${report.content}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                    ${report.created}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900" id="process_note-content-${report.id}">
                                                    ${report.process_note}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 text-green-600 uppercase whitespace-nowrap" id="status-content-${report.id}">
                                                    ${report.status}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                    ${report.updated}
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-right whitespace-nowrap flex space-x-4">
                                                    <button data-id="${report.id}" 
                                                            onclick="openModel({
                                                                        id: ${report.id},
                                                                        room: `${report.room.name}`,
                                                                        customer: `${report.customer.name}`,
                                                                        title: `${report.title}`,
                                                                        content: `${report.content}`,
                                                                        process_note: `${report.process_note}`,
                                                                        status: `${report.status}`,
                                                                    })" class="text-pink-600 hover:underline">
                                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                                                    </button>
                                                    <a href="/admin/report/delete?id=${report.id}" class="text-red-600 hover:underline">
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
                <button id="button-open-modal" class="hidden none text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center" type="button" data-modal-toggle="report-modal">
                    report modal
                </button>

                <!-- Main modal -->
                <div id="report-modal" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
                    <div class="relative px-4 w-full max-w-md h-full md:h-auto">
                        <!-- Modal content -->
                        <div class="relative bg-white rounded-lg shadow">
                            <div class="flex justify-end p-2">
                                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="report-modal">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                </button>
                            </div>
                            <form class="px-6 pb-4 space-y-6 lg:px-8 sm:pb-6 xl:pb-8" action="/admin/report/edit" method="post" id="from-report-edit">
                                <input type="hidden" id="id" name="id"/>
                                <div class="mb-6">
                                    <label for="room" class="block mb-2 text-sm font-medium text-gray-900">Room</label>
                                    <input required type="text" id="room" name="room" value="" disabled class="disabled bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                </div>
                                <div class="mb-6">
                                    <label for="customer" class="block mb-2 text-sm font-medium text-gray-900">Customer</label>
                                    <input required type="text" id="customer" name="customer" value="" disabled class="disabled bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                </div>
                                <div class="mb-6">
                                    <label for="title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                                    <input required type="text" id="title" name="title" disabled class="disabled bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                </div>
                                <div class="mb-6">
                                    <label for="content" class="block mb-2 text-sm font-medium text-gray-900">Content</label>
                                    <textarea required id="content" rows="5" name="content" disabled class="disabled block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500" placeholder="process note..."></textarea>
                                </div>
                                <div class="mb-6">
                                    <label for="status-form" class="block mb-2 text-sm font-medium text-gray-900">Bed category</label>
                                    <select id="status-form" name="status" required class="bg-gray-50 border border-pink-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                                        <option value="pending">pending</option>
                                        <option value="approved">approved</option>
                                        <option value="rejected">rejected</option>
                                    </select>
                                </div>
                                <div class="mb-6">
                                    <label for="process_note" class="block mb-2 text-sm font-medium text-gray-900">Process note</label>
                                    <textarea required id="process_note" rows="8" name="process_note" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500" placeholder="process note..."></textarea>
                                </div>
                                <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                            </form>
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
    <script>
        function openModel(report) {
            $("#room").val(report.room);
            $("#customer").val(report.customer);
            $("#title").val(report.title);
            $("#content").val(report.content);
            $("#button-open-modal").click();
            $("#id").val(report.id);
            $("#process_note").val(report.process_note);
            $("#status-form").val(report.status.toLowerCase());
        }

        $("#from-report-edit").on("submit", function (e) {
            e.preventDefault();
            const data = {
                id: $("#id").val(),
                process_note: $("#process_note").val(),
                status: $("#status-form").val(),
            }
            console.log(data);
            $.ajax({
                method: "post",
                url: "/admin/report/edit",
                data: data,
            }).done(function (data) {
                $("#process_note-content-" + data.id).text(data.process_note)
                $("#status-content-" + data.id).text(data.status)
                $("#button-open-modal").click();
            })
        })
    </script>
    <jsp:include page="../base/footer.jsp" />
</html>
