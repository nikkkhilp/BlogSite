
<%@page import="com.blog.entities.User" %>
<%@page import="com.blog.entities.Message" %>
<%@page import="com.blog.entities.Category" %>
<%@page import="com.blog.dao.PostDao" %>
<%@page import="com.blog.helper.ConnectionProvider" %>
<%@page import="java.util.ArrayList" %>
<%@page errorPage = "error_page.jsp" %>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user==null){
    response.sendRedirect("login_page.jsp");
    }
%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
        <title>JSP Page</title>
    </head>
    <body>
        <!--javascripts-->
            <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!--javascripts-->
        <script>
            $(document).ready(function(){
                let editStatus = false;
                $("#edit-profile-button").click(function (){
                    if(editStatus === false){
                        $("#profile-detail").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Go Back");    //this here is edit-profile-button
                    }else{
                        $("#profile-detail").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit Profile");
                    }
                });
                
            });
        </script>
        
        
        
        
       
        <!--START OF NAVBAR-->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#00e5ff ">
            <a class="navbar-brand mb-0 h1" href="index.jsp"><span class="fa fa-bandcamp"></span> BlogSite</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="#">Contact Us</a>
                </li>
                <li class="nav-item dropdown active">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-newspaper-o mr-2"></span>Create New Post</a>
                </li>
              
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item active">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle mr-2"></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus mr-2"></span>LogOut</a>
                    </li>
                </ul>
            </div>
        </nav>
                    
    <!--END OF NAVBAR-->
    <!--MESSAGE-->
    
    <%
                               Message m = (Message)session.getAttribute("msg");
                               if(m != null){
                           %>
                                <div class="alert alert-danger text-center" role="alert">
                                    <%= m.getContent() %>
                                </div>
                            <%
                                session.removeAttribute("msg");
                               }
                            %> 
    
    
    
      <!--MAIN BODY OF PAGE-->
      
      <main>
          <div class="container">
              <div class="row mt-5">
                  <div class="col-md-4">
                      <!--list of categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active"> All Posts</a>
                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for(Category cc: list1){
                                %>
                                <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>
                            <%
                                }
                            %>
                        </div>
                  </div>
                        <div class="col-md-8">
                      <!--all posts-->
                      <div class="container text-center" id="loader">
                          <i class="fa fa-refresh fa-4x fa-spin"></i>
                          <h3 class="mt-2">Loading...</h3>
                      </div>
                      <div class="container-fluid" id="post-container">
                          
                      </div>
                  </div>
              </div>
          </div>
      </main>
      
      <!--END OF MAIN BODY-->
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
    <!--START OF PROFILE MODAL-->
    
   

    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-white" style="background-color: #00e5ff">
              <div class="container text-center">
                    <h3 class="modal-title " id="exampleModalLabel">User Profile</h3>
                </div>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="container text-center">
                  <img src="pic/default.jpg" class="img-fluid" style="border-radius: 50%; max-width: 150px" alt="alt"/>
                  <br>
                  <h3 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h3>
                  <!--DETAIL-->
                  <div id="profile-detail">
                  <table class="table">
                   
                    <tbody>
                      <tr>
                        <th scope="row">User ID :</th>
                        <td><%= user.getId()%></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">Email :</th>
                        <td><%= user.getEmail()%></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">About :</th>
                        <td><%= user.getAbout()%></td>
                        
                      </tr>
<!--                      <tr>
                        <th scope="row">Pass :</th>
                        <td><%= user.getPassword()%></td>
                        
                      </tr>-->
                    </tbody>
                  </table>
                  </div>
                        
                        <!--Profile-EDITING-->
                        
                        <div id="profile-edit" style="display: none">
                            <h3 class="mt-2">Edit Profile</h3>
                            <form action="editServlet" method="post">
                                <table class="table">
                                    <tr>
                                        <td>User ID :</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td><input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email :</td>
                                        <td><input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password :</td>
                                        <td><input class="form-control" type="password" name="user_password" value="<%= user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>About :</td>
                                        <td>
                                            <textarea class="form-control" name="user_about" rows="3">
                                                <%= user.getAbout() %>
                                            </textarea>
                                        </td>
                                    </tr>
