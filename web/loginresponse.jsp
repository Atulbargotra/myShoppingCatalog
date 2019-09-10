<%-- 
    Document   : loginresponse
    Created on : 27 Jun, 2019, 11:31:48 AM
    Author     : atulb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setDateHeader("Expires",-1);
    boolean result = (Boolean) request.getAttribute("result");
    String username = (String) request.getAttribute("username");
    String usertype = (String) request.getAttribute("usertype");
    if (result == true && usertype.equalsIgnoreCase("CUSTOMER")) {
        String url = "StoreControllerServlet;jsessionid=" + session.getId();
        out.println(url);
        HttpSession ses = request.getSession();
        ses.setAttribute("username", username);
    } else if (result == true && usertype.equalsIgnoreCase("ADMIN")) {
        String url = "AdminControllerServlet;jsessionid=" + session.getId();
        out.println(url);
        HttpSession ses = request.getSession();
        ses.setAttribute("username", username);
    } else {
        out.println("error");
    }

%>