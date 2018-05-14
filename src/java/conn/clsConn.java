/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conn;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class clsConn {
    ResultSet rs=null;
    Statement st=null;
    Connection cn=null;
   public clsConn(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                cn = DriverManager.getConnection("jdbc:mysql://Localhost/db_residue", "root", "");
            } catch (SQLException ex) {
                Logger.getLogger(clsConn.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(clsConn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public boolean insert(String str)
    {
        try {
            boolean f = false;
            st = cn.createStatement();
            st.executeUpdate(str);
            return f;
        } catch (SQLException ex) {
            Logger.getLogger(clsConn.class.getName()).log(Level.SEVERE, null, ex);
        }
return true;
    }
    
public ResultSet select(String q)
{
    try
    {
        st=cn.createStatement();
        rs=st.executeQuery(q);

    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    return rs;

}
    
}
