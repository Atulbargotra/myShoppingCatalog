<%-- 
    Document   : removeitem
    Created on : 3 Jul, 2019, 11:02:45 AM
    Author     : atulb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.addDateHeader("Expires",-1);
 String item = request.getParameter("item");
 session.removeAttribute(item);
%>
