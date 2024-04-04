<%-- 
    Document   : listrooms
    Created on : Jan 20, 2024, 2:23:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="dao.FeedbackDAO" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sona | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            .footer-color {
                background: #7dbaab;
            }

            .footer-btn {
                background: #415762;
            }

            .check-container {
                background: #7dbaab;
                height: 82px;
                width: 82px;
            }

            .iconheight {
                height: 36px;
                width: 36px;
            }

            .btn:hover {
                color: var(--bs-btn-hover-color);
                background: #415762;
                border-color: #415762;
            }

            .angle::after {
                position: absolute;
                content: "";
                height: 20px;
                width: 20px;
                top: -1px;
                left: 48%;
                background: #fff;
                clip-path: polygon(50% 50%, 0 0, 100% 0);
            }

            #close:hover {
                color: #415762;
                cursor: pointer

            }

            .stars i{
                color: #e6e6e6;
                cursor: pointer;
                transition: color 0.2s ease;
                font-size: 25px
            }

            .stars i.active{
                color: #ff9c1a;
            }
        </style>
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Section Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="canvas-open">
            <i class="icon_menu"></i>
        </div>
        <div class="offcanvas-menu-wrapper">
            <div class="canvas-close">
                <i class="icon_close"></i>
            </div>
            <div class="search-icon search-switch">
                <i class="icon_search"></i>
            </div>
            <div class="header-configure-area">
                <div class="language-option">
                    <img src="img/flag.jpg" alt="">
                    <span>EN <i class="fa fa-angle-down"></i></span>
                    <div class="flag-dropdown">
                        <ul>
                            <li><a href="#">Zi</a></li>
                            <li><a href="#">Fr</a></li>
                        </ul>
                    </div>
                </div>
                <a href="#" class="bk-btn">Booking Now</a>
            </div>
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li class="active"><a href="./index.html">Home</a></li>
                    <li><a href="./rooms.html">Rooms</a></li>
                    <li><a href="./about-us.jsp">About Us</a></li>
                    <li><a href="./pages.html">Pages</a>
                        <ul class="dropdown">
                            <li><a href="./room-details.html">Room Details</a></li>
                            <li><a href="./blog-details.html">Blog Details</a></li>
                            <li><a href="#">Family Room</a></li>
                            <li><a href="#">Premium Room</a></li>
                        </ul>
                    </li>
                    <li><a href="./blog.html">News</a></li>
                    <li><a href="./contact.jsp">Contact</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="top-social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <ul class="top-widget">
                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
            </ul>
        </div>
        <!-- Offcanvas Menu Section End -->

        <!-- Header Section Begin -->
        <header class="header-section header-normal">
            <div class="top-nav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="tn-left">
                                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <div class="tn-right">
                                <a href="listroom" class="bk-btn">Booking Now</a>
                                <div class="language-option">
                                    <img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="">
                                    <c:if test="${sessionScope.User != null}">

                                        <span>User <i class="fa fa-angle-down"></i></span>
                                        </c:if>
                                        <c:if test="${sessionScope.User eq null}">
                                        <span><i class="fa fa-sign-in"></i></span>
                                        </c:if>
                                    <div class="flag-dropdown">
                                        <ul>
                                            <c:if test="${sessionScope.User != null}">
                                                <li><a href="profile">Profile</a></li>
                                                <li><a href="#">Booked</a></li> 
                                                <li><a href="log">Logout</a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.User eq null}">
                                                <li><a href="login.jsp">Login</a></li>
                                                </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="menu-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="home">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="nav-menu">
                                <nav class="mainmenu">
                                    <ul>
                                            <c:if test="${sessionScope.User != null}">
                                                <li><a href="profile">Profile</a></li>
                                                <li><a href="listbooked">Booked</a></li> 
                                                <li><a href="cart">Cart</a></li> 
                                                <li><a href="historybooking">Invoice History</a></li> 
                                                <li><a href="log">Logout</a></li>
                                            </c:if>
                                            <c:if test="${sessionScope.User eq null}">
                                                <li><a href="login.jsp">Login</a></li>
                                            </c:if>
                                        </ul>
                                </nav>
                                <div class="nav-right search-switch">
                                    <i class="icon_search"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header End -->
        
        

        <!-- Breadcrumb Section Begin -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <h2>Booked Rooms</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section End -->

        <!-- Rooms Section Begin -->
        <section class="rooms-section spad">
            <div class="container">
                <div class="row">
                    <c:forEach items="${requestScope.roomList}" var="room">
                        <div class="col-lg-4 col-md-6">
                            <div class="room-item">
                                <img src="${room.getImg()}" alt="" style="aspect-ratio: 1.5/1">
                                <div class="ri-text">
                                    <h4>${room.getName()}</h4>
                                    <h3>${String.format("%,.0f", room.getPrice())} VND<span>/Pernight</span></h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Size:</td>
                                                <td>${room.getSize()} ft</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Capacity:</td>
                                                <td>Max persion ${room.getCapacity()}</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Bed:</td>
                                                <td>${room.getBedSById().getBedName()}</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Services:</td>
                                                <td>${room.listServiceInString()}</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Total booked: </td>
                                                <td>${room.totalRoom}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="text-center pt-5">

                                        <c:if test="${room.checkFeedback(sessionScope.User.getUserId())}">
                                            <button onclick="getId(${room.getRID()})" type="button" class="btn btn-primary" style="background: #dfa974; border: 0" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Give feedback
                                            </button>
                                        </c:if>


                                        <c:if test="${!room.checkFeedback(sessionScope.User.getUserId())}">
                                            <button onclick="display(${room.getRID()})" type="button" class="btn btn-primary" style="background: #dfa974; border: 0">
                                                View feedback
                                            </button>
                                        </c:if>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-lg-12">
                        <div class="room-pagination">
                            <c:if test="${index ne 1}">
                                <a href="listroom?index=${index -1}">Previous <i class="fa fa-long-arrow-left"></i></a>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.endPage}" var="page">
                                <a href="listroom?index=${page}" ${page == index ? 'style="background-color: #DFA974; color: white"' : ''}>${page}</a>
                            </c:forEach>
                            <c:if test="${index ne endPage}">
                                <a href="listroom?index=${index + 1}">Next <i class="fa fa-long-arrow-right"></i></a>
                                </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Rooms Section End -->

        <!-- Modal -->
        <div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content rounded-0">
                    <div class="modal-header border-0 d-flex justify-content-end">
                        <!-- <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1> -->
                        <div class="btn-close shadow-none" data-bs-dismiss="modal"
                             aria-label="Close">
                            <i id="close" class='bx bx-x' style="font-size: 40px"></i>

                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">

                            <h1 class="fw-bold">FB!</h1>
                            <div class="review-add">
                                <h4>Add Review</h4>
                                <h5>How was your experience</h5>
                                <form id="ratingg" action="rating" class="ra-form">
                                    <input id="id" type="hidden" name="id" value="">
                                    <input id="star" type="hidden" name="star" value="">

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div>

                                                <div class="stars">
                                                    <i class="icon_star"></i>
                                                    <i class="icon_star"></i>
                                                    <i class="icon_star"></i>
                                                    <i class="icon_star"></i>
                                                    <i class="icon_star"></i>
                                                </div>
                                            </div>
                                            <br>
                                            <textarea placeholder="Your Review" name="content"></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <p class="fw-bold">We are opening to your suggest and opinion!</p>
                        </div>
                    </div>
                    <div class="modal-footer border-0 justify-content-center footer-color rounded-0 position-relative" style="background: #dfa974">
                        <div class="angle "></div>
                        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                        <div class="text-center p-4 ">
                            <button type="button" class="btn shadow-none footer-btn text-white rounded-0 px-5"
                                    style="background: #ae6231"
                                    onclick="submitForm()">
                                Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Footer Section Begin -->
        <footer class="footer-section">
            <div class="container">
                <div class="footer-text">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="ft-about">
                                <div class="logo">
                                    <a href="#">
                                        <img src="img/footer-logo.png" alt="">
                                    </a>
                                </div>
                                <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                                <div class="fa-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="ft-contact">
                                <h6>Contact Us</h6>
                                <ul>
                                    <li>(12) 345 67890</li>
                                    <li>info.colorlib@gmail.com</li>
                                    <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="ft-newslatter">
                                <h6>New latest</h6>
                                <p>Get the latest updates and offers.</p>
                                <form action="#" class="fn-form">
                                    <input type="text" placeholder="Email">
                                    <button type="submit"><i class="fa fa-send"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <ul>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Terms of use</a></li>
                                <li><a href="#">Privacy</a></li>
                                <li><a href="#">Environmental Policy</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search model Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>



        <!-- Button trigger modal -->
        <div class="text-center pt-5" style="display: none">
            <button id="bookingbtnn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                Launch demo modal
            </button>
        </div>

        <!-- Modal -->
        <div class="modal fade active" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content rounded-0">
                    <div class="modal-body">
                        <div class="text-center">
                            <div class="d-flex justify-content-center pb-2">
                                <div class="check-container d-flex justify-content-center align-items-center rounded-pill">
                                    <img class="iconheight"
                                         src="https://img.icons8.com/office/16/000000/checkmark--v1.png"
                                         alt="check-lg">
                                </div>
                            </div>
                            <h1 class="fw-bold">Awesome!</h1>
                            <p class="fw-bold">Thanks for your feedback!</p>
                        </div>
                    </div>
                    <div class="modal-footer border-0 justify-content-center footer-color rounded-0 position-relative">
                        <div class="angle "></div>
                        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                        <div class="text-center p-4 ">
                            <button type="button" data-bs-dismiss="modal"
                                    aria-label="Close" class="btn shadow-none footer-btn text-white rounded-0 px-5">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Button trigger modal -->
        <div class="text-center pt-5" style="display: none">
            <button id="viewfbbtnn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">
                Launch demo modal
            </button>
        </div>

        <!-- Modal -->
        <div class="modal fade " id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content rounded-0">
                    <div class="modal-header border-0 d-flex justify-content-end">
                        <!-- <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1> -->
                        <div class="btn-close shadow-none" data-bs-dismiss="modal"
                             aria-label="Close">
                            <i id="close" class='bx bx-x' style="font-size: 40px"></i>

                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">

                            <h1 class="fw-bold">FB!</h1>
                            <div class="review-add">
                                <h4>Your Review</h4>
                                <h5>How was your experience</h5>
                                <form id="ratting2" action="updatefeedback" class="ra-form">
                                    <input id="id" type="hidden" name="id" value="${feedback.getRoomId()}">
                                    <input id="star2" type="hidden" name="star" value="">

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div>
                                                <div class="stars">
                                                    <c:forEach begin="1" end="${feedback.getRating()}">
                                                        <i class="icon_star active"></i>
                                                    </c:forEach>

                                                    <c:forEach begin="${feedback.getRating()}" end="4">
                                                        <i class="icon_star "></i>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <br>
                                            <textarea placeholder="Your Review" name="content">${feedback.getContent()}</textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <p class="fw-bold">We are opening to your suggest and opinion!</p>
                        </div>
                    </div>
                    <div class="modal-footer border-0 justify-content-center footer-color rounded-0 position-relative" style="background: #dfa974">
                        <div class="angle "></div>
                        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                        <div class="text-center p-4 ">
                            <button type="button" class="btn shadow-none footer-btn text-white rounded-0 px-5"
                                    style="background: #ae6231"
                                    onclick="submitForm2()">
                                Update</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Search model end -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>


        <script>
                                       const stars = document.querySelectorAll('.stars i');
                                       const starrate = document.getElementById('star');
                                       stars.forEach((star, index1) => {

                                           star.addEventListener("click", () => {
                                               let starrate = document.getElementById('star');
                                               let starrate2 = document.getElementById('star2');
                                               starrate.value = index1 + 1;
                                               starrate2.value = index1 - 4;
                                               stars.forEach((star, index2) => {
                                                   index1 >= index2 ? star.classList.add("active") : star.classList.remove("active");
                                               });

                                           });
                                       });

                                       function submitForm() {
                                           document.getElementById('ratingg').submit();
                                       }
                                       
                                       function submitForm2() {
                                           document.getElementById('ratting2').submit();
                                       }
        </script>

        <script>
            function getId(id) {
                var inputId = document.getElementById('id');
                inputId.value = id;
            }

            function display(id) {
                window.location.href = './viewfeedback?id=' + id;
            }
        </script>


        <script>
            if ('${msg}'.length !== 0) {
                document.getElementById('bookingbtnn').click();
            }
            if ('${feedback}'.length !== 0) {
                document.getElementById('viewfbbtnn').click();
            }


        </script>

    </body>

</html>
