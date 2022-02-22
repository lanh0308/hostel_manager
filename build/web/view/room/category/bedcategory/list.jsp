<%-- 
    Document   : list.jsp
    Created on : Feb 22, 2022, 3:56:49 PM
    Author     : lanh0
--%>

<%@page import="model.BedCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bed Category</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%
            ArrayList<BedCategory> bedCategorys = (ArrayList<BedCategory>) request.getAttribute("bedCategorys");
            int i = 1;
        %>
    </head>
    <body>
        <div id="header">
            <ul id="nav">
                
            </ul>
        <table>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Name</td>
                <td></td>
            </tr>
            <%for (BedCategory bedCategory : bedCategorys) {%>
            <tr>
                <td><%=i++%></td>
                <td><%=bedCategory.getId()%></td>
                <td><%=bedCategory.getName()%></td>
                <td><a href="/room/category/bedcategory/edit?id=<%=bedCategory.getId()%>">Edit</a> 
                    <button onclick="deleteBedCategory(<%=bedCategory.getId()%>)">Delete</button>
                    </td>
            </tr>
            <%}%>
        </table>
        <button id="buttonOpenAddForm">insert bed category</button>
        <div style="display: none" id="formAddContainer">
            <jsp:include page="add.jsp"/>
        </div>
        <script>
            $("#buttonOpenAddForm").on('click', function(e) {
                if($("#formAddContainer").css("display")=="none"){
                    $("#formAddContainer").css("display","block");
                }else{
                     $("#formAddContainer").css("display","none");
                }
            })
            function deleteBedCategory(id){
                var result = confirm("Are you sure?");
                if(result) {
                    window.location.href = "/room/category/bedcategory/delete?id=" + id;
                }
            }
        </script>
    </body>
</html>
