<%-- 
    Document   : shop
    Created on : Mar 4, 2022, 11:08:21 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                        <a class="navbar-brand" href="home"><img src="images/logo.png" class="logo" alt=""></a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <!--link to home page-->
                                <a class="nav-link" href="home">Home</a>
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
                        <h2>All Products</h2>
                        <ul class="breadcrumb d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!--Book Product-->
        <div class="shop-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 shop-content-left text-center">
                        <div class="product-category">
                            <h3>
                                Categories
                            </h3>
                            <div class="list-group list-group-flush">
                                <a href="home" class="list-group-item list-group-item-action default"> All </a>
                                <a href="home?catid=cat1" class="list-group-item list-group-item-action" value="Literature"> Literature </a>
                                <a href="home?catid=cat2" class="list-group-item list-group-item-action" value="Mystery"> Mystery </a>
                                <a href="home?catid=cat3" class="list-group-item list-group-item-action" value="Romance"> Romance </a>
                            </div>
                        </div>
                        <div class="product-filter">
                            <h4>
                                Sort By
                            </h4>
                            <hr>
                            <div class="list-group">
                                <form action="home">
                                    <select name="sort" class="text-center">
                                        <option value="">--Please choose an option--</option>
                                        <option value="price">Price</option>
                                        <option value="bestSeller">Best Seller</option>
                                        <option value="name">Name</option>
                                    </select>
                                    <button type="submit"> Apply </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 shop-content-right">
                        <div class="search-product">
                            <form action="home" method="get" class="d-flex">
                                <input class="form-control" placeholder="Search here..." type="text" name="search">
                                <button type="submit"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>

                        <div class="product-container-box">
                            <div class="row">
                                <div class="col-lg-4 mb-4">
                                    <div class="product-single">
                                        <div>
                                            <img src="products/1984.jpg" class="img-fluid" alt="Image">
                                            <div class="product-action d-flex justify-content-between">
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="Add to cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 mb-4">
                                    <div class="product-single">
                                        <div>
                                            <img src="products/1984.jpg" class="img-fluid" alt="Image">
                                            <div class="product-action d-flex justify-content-between">
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="Add to cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 mb-4">
                                    <div class="product-single">
                                        <div>
                                            <img src="products/1984.jpg" class="img-fluid" alt="Image">
                                            <div class="product-action d-flex justify-content-between">
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="Add to cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 mb-4">
                                    <div class="product-single">
                                        <div>
                                            <img src="products/1984.jpg" class="img-fluid" alt="Image">
                                            <div class="product-action d-flex justify-content-between">
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="Add to cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 mb-4">
                                    <div class="product-single">
                                        <div>
                                            <img src="products/1984.jpg" class="img-fluid" alt="Image">
                                            <div class="product-action d-flex justify-content-between">
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="Add to cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 mb-4">
                                    <div class="product-single">
                                        <div>
                                            <img src="products/1984.jpg" class="img-fluid" alt="Image">
                                            <div class="product-action d-flex justify-content-between">
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="Add to cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
                                                <a href="#" target="_blank" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
    </body>
</html>
