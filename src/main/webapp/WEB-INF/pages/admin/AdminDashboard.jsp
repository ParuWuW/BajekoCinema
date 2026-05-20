<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>BajekoCinema - Admin Dashboard</title>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Global.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Layout.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Components.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css?v=3">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Tables.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ResponsiveAdmin.css">
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                        rel="stylesheet">
                </head>

                <body>
                    <div class="app-container">

                        <jsp:include page="../common/SidebarAdmin.jsp" />

                        <div class="main-container">
                            <main class="page-content">

                                <div class="page-header">
                                    <div>
                                        <h4>Management Overview</h4>
                                        <h1>Admin Dashboard</h1>
                                    </div>
                                </div>

                                <!-- Dashboard Cards -->
                                <div class="admin-dash-cards">

                                    <!-- Stat Cards — data from servlet via EL -->
                                    <div class="admin-dash-card admin-stat-card">
                                        <span class="admin-card-label">Total Bookings 🎟️</span>
                                        <span class="admin-stat-value">${totalBookings}</span>
                                    </div>

                                    <div class="admin-dash-card admin-stat-card">
                                        <span class="admin-card-label">Total Revenue 💵</span>
                                        <span class="admin-stat-value">
                                            Rs.
                                            <fmt:formatNumber value="${totalRevenue}" type="number"
                                                minFractionDigits="2" maxFractionDigits="2" />
                                        </span>
                                    </div>

                                    <div class="admin-dash-card admin-stat-card">
                                        <span class="admin-card-label">Active Movies 🎬</span>
                                        <span class="admin-stat-value">${activeMovies}</span>
                                    </div>

                                    <div class="admin-dash-card admin-stat-card">
                                        <span class="admin-card-label">Registered People 👥</span>
                                        <span class="admin-stat-value">${registeredUsers}</span>
                                    </div>

                                    <!-- Navigation Cards -->
                                    <a href="${pageContext.request.contextPath}/movies" class="admin-dash-card">
                                        <span class="admin-card-icon">🎬</span>
                                        <span class="admin-card-label">Movies</span>
                                    </a>

                                    <a href="${pageContext.request.contextPath}/users" class="admin-dash-card">
                                        <span class="admin-card-icon">👥</span>
                                        <span class="admin-card-label">Users</span>
                                    </a>

                                    <a href="${pageContext.request.contextPath}/shows" class="admin-dash-card">
                                        <span class="admin-card-icon">🎭</span>
                                        <span class="admin-card-label">Shows</span>
                                    </a>

                                    <a href="${pageContext.request.contextPath}/Abooking" class="admin-dash-card">
                                        <span class="admin-card-icon">🎟️</span>
                                        <span class="admin-card-label">Bookings</span>
                                    </a>

                                    <a href="${pageContext.request.contextPath}/admin/management" class="admin-dash-card">
                                        <span class="admin-card-icon">💼</span>
                                        <span class="admin-card-label">Management</span>
                                    </a>

                                </div>
                            </main>

                            <jsp:include page="../common/FooterAdmin.jsp" />
                        </div>
                    </div>
                </body>

                </html>