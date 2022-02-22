<%-- 
    Document   : edit
    Created on : Feb 22, 2022, 6:56:40 PM
    Author     : lanh0
--%>

<%@page import="model.BedCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            BedCategory bedCategory = (BedCategory) request.getAttribute("bedCategory");
        %>
    </head>
    <body>
        <form action="/room/category/bedcategory/edit" method="post">
            <input name="id" id="id" type="hidden" value="<%=bedCategory.getId()%>"/>
            Name: <input type="text" name="name" value="<%=bedCategory.getName()%>" id="name"/>
            <input type="submit" value="save"/>
        </form>
    </body>
</html>
