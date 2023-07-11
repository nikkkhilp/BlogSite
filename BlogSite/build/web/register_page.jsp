

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Registration</title>
    </head>
    <body>
       <!--javascripts-->
            <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--javascripts-->
        
        
        <!--CONTENT-->
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        
        <!--register-box-->
        <main class="p-5 " style="background-color: #00e5ff">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            <p class="h2">Register Here</p>
                        </div>
                        <div class="card-body">
                            <form id="reg_form" action="RegisterServlet" method="POST">
                                
                                <div class="form-group">
                                  <label for="user_name">User Name</label>
                                  <input type="text" class="form-control" id="user_name" name="user_name" aria-describedby="emailHelp" placeholder="Enter Your Name">
                                </div>
                                
                                <div class="form-group">
                                  <label for="user_email">Email address</label>
                                  <input type="email" class="form-control" id="user_email" name="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                
                                
                                <div class="form-group">
                                  <label for="user_password">Password</label>
                                  <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password">
                                </div>
                               
                                <div class="form-group">
                                    <textarea name="about" class="form-control" rows="5" placeholder="Tell us something about yourself"></textarea>
                                </div>
                                
                                <div class="form-check mb-2">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree to Terms & Conditions.</label>
                                </div>
                                
                                <div class="container text-center mb-2" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                </div>
                                <div class="container text-center">
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </div>
                              </form> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        <!--AJAX Implementation-->
        <script>
            $(document).ready(function(){
               console.log("loaded..!!");
               
               $('#reg_form').on('submit',function(event){
                   event.preventDefault();
                   
                   let form = new FormData(this);
                   
                   $("submit-btn").hide();
                   $("loader").show();
                   
                   
                   
                   
                   //send to register servlet
                   
                   $.ajax({
                      url:"RegisterServlet",
                      type:'POST',
                      data: form,
                      success: function(data, textStatus, jqXHR){
                            console.log(data);
                          
                            $("submit-btn").show();
                            $("loader").hide();
                            console.log(data.toString());
                            if(data.trim() === "Done"){
                                swal("Successfully Registered..Redirecting You to LogIn Page.")
                               .then((value) => {
                                   window.location="login_page.jsp";
                               });   
                            }else{
                                swal(data);
                            }
                            
                            
                      },
                      error: function(jqXHR, textStatus, errorThrown){
                            console.log(jqXHR);
                            $("submit-btn").show();
                            $("loader").hide();
                            swal("Something went wrong...Please Try again.");
                            
                      },
                      processData: false,
                      contentType: false
                   });
               });
            });
        </script>
        
    </body>
</html>
