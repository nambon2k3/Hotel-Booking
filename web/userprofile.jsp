<%-- 
    Document   : userprofile
    Created on : Feb 8, 2024, 8:39:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Website: wwww.codingdung.com-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile</title>

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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styleprofile.css">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>

        <jsp:include page="header.jsp"/>

        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">
                Account settings
            </h4>
            <div class="card overflow-hidden" style="padding: 50px">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action ${message == null ? 'active' : ''}" data-toggle="list"
                               href="#account-general">General</a>
                            <a class="list-group-item list-group-item-action ${message == null ? '' : 'active'}" data-toggle="list"
                               href="#account-change-password">Change password</a>
                        </div>
                    </div>
                    <div class="col-md-9">

                        <div class="tab-content">

                            <div class="tab-pane fade ${message == null ? 'active show' : ''}" id="account-general" style="padding: 30px">
                                <form action="profile" method="post" >
                                    <div class="card-body media align-items-center">
                                        <img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt
                                             class="d-block ui-w-80">
                                    </div>
                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-label">Full Name: </label>
                                            <input type="text" class="form-control mb-1" value="${user.fullName}" name="fullName">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Gender</label>
                                            <select class="form-control" id="exampleSelect" name="gender">
                                                <c:choose>
                                                    <c:when test="${user.gender == '1'}">
                                                        <option value="Male" selected>Male</option>
                                                        <option value="Female">Female</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="Male">Male</option>
                                                        <option value="Female"selected>Female</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Birthday</label>
                                            <input type="text" class="form-control" value="${user.dob}" name="dob">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Phone</label>
                                            <input type="text" class="form-control" value="${user.phone}" name="phone">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">E-mail</label>
                                            <input type="text" class="form-control mb-1"  value="${user.email}" name="username"  readonly>
                                            <span style="color: #34ce57">Your email is confirmed.</span>
                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                                        <button type="button" class="btn btn-default" onclick="window.location.href = './profile'">Cancel</button>
                                    </div>
                                </form>
                            </div>

                            <div class="tab-pane fade ${message == null ? '' : 'active show'}" id="account-change-password" style="padding: 30px">
                                <form action="changepass">
                                    <div class="card-body pb-2">
                                        <div class="form-group">
                                            <label class="form-label" >Current password</label>
                                            <input type="password" name="oldpass" class="form-control" required>
                                            <span style="color: #dc3545;">${message}</span>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">New password</label>
                                            <input id="newpass" type="password" name="newpass" class="form-control" required pattern="^\d{6,}$" title="Password must >= 6 characters">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Repeat new password</label>
                                            <input id="renewpass" type="password" name="renewpass" class="form-control" oninput="check()" required>
                                            <span id="error" style="color: #dc3545; display: none">Confirm-password is not match</span>
                                        </div>
                                    </div>

                                    <div class="text-right mt-3">
                                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                                        <button type="button" class="btn btn-default" onclick="window.location.href = './profile'">Cancel</button>
                                    </div>
                                </form>

                            </div>

                        </div>

                    </div>
                </div>

            </div>
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                function check() {
                    var newpass = document.getElementById('newpass');
                    var renewpass = document.getElementById('renewpass');
                    var error = document.getElementById('error');
                    
                    if(renewpass.value !== newpass.value) {
                        error.style.display = 'inline';
                    }
                    else {
                         error.style.display = 'none';
                    }
                }
            </script>
    </body>

</html>
