<%-- 
    Document   : showitemsbytype
    Created on : 1 Jul, 2019, 10:38:59 AM
    Author     : atulb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalog.dto.*"%>
<!DOCTYPE html>
        <%
            response.setDateHeader("Expires",-1);
            String username = (String)session.getAttribute("username");
            if(username==null)
            {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
            }
            else
            {
                StringBuffer displayBlock = new StringBuffer("<ul>");
                ArrayList<ItemInfoDTO>items = (ArrayList<ItemInfoDTO>)request.getAttribute("itemList");
                for(ItemInfoDTO obj :items)
                {
                    displayBlock.append("<li id='"+obj.getItemId()+"'><a href='StoreControllerServlet?itemId="+obj.getItemId()+"'>"+obj.getItemName()+"</a></li>");
                }
                displayBlock.append("</ul>");
                out.println(displayBlock);
            }
            %>
    </body>
</html>
