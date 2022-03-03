<%-- 
    Document   : edit
    Created on : Feb 22, 2022, 6:56:40 PM
    Author     : lanh0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add category Page</title>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="flex justify-center items-center" style="height: 80vh">
                    <form style="width: 500px" action="/admin/service/category/add" method="post">
                        <div class="mb-6">
                            <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Name</label>
                            <input required type="text" id="name" name="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="price" class="block mb-2 text-sm font-medium text-gray-900">Price</label>
                            <input required type="number" id="price" name="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>
