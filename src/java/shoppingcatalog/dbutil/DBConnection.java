/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dbutil;

/**
 *
 * @author atulb
 */
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
    private static Connection conn;
    static
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            conn=DriverManager.getConnection("jdbc:oracle:thin:@//DESKTOP-3GG4R6I:1521/xe","onlineshopping","shopping");
            System.out.println("driver loaded");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    public static Connection getConnection() //when we call getConnection, firstly call static  only one time
    {
        return conn;
    }
    public static void closeConnection()
    {
        try
        {
            if(conn!=null)
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}

