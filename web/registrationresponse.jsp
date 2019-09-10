<%-- 
    Document   : registrationresponse
    Created on : 29 Jun, 2019, 9:28:18 AM
    Author     : atulb
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setDateHeader("Expires",-1);
    boolean result = (Boolean)request.getAttribute("result");
    boolean userFound = (Boolean)request.getAttribute("userFound");
    if(userFound)
    {
        out.println("uap");
    }
    else if(result==false)
    {
        out.println("failure");
    }
    else
    {
        out.println("success");
    }
    
%>
