<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:22:48 PM
    Author     : lanh0
--%>

<%@page import="model.RoomCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<RoomCategory> roomCategorys = (ArrayList<RoomCategory>) request.getAttribute("roomCategorys");
        %>
    </head>
    <body>
        <table>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Category</td>
                <td>Area</td>
                <td>Floor</td>
                <td>Window</td>
                <td>Balcony</td>
                <td>Balcony</td>
                <td>Bed Category</td>
            </tr>
            <tr>

            </tr>
        </table>
    </body>
</html>
