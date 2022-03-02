<%-- 
    Document   : signIn
    Created on : Feb 25, 2022, 10:30:20 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <!-- Bootstrap 4 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Style -->
        <link rel="stylesheet" href="css/signIn.css">
        <link rel="stylesheet" href="css/signUp.css">
        <title>Register</title>
    </head>
   <body>
        <div class="login">
            <div class="bg order-1 order-md-2" style="background-image: url('images/banner-01.png');"></div>
            <div class="contents order-2 order-md-1">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-6">
                            <div class="form-block">
                                <div class="text-center mb-5">
                                    <h3>Register</h3>
                                </div>
                                <form class="register-form" name="register-form" action="signup" method="post" onsubmit="return validateForm()">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="username" id="username" placeholder="Username" required="">
                                        <div class="badge badge-danger" id="userFail"></div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Fullname" required="">
                                        <div class="badge badge-danger" id="fullnameFail"></div>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Email" required="">
                                        
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone number" required="">
                                        <div class="badge badge-danger" id="phoneFail"></div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="address" id="address" placeholder="Address" required="">
                                        
                                    </div>
                                    <div class="row md-12">
                                        <div class="form-group col-md-6">
                                            <input type="password" class="form-control" name="password" id="password" placeholder="Password" required="">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <input type="password" class="form-control" name="repassword" id="repassword" placeholder="Re-password" required="">
                                            <div class="badge badge-danger" id="repassFail"></div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-block btn-outline-secondary submit" id="btn-primary"> Register </button>
                                    <span class="ml-auto"><a href="signin" class="forgot-pass">Login</a></span> 
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>


        <script src="js/signupValidate.js" type="text/javascript"></script>
        
    </body>
</html>
