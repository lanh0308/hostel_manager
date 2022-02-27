<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:22:48 PM
    Author     : lanh0
--%>

<%@page import="model.BedCategory"%>
<%@page import="model.RoomCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%
            ArrayList<RoomCategory> roomCategorys = (ArrayList<RoomCategory>) request.getAttribute("roomCategorys");
                        ArrayList<BedCategory> bedCategorys = (ArrayList<BedCategory>)request.getAttribute("bedCategorys");

            int i = 1;
        %>
    </head>
    <body>
        <table  border="1px">
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Category</td>
                <td>Unit Price</td>
                <td>Area</td>
                <td>Floor</td>
                <td>Window</td>
                <td>Balcony</td>
                <td>Balcony</td>
                <td>Bed Category</td>
                <td></td>
            </tr>
            <%for (RoomCategory roomCategory : roomCategorys) {%>
            <tr>
                <td><%=i++%></td>
                <td><%=roomCategory.getID()%></td>
                <td><%=roomCategory.getName()%></td>
                <td><%=roomCategory.getUnit_price()%></td>
                <td><%=roomCategory.getAreage()%></td>
                <td><%=roomCategory.getFloor_number()%></td>
                <td><%=roomCategory.isIs_window()%></td>
                <td><%=roomCategory.isIs_balcony()%></td>
                <td><%=roomCategory.isIs_kitchen()%></td>
                <td><%=roomCategory.getDesk_number()%></td>
                <td><%=roomCategory.getBed_category().getName()%></td>
                <td><a href="/room/category/edit?id=<%=roomCategory.getID()%>">Edit</a> 
                    <button onclick="deleteRoomCategory(<%=roomCategory.getID()%>)">Delete</button></td>
            </tr>
            <%}%>
        </table>
        <button id="buttonOpenAddRoomCategory">insert room category </button>
        <div style="display: none" id="formAddRoomCategoryContainer">
            <jsp:include page="add.jsp"/>
        </div>
        <script>
            $("#buttonOpenAddRoomCategory").on('click', function (e) {
                if ($("#formAddRoomCategoryContainer").css("display") == "none") {
                    $("#formAddRoomCategoryContainer").css("display", "block");
                } else {
                    $("#formAddRoomCategoryContainer").css("display", "none");
                }
            })
            
            function deleteRoomCategory(id){
                var result = confirm("Are you sure?");
                if(result) {
                    window.location.href = "/room/category/delete?id=" + id;
                }
            }
        </script>
    </body>
</html>
