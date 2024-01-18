<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    /* Main Color */
    :root {
        --main-color: #ff9843;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: var(--main-color);">
    <div class="container">
        <a class="navbar-brand" href="home">Hotel Booking</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">

                <c:if test="${not empty sessionScope.User}">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile">Profile</a>
                    </li>
                </c:if>
                <c:if test="${empty sessionScope.User}">
                    <li class="nav-item active">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </c:if>


            </ul>
        </div>
    </div>
</nav>
