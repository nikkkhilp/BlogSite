package com.blog.dao;
import java.sql.*;



public class LikeDao {
    
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    

    public boolean insertLike(int pid, int uid){
        
        boolean f = false;
        try {
            String q = "insert into liked(pid, uid) values(?,?) ";
            PreparedStatement p = this.con.prepareStatement(q);
            
            p.setInt(1, pid);
            p.setInt(2, uid);
            
            p.executeUpdate();
            
            f = true;
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public int countLikesOnPost(int pid){
        
        int count  = 0;
        
        try {
            String q = "select count(*) from liked where pid=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            
            pstmt.setInt(1, pid);
            ResultSet set = pstmt.executeQuery();
            
            
            if(set.next()){
                count = set.getInt("count(*)");
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
                    
        }
        
        return count;
        
    }
    
    
    public boolean isLikedByUser(int pid, int uid){
        boolean f = false;
        
        try {
            
            PreparedStatement pstmt = this.con.prepareStatement("select * from liked where pid=?, uid=?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            ResultSet set  = pstmt.executeQuery();
            
            
            if(set.next()){
                f = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return f;
    }
    
    
    public boolean deleteLike(int pid, int uid){
        
        boolean f = false;
        try {
            PreparedStatement pstmt = this.con.prepareStatement("delete from liked where pid=?,uid=?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            pstmt.executeUpdate();
            
            
            f = true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return f;
    }
    
}
