<%-- 
    Document   : list
    Created on : Mar 14, 2022, 3:30:57 AM
    Author     : lanh0
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Report"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.4/dist/flowbite.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%
            ArrayList<Report> reports = (ArrayList<Report>) request.getAttribute("reports");
        %>
    </head>
    <body>
        <div class="container mx-auto">
            <div class="flex justify-between items-center">
                    <div>
                        <h2 class="mt-10 mb-10 text-5xl text-center">Report</h2>
                    </div>
                    <div class="flex justify-end space-x-4">
                        <a href="/view" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">View</a>
                        <a href="/history" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">History</a>
                        <a href="/report" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Report</a>
                        <a href="/logout" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Logout</a>
                    </div>
                </div>
            
            <div class="flex flex-col">
                <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
                        <div class="flex justify-between items-center">
                             <div class="mb-6 flex">
                                <a href="/history" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Back</a>
                            </div>
                            <div class="mb-6 flex justify-end">
                                <a href="/report/create" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Create report</a>
                            </div>
                        </div>
                        <div class="overflow-hidden shadow-md sm:rounded-lg">
                            <table class="min-w-full">
                                <thead class="bg-pink-50">
                                    <tr>
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
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${reports}" var="report">
                                    <tr class="bg-white border-b">
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900">
                                            ${report.title}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900">
                                            ${report.content}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            ${report.created}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900">
                                            ${report.process_note}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 text-green-600 uppercase whitespace-nowrap">
                                            ${report.status}
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            ${report.updated}
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
        <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>
    </body>
</html>
