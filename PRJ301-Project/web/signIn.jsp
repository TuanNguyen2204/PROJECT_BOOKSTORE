<%-- 
    Document   : signIn
    Created on : Jan 25, 2022, 10:59:01 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String check = (String) request.getAttribute("check");
%>
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

        <title>Login</title>
    </head>
    <body>
        <div class="login">
            <div class="bg" style="background-image: url('images/banner-01.png');"></div>
            <div class="contents">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-6">
                            <div class="form-block">
                                <div class="text-center mb-5">
                                    <h3>Login</h3>
                                </div>
                                <form action="signin" method="post">
                                    <div class="form-group">

                                        <input type="text" value="${username}" class="form-control" placeholder="Username" id="username" name="user" required="">
                                    </div>
                                    <div class="form-group">

                                        <input type="password" value="${password}" class="form-control" placeholder="**********" id="password" name="pass" required="">
                                    </div>

                                    <div class="d-sm-flex mb-5 align-items-center">
                                        <div class="form-check">
                                            <input class="form-check-input" ${(cookie.remember.value eq 'ON')?"checked":""} type="checkbox" name="rememberMe" value="ON" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                Remember me
                                            </label>
                                        </div>
                                        <span class="ml-auto"><a href="signup" class="forgot-pass">Sign Up</a></span> 
                                    </div>

                                    <c:choose>
                                        <c:when test="${check.equals('fail')}">
                                            ${'<span class="badge badge-danger">Invalid Username or Password</span> <br/>'}
                                        </c:when>
                                        <c:otherwise>
                                            <br />
                                        </c:otherwise>
                                    </c:choose>
                                            <!--error mesage filter-->
                                            <span style="color:red; margin-left: 40%">${message}</span>
                                    <input type="submit" value="Log In" class="btn btn-block btn-outline-secondary" id="btn-primary"> 


                                    <span class="ml-auto"><a href="home" class="forgot-pass">Back to Home</a></span> 

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </body>
</html>

