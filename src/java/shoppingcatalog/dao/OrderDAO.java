/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import shoppingcatalog.dbutil.DBConnection;
import shoppingcatalog.dto.OrderDTO;
import shoppingcatalog.dto.itemDTO;

/**
 *
 * @author atulb
 */
public class OrderDAO {

    private static PreparedStatement ps1;

    static {
        try {
            ps1 = DBConnection.getConnection().prepareStatement("insert into order_master values(?,?,?,?)");
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private static PreparedStatement ps2;

    static {
        try {
            ps2 = DBConnection.getConnection().prepareStatement("insert into order_details values(?,?,?)");
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private static Statement st;

    static {
        try {
            st = DBConnection.getConnection().createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void addOrder(String custname, ArrayList<itemDTO> itemList, double totalAmount) throws SQLException {
        ResultSet rs = st.executeQuery("select count(*) as ordercount from order_master");
        rs.next();
        int ordercount = rs.getInt("ordercount");
        String order_id = "ORD-";
        if (ordercount == 0) {
            order_id += "1";
        } else {
            String oi = String.valueOf((ordercount + 1));
            order_id += oi;
        }
        Date jdate = new Date();
        long ms = jdate.getTime();
        java.sql.Date sqldate = new java.sql.Date(ms);
        ps1.setString(1, order_id);
        ps1.setString(2, custname);
        ps1.setDouble(3, totalAmount);
        ps1.setDate(4, sqldate);
        ps1.executeUpdate();
        for (itemDTO item : itemList) {
            ps2.setString(1, order_id);
            ps2.setString(2, item.getItemName());
            ps2.setDouble(3, item.getItemPrice());
            ps2.executeQuery();
        }

    }
    private static PreparedStatement ps3;

    static {
        try {
            ps3 = DBConnection.getConnection().prepareStatement("select order_id,order_amount,order_date from order_master where cust_name = ?");
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<OrderDTO> getOrderByCustomer(String custName) throws SQLException {
        ps3.setString(1, custName);
        ResultSet rs = ps3.executeQuery();
        ArrayList<OrderDTO> items = new ArrayList<>();
        while (rs.next()) {
            OrderDTO obj = new OrderDTO();
            obj.setOrderId(rs.getString("order_id"));
            obj.setOrderAmount(rs.getInt("order_amount"));
            obj.setOrderDate(rs.getDate("order_date"));
            items.add(obj);
        }
        return items;

    }

}
