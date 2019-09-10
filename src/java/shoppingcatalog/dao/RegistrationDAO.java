/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import shoppingcatalog.dbutil.DBConnection;
import shoppingcatalog.dto.UserDTO;

/**
 *
 * @author atulb
 */
public class RegistrationDAO {
    private static PreparedStatement ps1,ps2;
    static
    {
        try
        {
            ps1=DBConnection.getConnection().prepareStatement("select username from members where username = ?");
            ps2=DBConnection.getConnection().prepareStatement("insert into members values(?,?,?)");
        }
        catch(Exception ex)
        {
            System.out.println("Error in DB comm:"+ex);
        }
    }
    public static boolean searchUser(String userid) throws SQLException {
        boolean userFound = false;
        ps1.setString(1, userid);
        ResultSet rs = ps1.executeQuery();
        if (rs.next()) {
            userFound = true;
        }
        return userFound;
    }

    public static boolean registerUser(UserDTO dto) throws SQLException {
        boolean done = false;
        ps2.setString(1, dto.getUsername());
        ps2.setString(2, dto.getPassword());
        ps2.setString(3, dto.getUserType());
        int ans = ps2.executeUpdate();
        if (ans != 0) {
            done = true;
        }
        return done;
    }
    
}
