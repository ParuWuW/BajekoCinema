<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css//Header.css">
</head>
<body>
    <header class="navbar">
        <div class="nav-container">
            <div class="nav-logo">
                <img src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="BAJEKO Logo"
                    onerror="this.src='https://via.placeholder.com/40x40/FFD700/000000?text=B'">
            </div>

            <nav class="nav-menu">
                <a href="${pageContext.request.contextPath}/home" class="nav-link ${activePage == 'home' ? 'active' : ''}">Home</a>
                <a href="${pageContext.request.contextPath}/aboutUs" class="nav-link ${activePage == 'aboutUs' ? 'active' : ''}">About Us</a>
                <a href="${pageContext.request.contextPath}/contactUs" class="nav-link ${activePage == 'customerSupport' ? 'active' : ''}">Customer Support</a>
            </nav>

            <div class="nav-actions">
                <div class="search-bar">
                    <i class="fa-solid fa-search"></i>
                    <input type="text" placeholder="Search films...">
                </div>
                <button class="profile-btn"><i class="fa-solid fa-user"></i></button>
            </div>
        </div>
    </header>
</body>
</html>