<%-- 
    Document   : checkout
    Created on : Mar 11, 2022, 9:31:11 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
                                <a class="nav-link active" href="home">Home</a>
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
                        <h2>Cart</h2>
                        <ul class="breadcrumb d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">Checkout</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Start Cart  -->
        <div class="contact-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="checkout-address">
                            <div class="title-left">
                                <h3>Billing address</h3>
                            </div>
                            <form class="needs-validation" novalidate>
                                <div class="mb-3">
                                    <label for="firstName">Full name *</label>
                                    <input type="text" class="form-control" id="firstName" placeholder="" value="<c:out value="${currAcc.fullname}"/>" readonly="">
                                </div>
                                <div class="mb-3">
                                    <label for="address">Address *</label>
                                    <input type="text" class="form-control" id="address" placeholder="" value="<c:out value="${currAcc.address}"/>" readonly="">
                                </div>
                                <div class="mb-3">
                                    <label for="phone">Phone number *</label>
                                    <input type="text" class="form-control" id="phone" placeholder="" value="<c:out value="${currAcc.phone}"/>" readonly="">
                                </div>
                                <div class="mb-3">
                                    <label for="email">Email Address *</label>
                                    <input type="email" class="form-control" id="email" placeholder="" value="<c:out value="${currAcc.email}"/>" readonly="">
                                </div>


                                <hr class="mb-4">
                                <div class="title"> <span>Payment</span> </div>
                                <div class="d-block my-3">
                                    <div class="custom-control custom-radio">
                                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                        <label class="custom-control-label" for="credit">Cash</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                        <label class="custom-control-label" for="debit">Bank Card</label>
                                    </div>
                                </div>
                                <hr class="mb-1"> </form>
                        </div>
                        <div class="shipping-method-box">
                            <div class="title-left">
                                <h3>Shipping Method</h3>
                            </div>
                            <div class="mb-4">
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
                                    <label class="custom-control-label" for="shippingOption1">Giao Hàng Tiết Kiệm</label> <span class="float-right font-weight-bold">FREE</span> 
                                </div>
                                <div class="ml-4 mb-2 small">(3-7 business days)</div>
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
                                    <label class="custom-control-label" for="shippingOption2">BEST Express</label> <span class="float-right font-weight-bold">FREE</span> 
                                </div>
                                <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
                                    <label class="custom-control-label" for="shippingOption3">Viettel Post</label> <span class="float-right font-weight-bold">FREE</span> 
                                </div>
                                <div class="ml-4 mb-2 small">(3-5 business days)</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="row">

                            <div class="col-md-12 col-lg-12">
                                <div class="odr-box">
                                    <div class="title-left">
                                        <h3>Shopping cart</h3>
                                    </div>
                                    <c:forEach items="${listCart}" var="cart">
                                        <div class="rounded p-2 bg-light">
                                            <div class="media mb-2 border-bottom">
                                                <div class="media-body"> <a href="detail?pid=${cart.pid}"> ${cart.name}</a>
                                                    <div class="small text-muted">Price: $${cart.price} <span class="mx-2">|</span> Qty: ${cart.quantity} <span class="mx-2">|</span> Total: $${cart.getTotal()}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-12">
                                <div class="order-box">
                                    <div class="title-left">
                                        <h5>Your order</h5>
                                    </div>
                                    <div class="d-flex">
                                        <h6 class="font-weight-bold">Product</h6>
                                        <h6 class="ml-auto font-weight-bold">Total</h6>
                                    </div>

                                    <div class="d-flex">
                                        <h6>Tax</h6>
                                        <div class="ml-auto font-weight-bold"> $ 0 </div>
                                    </div>
                                    <div class="d-flex">
                                        <h6>Shipping Cost</h6>
                                        <div class="ml-auto font-weight-bold"> Free </div>
                                    </div>
                                    <hr>
                                    <div class="d-flex">
                                        <h5 style="color: brown">Grand Total</h5>
                                        <div class="ml-auto h5"> $ <c:out value="${total}"/> </div>
                                    </div>
                                    <hr> </div>
                            </div>
                            <div class="col-12 d-flex shopping-box"> 
<!--                                <button type="button" class="btn btn-outline-primary">
                                    <a href="pay" class="">Place Order</a>
                                </button>-->
                                <a href="pay" class="btn btn-outline-danger col-lg-3 offset-md-9" role="button" aria-pressed="true">Place Order</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- End Cart -->

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
