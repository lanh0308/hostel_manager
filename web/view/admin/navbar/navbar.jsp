<%-- 
    Document   : navbar
    Created on : Feb 27, 2022, 8:53:08 PM
    Author     : lanh0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <aside class="w-64 fixed top-0 left-0 bg-pink-300 min-h-screen" aria-label="Sidebar" id="slidebar-menu">
            <div class="px-3 py-4 overflow-y-auto rounded mb-20">
                <ul class="space-y-2 w-full">
                    <li>
                        <a href="/dashboard" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500 ">
                            <span class="ml-3">Dashboard</span>
                        </a>
                    </li>
                     <li>
                        <a href="/admin/rental" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500">
                            <span class="flex-1 ml-3 whitespace-nowrap">Rental</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/bedcategory" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500">
                            <span class="flex-1 ml-3 whitespace-nowrap">Bed category</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/room/category" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500">
                            <span class="flex-1 ml-3 whitespace-nowrap">Room Category</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/service/category" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500">
                            <span class="flex-1 ml-3 whitespace-nowrap">Service category</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/room" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500">
                            <span class="flex-1 ml-3 whitespace-nowrap">Room</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/report" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500">
                            <span class="flex-1 ml-3 whitespace-nowrap">Report</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/logout" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg hover:border-b-2 border-rose-500">
                            <span class="flex-1 ml-3 whitespace-nowrap">Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
    </body>
</html>
