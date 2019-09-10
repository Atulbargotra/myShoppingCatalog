<%-- 
    Document   : placeorder
    Created on : 2 Jul, 2019, 11:22:58 AM
    Author     : atulb
--%>
<%@page import="shoppingcatalog.dao.StoreDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalog.dao.LoginDAO.*,shoppingcatalog.dto.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="styles/stylesheet.css">
         <script type="text/javascript" src="scripts/removeitem.js"></script>
         <script type="text/javascript" src="scripts/jquery.js"></script>
    </head>
    <body>
    <body>
        <%@include file="logo.html" %>
        <%
            String username = (String) session.getAttribute("username");
            if (username == null) {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
            } else {
                StringBuffer sb = new StringBuffer("<table border='1'>");
                Enumeration en = session.getAttributeNames();
                double totalamount = 0;
                while (en.hasMoreElements()) {
                    Object o = en.nextElement();
                    if (o.equals("username")==false) {
                        itemDTO item = (itemDTO)session.getAttribute(o.toString());
                        sb.append("<tr><td>" + item.getItemName() + "</td><td>" + item.getItemPrice() + "</td></tr>");
                        totalamount += item.getItemPrice();
                    }
                }
                sb.append("</table>");
                sb.append("<p><strong>Total Amount To Pay:</strong>" + totalamount + "</p>");
                sb.append("<p><a href='StoreControllerServlet'>Continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;");
                sb.append("<a href='checkout.jsp?totalamount=" + totalamount + "'>Checkout</a></p></div>");
                sb.append("<h4 id='logout'><a href='myorders.jsp'>My Orders</a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logot'>Logout</a></h4>");
                out.println(sb);
            }
        %>
    </body>
</html>
