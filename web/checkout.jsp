<%-- 
    Document   : checkout
    Created on : 2 Jul, 2019, 8:26:30 PM
    Author     : atulb
--%>

<%@page import="shoppingcatalog.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shoppingcatalog.dto.itemDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay</title>
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
               Double totalamount = Double.parseDouble(request.getParameter("totalamount"));
               Enumeration en = session.getAttributeNames();
               ArrayList<itemDTO>items = new ArrayList<>();
                while (en.hasMoreElements()) {
                    Object o = en.nextElement();
                    if (o.equals("username")==false) {
                        itemDTO item = (itemDTO)session.getAttribute(o.toString());
                        items.add(item);
                        session.removeAttribute(o.toString());
                    }
                }
                OrderDAO.addOrder((String)session.getAttribute("username"), items,totalamount);
                out.println("Thanks for placing order<br>");
                out.println("<a href='StoreControllerServlet'>Home</a>");
                out.println("<Your Payment of RS:"+totalamount+"is under processing!");
                
            }
         %>
    </body>
</html>
