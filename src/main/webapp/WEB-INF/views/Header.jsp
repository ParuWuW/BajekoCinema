<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String activePage = (String) request.getAttribute("activePage");
    if (activePage == null) {
        activePage = "";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<header class="navbar">
    <div class="nav-container">
        <div class="nav-logo">
            <!-- Logo Database Placeholder -->
            <img src="images/logo.png" alt="BAJEKO Logo"
                onerror="this.src='https://via.placeholder.com/40x40/FFD700/000000?text=B'">
            <span class="logo-text">BAJEKO<br>Cinema</span>
        </div>

        <nav class="nav-menu">
            <a href="home.jsp" class="nav-link <%= "home".equals(activePage) ? "active" : "" %>">Home</a>
            <a href="#" class="nav-link <%= "ticketRate".equals(activePage) ? "active" : "" %>">Ticket Rate</a>
            <a href="aboutUs.jsp" class="nav-link <%= "aboutUs".equals(activePage) ? "active" : "" %>">About Us</a>
            <a href="customerSupport" class="nav-link <%= "customerSupport".equals(activePage) ? "active" : "" %>">Customer Support</a>
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