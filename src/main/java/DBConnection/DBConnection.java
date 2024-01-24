package DBConnection;

import Model.Mystore;

import java.sql.*;

public class DBConnection {
    public static Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mystore", "root", "");
            System.out.println("Connected Database");
            return con;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean loginuser(Mystore mystore) {
        try {
            System.out.println("Preparing to login, " + mystore);
            Connection con = connect();
            if (con == null) {
                System.out.println("Could not connect to db");
                return false;
            }

            PreparedStatement pst = con.prepareStatement("select * from first where email=? and password=?");
            pst.setString(1, mystore.getEmail());
            pst.setString(2, mystore.getPassword());
            ResultSet rs = pst.executeQuery();
            return rs != null && rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static Mystore getUserById(int id) {
        try {
            Connection con = connect();
            if (con == null) {
                System.out.println("Could not connect to db");
                return null;
            }

            PreparedStatement pst = con.prepareStatement("select * from first where id=?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                Mystore user = new Mystore();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
