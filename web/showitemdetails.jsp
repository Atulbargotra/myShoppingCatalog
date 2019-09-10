<%-- 
    Document   : showitemdetails
    Created on : 1 Jul, 2019, 10:52:05 AM
    Author     : atulb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="shoppingcatalog.dto.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="styles/stylesheet.css">
        <script type="text/javascript" src="scripts/ShowItems.js"></script>
        <script type="text/javascript" src="scripts/jquery.js"></script>
        <script type="text/javascript" src="scripts/removeitem.js"></script>
    </head>
    <body>
        <%@ include file="logo.html"%>
        <%
            String username = (String) session.getAttribute("username");
            if (username == null) {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
            } else {
                itemDTO item = (itemDTO) request.getAttribute("itemDetails");
                StringBuffer db = new StringBuffer("<h1>My Store-Item Details</h1><p><em>You are Viewing:</em></br>");
                db.append("<strong><a href='StoreControllerServlet'>" + item.getItemType() + "&gt;</a>" + item.getItemName() + "</strong></p>");
                db.append("<div style='float: left;'>");
                db.append("<img src=\'images/" + item.getItemImage() + "'></div>");
                db.append("<div style='float:left;padding-left:12px'>");
                db.append("<p><strong>Description:</strong></br>" + item.getItemDesc() + "</p>");
                db.append("<p><strong>Price:</strong></br>" + item.getItemPrice() + "</p>");
                db.append("<p><a href='addToCart.jsp?itemId=" + item.getItemId() + "'>Add To Cart</a></p></div>");
                db.append("<h4 id='logout'><a href='myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logot'>Logout</a>&nbsp;&nbsp;&nbsp;<a href='mycart.jsp'>Cart</a></h4>");
                out.println(db);
            }
        %>
         <%@include file="cart.html" %>
    </body>
</html>
