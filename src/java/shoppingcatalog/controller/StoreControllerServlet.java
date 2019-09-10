/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shoppingcatalog.dao.StoreDAO;
import shoppingcatalog.dto.ItemInfoDTO;
import shoppingcatalog.dto.itemDTO;

/**
 *
 * @author atulb
 */
public class StoreControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            System.out.println("username"+username);
            RequestDispatcher rd = null;
            try {
                if (username==null) {
                    session.invalidate();
                    rd = request.getRequestDispatcher("accessdenied.html");
                } else {
                    String itemtype = request.getParameter("itemType");
                    String itemid = request.getParameter("itemId");
                    if (itemtype==null && itemid==null) {
                        ArrayList<String> al = StoreDAO.getItemTypes();
                        System.out.println(al);
                        rd = request.getRequestDispatcher("seestore.jsp");
                        request.setAttribute("itemList", al);
                    } else if (itemtype!=null) {
                        ArrayList<ItemInfoDTO> al2 = new ArrayList<>();
                        al2 = StoreDAO.getItemsByType(itemtype);
                        rd = request.getRequestDispatcher("showitemsbytype.jsp");
                        request.setAttribute("itemList", al2);
                    } else if (itemid!=null) {
                        itemDTO obj = StoreDAO.getItemDetail(Integer.parseInt(itemid));
                        rd = request.getRequestDispatcher("showitemdetails.jsp");
                        request.setAttribute("itemDetails", obj);

                    }
                }
            } catch (SQLException ex) {
                rd = request.getRequestDispatcher("showexception.jsp");
                request.setAttribute("exception", ex);
                System.out.println(ex);
            } finally {
                rd.forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
