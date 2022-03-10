<%-- 
    Document   : cart
    Created on : Mar 8, 2022, 9:26:29 PM
    Author     : Tuan
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
    HashMap<String, Integer> hashCart = (HashMap<String, Integer>) session.getAttribute("hashCart");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>

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
        <link href="css/cart.css" rel="stylesheet" type="text/css"/>
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
                        <a class="navbar-brand" href="home"><img src="images/logo.png" class="logo" alt=""></a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <!--link to home page-->
                                <a class="nav-link active" href="home">Home</a>
                            </li>
                            <li class="nav-item active">
                                <!--link to account page-->
                                <a class="nav-link" href="account">Account <i class="fas fa-user-circle"></i></a>
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
                        <h2>Cart</h2>
                        <ul class="breadcrumb d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">Cart</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="cart-box">
            <div class="container">
                <div class="row">
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th>Images</th>
                                <th>Book Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listCart}" var="cart">
                            <tr>
                                <td class="thumbnail-img">
                                    <a href="detail?pid=${cart.pid}" target="_blank">
                                        <img class="img-fluid" src="products/${cart.image}" alt="product" />
                                    </a>
                                </td>
                                <td class="name-pr">
                                    <a href="detail?pid=${cart.pid}" target="_blank">
                                        ${cart.name}
                                    </a>
                                </td>
                                <td class="price-pr">
                                    <p>$ ${cart.price}</p>
                                </td>

                                <td class="quantity-box">
                                    <form action="quantityCard?pid=${cart.pid}">
                                        <input type="hidden" name ="pid" value="${cart.pid}"/>
                                        <button type="submit" formaction="quantityCard" formmethod="get"  class="btn btn-danger btn-sm"> - </button>
                                        ${cart.quantity}
                                        <button type="submit" formaction="quantityCard" formmethod="post" class="btn btn-success btn-sm"> + </button>
                                    </form>
                                </td>

                                <td class="total-pr">
                                    <p>$ ${cart.getTotal()}</p>
                                </td>
                                <td class="remove-pr">
                                    <a href="cart?pid=${cart.pid}" method="post">
                                        <i class="fas fa-times"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
