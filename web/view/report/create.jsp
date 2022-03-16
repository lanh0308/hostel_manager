<%-- 
    Document   : add
    Created on : Mar 9, 2022, 7:05:57 PM
    Author     : lanh0
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.4/dist/flowbite.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="flex">
            
            <div class="w-full px-10 py-5">
                <div class="flex justify-center items-center" style="min-height: 93vh">
                    <form style="width: 500px" action="/report/create" method="post">
                        <div class="mb-6">
                            <label for="room" class="block mb-2 text-sm font-medium text-gray-900">Room</label>
                            <input required type="text" id="room" name="room" value="Phòng ${requestScope.roomRental.room.name}" disabled class="disabled bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="customer" class="block mb-2 text-sm font-medium text-gray-900">Customer</label>
                            <input required type="text" id="customer" name="customer" value="${requestScope.roomRental.customer.name}" disabled class="disabled bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                            <input required type="text" id="title" name="title" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="content" class="block mb-2 text-sm font-medium text-gray-900">Content</label>
                            <textarea required id="content" rows="10" name="content" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500" placeholder="content..."></textarea>
                        </div>
                        <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                        <button onclick="location.href='/report'" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Back</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>
    </body>
</html>

