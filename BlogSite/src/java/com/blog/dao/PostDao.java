package com.blog.dao;

import com.blog.entities.Category;
import com.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
   Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
   
   //function to get all categories from DB
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list= new ArrayList<>();
        
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
                
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
    //function to save Post object data to DB
    
    public boolean savePost(Post p){
        boolean f = false;
        try {
            String q = "insert into posts(pTitle, pContent, pPic, catId, userId) values(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpPic());
            pstmt.setInt(4, p.getCatId());
            pstmt.setInt(5, p.getUserId());
            
            pstmt.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        
        return f;
    }
    
    
    
//    function to get all posts
    
    public List<Post> getAllPosts(){
        
        List<Post> list = new ArrayList<>();
        
        try {
            PreparedStatement p = con.prepareStatement("select * from posts order by pId desc");
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pId");
                String ptitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                Post post = new Post(pid, ptitle, pContent, pPic, date, catId, userId);
                
                list.add(post);
            }
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return list;
        
    }
    
    
    
    
//    function to get posts by category
    
    public List<Post> getPostByCatId(int catId){
        List<Post> list = new ArrayList<>();
        
        try {
            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pId");
                String ptitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                
                Post post = new Post(pid, ptitle, pContent, pPic, date, catId, userId);
                
                list.add(post);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return list;
    }
    
    
    //function to get a post by its id
    
    public Post getPostByPostId(int postId){
        
        Post postByPid  = new Post();
        
        try {
            String q= "select * from posts where pId=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, postId);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                int pid = set.getInt("pId");
                int cid = set.getInt("catId");
                String ptitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                
                postByPid = new Post(pid, ptitle, pContent, pPic, date, cid, userId);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return  postByPid;
    }
    
}
