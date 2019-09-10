<%-- 
    Document   : seestore
    Created on : 1 Jul, 2019, 9:43:16 AM
    Author     : atulb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Store</title>
        <link type="text/css" rel="stylesheet" href="styles/stylesheet.css">
        <script type="text/javascript" src="scripts/ShowItems.js"></script>
        <script type="text/javascript" src="scripts/jquery.js"></script>
    </head>
    <body>
        <%@include file="logo.html" %>
        <%
            response.setDateHeader("Expires",-1);
            String username = (String)session.getAttribute("username");
            if(username==null)
            {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
            }
            else
            {
                StringBuffer displayBlock = new StringBuffer("<h1>My Categories</h1><p>Select a category to see its items.</p>");
                ArrayList<String>items = (ArrayList<String>)request.getAttribute("itemList");
                for(String itemType:items)
                {
                    displayBlock.append("<p id='"+itemType+"'><strong><a href='#' onclick=getItemNames('"+itemType+"')><span>+"+itemType+"</span></strong></a></p>");
                }
                displayBlock.append("<h4 id='logout'><a href='myorders.jsp'>MyOrders</a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'>Logout</a>&nbsp;&nbsp;&nbsp;<a href='mycart.jsp'>Cart</a></h4>");
                out.println(displayBlock);
            }
            %>
    </body>
</html>
