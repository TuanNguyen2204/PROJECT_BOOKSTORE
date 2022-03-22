<%-- 
    Document   : shopAdmin
    Created on : Mar 12, 2022, 9:54:30 PM
    Author     : Tuan
--%>

<%@page import="dal.CategoriesDAL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page import="model.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
    String user = (String) session.getAttribute("user");
    String pass = (String) session.getAttribute("pass");
    Account acc = new Account(user, pass);
    String catid = request.getParameter("catid");
    session.setAttribute("catid", catid);
    List<Categories> lsCategories = new ArrayList<Categories>();
    lsCategories = new CategoriesDAL().getAllCategories();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>

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
                        <h2>All Products</h2>
                        <ul class="breadcrumb d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="adminlist">Home</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--Book Product-->
        <div class="shop-box-inner">
            <div class="container">
                <div class="d-flex mb-3 justify-content-around">
                    <div class="manage" style="margin-left: 109px">
                        <form action="AdminManage" method="get">
                            <button type="submit" class="btn btn-warning btn-lg">Manage Products</button>
                        </form>
                    </div>
                    <div class="static">
                        <form action="AdminStatistic" method="get">
                            <button type="submit" class="btn btn-info btn-lg">Statistic</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 shop-content-left text-center">
                        <div class="product-category">
                            <h3>
                                Categories
                            </h3>
                            <div class="list-group list-group-flush">
                                <a href="adminlist" class="list-group-item list-group-item-action"> All </a>
                                <% for (Categories cat : lsCategories) {
                                %>
                                <span class="d-flex">
                                    <a href="adminlist?catid=<%=cat.getCatid()%>" class="list-group-item list-group-item-action" value="<%=cat.getName()%>"> <%=cat.getName()%> </a>
                                    <a href="AdminDeleteCategories?catid=<%=cat.getCatid()%>" class="list-group-item list-group-item-action delete" value="<%=cat.getName()%>" data-confirm="Are you sure to delete this category?"><button type="button" class="btn btn-warning btn-sm">delete</button></a>
                                </span>
                                <%
                                    }
                                %>
                            </div>
                            <a href="AdminAddCategories">
                                <button type="submit" class="btn btn-success btn-small">Add Categories</button>
                            </a>
                        </div>
                        <div class="product-filter">
                            <h4>
                                Sort By
                            </h4>
                            <hr>
                            <div class="list-group">
                                <form action="adminlist">
                                    <select name="sort" class="text-center">
                                        <option value="">--Please choose an option--</option>
                                        <option value="price" ${price}>Price</option>
                                        <option value="bestSeller" ${best}>Best Seller</option>
                                        <option value="name" ${name}>Name</option>
                                    </select>
                                    <button type="submit"> Apply </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 shop-content-right">

                        <div class="search-product">
                            <form action="adminlist" method="get" class="d-flex">
                                <input class="form-control" placeholder="Search here..." type="text" name="search">
                                <button type="submit"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <c:if test="${bookList.size()==0}">
                            <h3 style="color: brown">Not found Product like "${searchname}"</h3>
                        </c:if>
                        <!--                        <div class="d-flex my-3 justify-content-around">
                                                    <div class="add">
                                                        <form action="AdminAddProduct" method="get">
                                                            <button type="submit" class="btn btn-warning btn-lg">Add product</button>
                                                        </form>
                                                    </div>
                                                    <div class="static">
                                                        <form action="AdminStatistic" method="get">
                                                            <button type="submit" class="btn btn-info btn-lg">Statistic</button>
                                                        </form>
                                                    </div>
                                                </div>-->

                        <div class="product-container-box">
                            <div class="row">
                                <c:forEach var="book" items="${bookList}">
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

                            </div>
                            <div class="pagination-container">
                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                    <a class="${i==page?"active":""}" href="adminlist?page=${i}">
                                        <span class="page-item ${i==page?"active":""}">
                                            ${i}
                                        </span>
                                    </a>
                                </c:forEach>
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
