<%-- 
    Document   : add
    Created on : Feb 23, 2022, 1:34:16 AM
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
        <%
            ArrayList<RoomCategory> roomCategorys = (ArrayList<RoomCategory>) request.getAttribute("roomCategorys");
            ArrayList<BedCategory> bedCategorys = (ArrayList<BedCategory>) request.getAttribute("bedCategorys");
        %> 
    </head>
    <body>
        <form action="/room/category/add" method="post"> </br>
            Name: <input type="text" name="name"/> </br>
            Unit Price: <input type="text" name="unit_price"/> </br>
            Area: <input type="text" name="area"/> </br>
            Floor: <input type="text" name="floor_number"/> </br>
            Window: 
            <input class="form-check-input" type="radio" name="is_window" id="is_window_yes"> yes
            <input class="form-check-input" type="radio" name="is_window" id="is_window_no" checked>no </br>
            Balcony:
            <input class="form-check-input" type="radio" name="is_balcony" id="is_balcony_yes"> yes
            <input class="form-check-input" type="radio" name="is_balcony" id="is_balcony_no" checked>no </br>
            Kitchen:
            <input class="form-check-input" type="radio" name="is_kitchen" id="is_kitchen_yes"> yes
            <input class="form-check-input" type="radio" name="is_kitchen" id="is_kitchen_no" checked>no </br>
            Desk: <input type="text" name="desk_number"/> </br>
            Bed Category: <select name="id_bed_category"> 
                <% for (BedCategory bedCategory : bedCategorys) {%>
                <option value="<%=bedCategory.getId()%>">
                    <%=bedCategory.getName()%>
                </option>
                <%}%>
            </select>
            <input type="Submit" value="SAVE"/>
        </form>
    </body>
</html>
