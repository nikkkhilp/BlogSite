

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.blog.helper.ConnectionProvider" %>
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
        <!--javascripts-->
        
        
        
        
        
        
        <!--CONTENT-->
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron text-black " style="background-color:#00e5ff ">
                <div class="container">
                <h3 class="display-3">Welcome to BlogSite</h3>
                <p>Welcome to BlogSite.</p>
                <p>Your go to place for checking what new and happening around you and in the world!!</p>
                
                <a href="register_page.jsp" class="btn btn-outline-dark btn-lg mr-2"><span class="fa fa-user-plus"></span> Get Started</a>
                <a href="login_page.jsp" class="btn btn-outline-dark btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>
        
        <!--card-->
        <div class="container">
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Technical Analysis Tools</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn text-white" style="background-color:#00e5ff">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Technical Analysis Tools</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn text-white" style="background-color:#00e5ff">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Technical Analysis Tools</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn text-white" style="background-color:#00e5ff">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--row2-->
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Technical Analysis Tools</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn text-white" style="background-color:#00e5ff">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Technical Analysis Tools</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn text-white" style="background-color:#00e5ff">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Technical Analysis Tools</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn text-white" style="background-color:#00e5ff">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
    </body>
</html>
