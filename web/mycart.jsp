<%-- 
    Document   : mycart
    Created on : 3 Jul, 2019, 10:50:52 AM
    Author     : atulb
--%>

<%@page import="shoppingcatalog.dto.itemDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles/stylesheet.css">
        <script type="text/javascript" src="scripts/removeitem.js"></script>
        <script type="text/javascript" src="scripts/jquery.js"></script>
    </head>
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
                int cartitems = 0;
                while (en.hasMoreElements()) {
                    Object o = en.nextElement();
                    if (o.equals("username")==false) {
                        cartitems++;
                    }
                }
                 Enumeration en2 = session.getAttributeNames();
                while (en2.hasMoreElements()) {
                    Object o = en2.nextElement();
                    if (o.equals("username")==false) {
                        itemDTO item = (itemDTO)session.getAttribute(o.toString());
                        sb.append("<tr id='"+o.toString()+"'><td>" + item.getItemName() + "</td><td>" + item.getItemPrice() + "</td><td><a href='#' onclick='remove("+o.toString()+","+cartitems+")'>Remove</a></td></tr>");
                    }
                }
                sb.append("</table>");
                sb.append("<a href='StoreControllerServlet'>HOME</a>");
                out.println(sb);
            }
            %>
    </body>
</html>
