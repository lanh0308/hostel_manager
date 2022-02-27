<%-- 
    Document   : edit
    Created on : Feb 27, 2022, 2:41:37 AM
    Author     : lanh0
--%>

<%@page import="model.RoomCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BedCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<BedCategory> bedCategorys = (ArrayList<BedCategory>)request.getAttribute("bedCategorys");
            if(bedCategorys==null) bedCategorys= new ArrayList<BedCategory>();
            RoomCategory roomCategory = (RoomCategory) request.getAttribute("roomCategory");
            if(roomCategory==null) roomCategory= new RoomCategory();
        %>
    </head>
    <body>
        <form action="/room/category/edit" method="post"> 
            <input name="id" id="id" type="hidden" value="<%=roomCategory.getID()%>"/>
             Name: <input type="text" name="name" value="<%=roomCategory.getName()%>"/> </br>
            Unit Price: <input type="text" name="unit_price" value="<%=roomCategory.getUnit_price()%>"/> </br>
            Area: <input type="text" name="area" value="<%=roomCategory.getAreage()%>"/> </br>
            Floor: <input type="text" name="floor_number" value="<%=roomCategory.getFloor_number()%>"/> </br>
            Window: 
            <input <%=!roomCategory.isIs_window()?"checked =\"checked\"":""%> class="form-check-input" type="radio" name="is_window" id="is_window_yes"> yes
            <input <%=roomCategory.isIs_window()?"checked =\"checked\"":""%> class="form-check-input" type="radio" name="is_window" id="is_window_no" >no </br>
            Balcony:
            <input <%=!roomCategory.isIs_balcony()?"checked =\"checked\"":""%> class="form-check-input" type="radio" name="is_balcony" id="is_balcony_yes"> yes
            <input <%=roomCategory.isIs_balcony()?"checked =\"checked\"":""%> class="form-check-input" type="radio" name="is_balcony" id="is_balcony_no" >no </br>
            Kitchen:
            <input <%=!roomCategory.isIs_kitchen()?"checked =\"checked\"":""%> class="form-check-input" type="radio" name="is_kitchen" id="is_kitchen_yes"> yes
            <input <%=roomCategory.isIs_kitchen()?"checked =\"checked\"":""%> class="form-check-input" type="radio" name="is_kitchen" id="is_kitchen_no" >no </br>
            Desk: <input type="text" name="desk_number" value="<%=roomCategory.getDesk_number()%>"/> </br>
            Bed Category: <select name="id_bed_category"> 
                <% for (BedCategory bedCategory : bedCategorys) {%>
                <option <%=(bedCategory.getId() == roomCategory.getBed_category().getId())?"selected =\"selected\"":""%>
                    value="<%=bedCategory.getId()%>">
                    <%=bedCategory.getName()%>
                </option>
                <%}%>
            </select>
            <input type="Submit" value="SAVE"/>
        </form>
    </body>
</html>