<!--                                    <tr>
                                        <td>Profile Picture :</td>
                                        <td><input class="form-control" type="file" name="image"></td>
                                    </tr>-->
                                </table>
                                            <div class="container align-items-center">
                                                <button type="submit" class="btn btn-lg">Update Profile</button>
                                            </div>
                            </form>
                        </div>
                        
                        
                        
                        
                </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button id="edit-profile-button" type="button" class="btn btn-primary">Edit Profile</button>
          </div>
        </div>
      </div>
    </div>
     <!--END OF PROFILE MODAL-->
     
     <!--ADD POST MODAL-->
           
           

           <!-- Modal -->
           <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
             <div class="modal-dialog" role="document">
               <div class="modal-content">
                 <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalLabel">Create a New Post</h5>
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                   </button>
                 </div>
                 <div class="modal-body">
                     <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                         
                         <div class="form-group">
                             <select class="form-control" name="cid">
                                <option selected disabled>---Select Your Post Category---</option>
                                
                                <%
                                    PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = pd.getAllCategories();
                                    for(Category c : list){
                                 %>
                                 <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                 <%
                                     }
                                 %>                                
                             </select>
                         </div>
                         
                         
                         <div class="form-group">
                             <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control">
                         </div>
                         <div class="form-group">
                             <textarea name="pContent" placeholder="Enter Post Content" class="form-control" style="height: 300px"></textarea>
                         </div>
                         <div class="form-group">
                             <label>Select Your Post Picture -</label>
                             <input type="file" name="pic">
                         </div>
                        
                             <div class="container text-center">
                            <button type="submit" class="btn btn-outline-dark ">Post</button>
                        </div>
                     </form>
                              
                 </div>
                 </div>
               </div>
             </div>
           </div>
    
                             
                             
                             
                             
                             
                             
                             
                             <!--ADD POST AJAX WORK-->
                             <script>
                                 $(document).ready(function (e){
                                     $("#add-post-form").on("submit", function(event){
                                        //this code is called when form is submitted
                                        event.preventDefault();
                                        console.log("you have clicked me");
                                        
                                        let form = new FormData(this);   //here this is add-post-form
                                        //now requesting to server
                                        $.ajax({
                                            url: "AddPostServlet",
                                            type: "POST",
                                            data: form,
                                            success: function(data, textStatus, jqXHR){
                                               //success 
                                               console.log(data);                    
                                               if(data.trim() === "done"){
//                                                   $("#add-post-modal").hide();
                                                   swal("Good job!", "Your blog has been posted !!", "success");
                                                   
                                                   
                                               }else{
                                                   swal("Error", "Something went wrong...Try Again", "error");
                                               }

                                                
                                            },
                                            error: function(jqXHR, textStatus, errorThrown){
                                                //error
                                                swal("Error", "Something went wrong...Try Again", "error");
                                            },
                                            
                                            processData: false,
                                            contentType: false
                                        });
                                     });
                                 });
                             </script>   
                             
                             <!--loading post using ajax-->
                             <script>
                                 
                                 function getPosts(catId, temp){
                                     
                                     $("#loader").show();
                                     $("#post-container").hide();
                                     
                                      $(".c-link").removeClass('active');
                                     
                                     $.ajax({
                                        url:"load_posts.jsp",
                                        data:{cid:catId},
                                        success: function(data, textStatus, jqXHR){
                                            console.log(data);
                                            $("#loader").hide();
                                            $("#post-container").show();
                                            $("#post-container").html(data);
                                            
                                            $(temp).addClass("active");
                                        }
                                    });
                                 }
                                 
                                 $(document).ready(function(e){
//                                    alert("ready"); 
                                    let allPostRef = $(".c-link")[0];
                                    getPosts(0, allPostRef);
                                 });
                             </script>
    </body>
</html>
