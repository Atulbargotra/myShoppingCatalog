<%-- 
    Document   : myorders
    Created on : 4 Jul, 2019, 8:22:59 AM
    Author     : atulb
--%>

<%@page import="shoppingcatalog.dto.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shoppingcatalog.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">

                    <div class="table100 ver3 m-b-110">
                        <div class="table100-head">
                            <table>
                                <thead>
                                    <tr class="row100 head">
                                        <th class="cell100 column1">Order Id</th>
                                        <th class="cell100 column2">Order Amount</th>
                                        <th class="cell100 column3">Order Date</th>

                                    </tr>
                                </thead>
                            </table>
                        </div>

                        <div class="table100-body js-pscroll">
                            <table>
                                <tbody>


                                    <%
                                        response.setDateHeader("Expires", -1);
                                        String username = (String) session.getAttribute("username");
                                        if (username == null) {
                                            session.invalidate();
                                            response.sendRedirect("accessdenied.html");
                                        } else {
                                            StringBuffer sb = new StringBuffer();
                                            ArrayList<OrderDTO> orders = OrderDAO.getOrderByCustomer(username);
                                            if (orders.isEmpty()) {
                                                out.println("<span style='color:#2C955D;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No Past Orders! Present.Click <a href='StoreControllerServlet'>Here</a>to Continue shopping</span>");
                                            } else {
                                                for (OrderDTO obj : orders) {
                                                    sb.append("<tr class='row100 body'>");
                                                    sb.append("<td class='cell100 column1'>" + obj.getOrderId() + "</td>");
                                                    sb.append("<td class='cell100 column2'>" + obj.getOrderAmount() + "</td>");
                                                    sb.append("<td class='cell100 column3'>" + obj.getOrderDate() + "</td>");
                                                    sb.append("</tr>");
                                                }

                                                out.println(sb);
                                            }

                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
                    <!--===============================================================================================-->
                    <script src="vendor/bootstrap/js/popper.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
                    <!--===============================================================================================-->
                    <script src="vendor/select2/select2.min.js"></script>
                    <!--===============================================================================================-->
                    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                    <script>
                        $('.js-pscroll').each(function () {
                            var ps = new PerfectScrollbar(this);

                            $(window).on('resize', function () {
                                ps.update();
                            })
                        });


                    </script>
                    <!--===============================================================================================-->
                    <script src="js/main.js"></script>

                    </body>
                    </html>
