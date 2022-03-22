<%-- 
    Document   : manageProduct
    Created on : Mar 22, 2022, 8:41:10 AM
    Author     : Tuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage</title>

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
                            <li class="nav-item ">
                                <!--link to account page-->
                                <c:choose>
                                    <c:when test="${sessionScope.user == null || sessionScope.pass == null}">
                                        ${'<a class="nav-link active" href="signin">Sign In <i class="fas fa-sign-in-alt"></i></a>'}
                                    </c:when>
                                    <c:otherwise>
                                        ${'<a class="nav-link active" href="accountAdmin.jsp">Account <i class="fas fa-user-circle"></i></a>'}
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                    <div class="myCart">
                        <!--link to cart-->
                        <c:choose>
                            <c:when test="${sessionScope.user == null || sessionScope.pass == null}">
                                <a href="signin">
                                    <i class="fa fa-shopping-bag"></i>
                                    <span class="badge"></span>
                                    <p>My Cart</p>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="cart">
                                    <i class="fa fa-shopping-bag"></i>
                                    <span class="badge"></span>
                                    <p>My Cart</p>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </nav>
        </header>
        <!--All title box-->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 d-flex justify-content-between">
                        <h2>Manages Products</h2>
                        <ul class="breadcrumb d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="adminlist">Home</a></li>
                            <li class="breadcrumb-item">Manage</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container"> 
            <div class="add">
                <form action="AdminAddProduct" method="get">
                    <button type="submit" class="btn btn btn-warning btn-small my-3">Add product</button>
                </form>
            </div>
            <table class="table text-center">
                <thead>
                    <tr>
                        <th scope="col">pid</th>
                        <th scope="col">Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listProducts}" var="p">
                        <tr>
                            <th scope="row">${p.pid}</th>
                            <td style="width: 300px">${p.name}</td>
                            <td class="img-product-cart" style="width: 120px"><img class="img-fluid" style="width" src="products/${p.image}" alt="product" /></td>
                            <td>
                                <c:forEach items="${listCategories}" var="c">
                                    <c:if test="${c.catid eq p.catid}">
                                        ${c.name}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>

                                <a href="AdminEdit?pid=${p.pid}" style="text-decoration: none">
                                    <button type="submit" class="btn btn-primary btn-small" style="width: 80px">Edit</button>
                                </a>
                                <a href="AdminDelete?pid=${p.pid}" class="delete" data-confirm="Are you sure to delete this item?">
<!--                                <a href="AdminDelete?pid=${p.pid}">-->
                                <button type="submit" class="btn btn-danger btn-small">Delete</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="pagination-container text-center">
                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                    <a class="${i==page?"active":""}" href="AdminManage?page=${i}">
                        <span class="page-item ${i==page?"active":""}">
                            ${i}
                        </span>
                    </a>
                </c:forEach>
            </div>
        </div>  

        <!-- Start Footer  -->
        <footer class="text-lg-start bg-light text-muted">
            <div class="footer-main">
                <div class="container">
                    <div class="row d-flex justify-content-around">
                        <div class="col-lg-4 mb-4 mb-2 col-md-12 col-sm-12">
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
                        <div class="col-lg-4 mb-4 mb-2 col-md-12 col-sm-12">

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

        <script type="text/javascript">
            var deleteLinks = document.querySelectorAll('.delete');
            for (var i = 0; i < deleteLinks.length; i++) {
                deleteLinks[i].addEventListener('click', function (event) {
                    event.preventDefault();

                    var choice = confirm(this.getAttribute('data-confirm'));

                    if (choice) {
                        window.location.href = this.getAttribute('href');
                    }
                });
            }
        </script>
    </body>
</html>
