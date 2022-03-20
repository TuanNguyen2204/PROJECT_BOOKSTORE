<%-- 
    Document   : statisticAdmin
    Created on : Mar 13, 2022, 8:52:53 PM
    Author     : Tuan
--%>
<%@page import="model.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("user");
    String pass = (String) session.getAttribute("pass");
    Account acc = new Account(user, pass);
    String catid = request.getParameter("catid");
    session.setAttribute("catid", catid);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--font-awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Bootstrap 4 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <!--CSS-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/shop.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
          <!--Start Main All Page-->
        <header class="main-header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <div class="navbar-header">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!--link to home page-->
                        <a class="navbar-brand" href="adminlist"><img src="images/logo.png" class="logo" alt=""></a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <!--link to home page-->
                                <a class="nav-link active" href="adminlist">Home</a>
                            </li>
                            <li class="nav-item active">
                                <!--link to account page-->
                                <a class="nav-link" href="account.jsp">Account <i class="fas fa-user-circle"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="myCart">
                        <!--link to cart-->
                        <a href="cart.jsp">
                            <i class="fa fa-shopping-bag"></i>
                            <p>My Cart</p>
                        </a>
                    </div>
                </div>
            </nav>
        </header>

        <!--All title box-->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 d-flex justify-content-between">
                        <h2>Statistic</h2>
                        <ul class="breadcrumb d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="account">Account</a></li>
                            <li class="breadcrumb-item active"> Statistic </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
         <!--Book Product-->
        <div class="shop-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 shop-content-right">
                        <div class="product-container-box">
                            <h1 class="pt-3 pb-3 text-center" style="color: brown"><b>TOP 3 Best Seller Product</b></h1>
                            <div class="row text-center">
                                <c:forEach var="book" items="${top3Product}">
                                    <div class="col-lg-4 mb-4">
                                        <div class="product-single">
                                            <div>
                                                <img src="products/${book.image}" class="img-fluid" alt="Product image">
                                                <div class="product-action d-flex justify-content-between">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.user == null || sessionScope.pass == null}">
                                                            <a href="signin"><i class="fa-solid fa-cart-shopping"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="home?catid=${catid}&pid=${book.pid}&amount=1" data-toggle="tooltip" data-placement="right" title="Add to cart"><i class="fa-solid fa-cart-shopping"></i></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="detail?pid=${book.pid}" target="_blank" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="inf-text">
                                            <h6>${book.name}</h6>
                                            <h6 style="color: brown; font-style: italic">$${book.price}</h6>
                                        </div>
                                    </div>
                                </c:forEach>
                                
                                
                            <section class="pt-10">
                                <center>
                                    <h1 class="pt-3 pb-3 text-center" style="color: darkred"><i>TOP 5 CUSTOMER</i></h1>
                                </center>

                                <table class="table">
                                    <tr>
                                        <th>Username</th>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>role</th>
                                    </tr>
                                    <c:forEach items="${top5User}" var="acc">
                                        <tr>
                                            <td>${acc.username}</td>
                                            <td>${acc.fullname}</td>
                                            <td>${acc.email}</td>
                                            <td>${acc.phone}</td>
                                            <td>${acc.address}</td>
                                            <td>${acc.role == 1 ? "Admin" : "User"}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Start Footer  -->
        <footer class="text-lg-start bg-light text-muted">
            <div class="footer-main">
                <div class="container">
                    <div class="row d-flex justify-content-around">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-content">
                                <h3 style="margin-left: 30px">Office Address</h3>
                                <ul class="footer-content__address">
                                    <li>Trường Đại học FPT Hà Nội</li>
                                    <li>Km29 - Đại lộ Thăng Long</li>
                                    <li>Khu CNC Hòa Lạc</li>
                                    <li>xã Thạch Hòa, huyện Thạch Thất</li>
                                    <li>Thành phố Hà Nội</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">

                            <div class="footer-content">
                                <h3>Social Media</h3>
                                <!-- Section: Social media -->
                                <!-- Facebook -->
                                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                                   ><i class="fab fa-facebook-f"></i
                                    ></a>

                                <!-- Twitter -->
                                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                                   ><i class="fab fa-twitter"></i
                                    ></a>

                                <!-- Google -->
                                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                                   ><i class="fab fa-google"></i
                                    ></a>

                                <!-- Instagram -->
                                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                                   ><i class="fab fa-instagram"></i
                                    ></a>

                                <!-- Linkedin -->
                                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                                   ><i class="fab fa-linkedin-in"></i
                                    ></a>

                                <!-- Github -->
                                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                                   ><i class="fab fa-github"></i
                                    ></a>
                                <!-- Section: Social media -->
                            </div>
                        </div>
                    </div>
                    <hr>
                    <!-- Copyright -->
                    <div class="text-center p-2">
                        <p style="color: #ffffff">
                            2022 © by 
                            <a class="text-white" href="#!"> Nguyen Van Tuan</a>
                            - PRJ301
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer  -->
    </body>
</html>
