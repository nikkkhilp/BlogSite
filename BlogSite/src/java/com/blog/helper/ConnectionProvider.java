package com.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection(){
        try{
            if(con==null){
            //loading driver
            Class.forName("com.mysql.jdbc.Driver");
            //create conenction
            String url = "jdbc:mysql://localhost:3306/blogsite";
            String username = "root";
            String password = "nikhil";
            con = DriverManager.getConnection(url, username, password);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
}
