<%-- 
    Document   : addToCart
    Created on : 2 Jul, 2019, 11:00:50 AM
    Author     : atulb
--%>
<%@page import="shoppingcatalog.dao.StoreDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalog.dao.LoginDAO.*,shoppingcatalog.dto.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link type="text/css" rel="stylesheet" href="styles/stylesheet.css">
    </head>
    <body>
        <%@include file="logo.html" %>
        <%
            String username = (String) session.getAttribute("username");
            if (username == null) {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
            } else {
                String itemId = request.getParameter("itemId");
                itemDTO item = StoreDAO.getItemDetail(Integer.parseInt(itemId));
                session.setAttribute(String.valueOf(item.getItemId()), item);
                StringBuffer sb = new StringBuffer("<h1>My Store-Shopping Cart</h1>");
                sb.append("<div style='float left;'>");
                sb.append("<p><strong>Item Added Successfully!</strong></p>");
                sb.append("<p><strong>ItemID:</strong>" + item.getItemId() + "</p>");
                sb.append("<p><strong>ItemName::</strong>" + item.getItemName() + "</p>");
                Enumeration en = session.getAttributeNames();
                int count = 0;
                while (en.hasMoreElements()) {
                    ++count;
                    en.nextElement();
                }
                sb.append("<p><strrong>Total Items In Cart:" + (count - 1) + "</p>");
                sb.append("<p><a href='StoreControllerServlet'>Continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;");
                sb.append("<a href='placeorder.jsp'>Place Order</a></p></div>");
                sb.append("<h4 id='logout'><a href='myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logot'>Logout</a>&nbsp;&nbsp;&nbsp;<a id='cart' href='mycart.jsp'>Cart</a></h4>");
                out.println(sb);
            }
        %>
    <body>
</html>
