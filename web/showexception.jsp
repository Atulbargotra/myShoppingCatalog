<%-- 
    Document   : showexception
    Created on : 28 Jun, 2019, 9:51:17 AM
    Author     : atulb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setDateHeader("Expires",-1);
    Exception e=(Exception)request.getAttribute("exception");
    System.out.println("exception is"+e);
    out.println("some exception is occured!"+e);
    
    %>