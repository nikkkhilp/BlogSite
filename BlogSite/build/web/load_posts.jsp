<%@page import="com.blog.entities.User" %>
<%@page import="com.blog.entities.Message" %>
<%@page import="com.blog.entities.Category" %>
<%@page import="com.blog.dao.PostDao" %>
<%@page import="com.blog.helper.ConnectionProvider" %>
<%@page import="com.blog.dao.LikeDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="com.blog.entities.Post" %>




<!-- <script>
            function doLike(pid, uid){
               console.log(pid + " ,"+ uid);
               const d = {
                   pid: pid,
                   uid: uid,
                   operation: 'like'
               };
               
               $.ajax({
                  url:"LikeServlet",
                  data: d,
                  success: function(data, textStatus, jqXHR){
                      console.log(data);
                      if(data.trim() === "true"){
                          let c = $(".like-counter").html();
                          c++;
                          $(".like-counter").html(c);
                      }
                  },
                  error: function(jqXHR, textStatus, errorThrown){
                      console.log(data);
                  }
               });
            }
        </script>-->









<div class="row">
<%
    
    User uu = (User)session.getAttribute("currentUser");
  
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if(cid == 0){
        posts = d.getAllPosts();
    }else{
        posts = d.getPostByCatId(cid);
    }
    
   
    
    for(Post p:posts){
    %>
    <div class="col-md-6 mt-3">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <h3><%= p.getpTitle()%></h3>
                <p><%= p.getpContent()%></p>
            </div>
            <div class="card-footer" >
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>
                
                <a href="#" class="btn btn-outline-dark " ><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="#" class="btn btn-outline-dark ml-1"><i class="fa fa-commenting-o"></i><span>5</span></a>
                <a href="show_blogpage.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-dark ml-5">Read More...</a> <!--used URL rewriting here-->
            </div>
        </div>
    </div>


<%
    }
%>

</div>