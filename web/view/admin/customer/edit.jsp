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
        <title>Edit rental Page</title>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="flex justify-center items-center" style="min-height: 93vh">
                    <form style="width: 500px" action="/admin/rental/customer/edit" method="post" class="border border-gray-500 rounded-lg p-10">
                        <c:if test="${requestScope.success!=null}">
                            <div id="success" class="p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                                <span id="success-content" class="font-medium">${requestScope.success}</span>
                            </div>
                        </c:if>
                        <input id="id" name="id" value="${requestScope.customer.id}" type="hidden"/>
                        <div class="mb-6">
                            <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Name customer</label>
                            <input required type="text" id="name" value="${requestScope.customer.name}" name="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="phone_number" class="block mb-2 text-sm font-medium text-gray-900">phone number</label>
                            <input required type="text" id="phone_number" value="${requestScope.customer.phone_number}" name="phone_number" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="address" class="block mb-2 text-sm font-medium text-gray-900">Address</label>
                            <input required type="text" id="address" value="${requestScope.customer.address}" name="address" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email</label>
                            <input required type="email" id="email"  value="${requestScope.customer.email}" name="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <div class="mb-6">
                            <label for="cmnd" class="block mb-2 text-sm font-medium text-gray-900">cmnd</label>
                            <input required type="text" id="cmnd" name="cmnd" value="${requestScope.customer.cmnd}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5">
                        </div>
                        <button type="submit" class="text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>

