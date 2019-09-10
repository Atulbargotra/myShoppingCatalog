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
import java.util.logging.Level;
import java.util.logging.Logger;
import shoppingcatalog.dbutil.DBConnection;
import shoppingcatalog.dto.ItemInfoDTO;
import shoppingcatalog.dto.itemDTO;

/**
 *
 * @author atulb
 */
public class StoreDAO {

    private static Statement st;

    static {
        try {
            st = DBConnection.getConnection().createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private static PreparedStatement ps;

    static {
        try {
            ps = DBConnection.getConnection().prepareStatement("select id,item_name from storeitems where item_type=?");
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private static PreparedStatement ps2;

    static {
        try {
            ps2 = DBConnection.getConnection().prepareStatement("select item_type,item_name,item_price,item_desc,item_image from storeitems where id=?");
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<String> getItemTypes() throws SQLException {
        ArrayList<String> itemList = new ArrayList<>();
        ResultSet rs = st.executeQuery("select distinct item_type from storeitems");
        while (rs.next()) {
            itemList.add(rs.getString(1));
        }
        return itemList;
    }

    public static ArrayList<ItemInfoDTO> getItemsByType(String itemType) throws SQLException {
        ArrayList<ItemInfoDTO> itemList = new ArrayList<>();
        ps.setString(1, itemType);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            ItemInfoDTO obj = new ItemInfoDTO(rs.getInt(1), rs.getString(2));
            itemList.add(obj);
        }
        return itemList;
    }

    public static itemDTO getItemDetail(int itemID) throws SQLException {
        itemDTO dto = null;
        ps2.setInt(1, itemID);
        ResultSet rs = ps2.executeQuery();
        rs.next();
        dto = new itemDTO(rs.getString("item_type"), rs.getString("item_name"), rs.getDouble("item_price"), rs.getString("item_desc"), rs.getString("item_image"), itemID);
        System.out.println(dto);
        return dto;

    }

}
