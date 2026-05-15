<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - Admin Dashboard</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Components.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Tables.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
            margin-top: 24px;
        }
        .dashboard-card {
            background: var(--bg-card, #1a1a2e);
            border: 1px solid var(--border-color, #2a2a3e);
            border-radius: 12px;
            padding: 80px 24px;
            text-align: center;
            text-decoration: none;
            color: var(--text-primary, #fff);
            cursor: pointer;
            transition: transform 0.2s, border-color 0.2s;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 16px;
        }
        .dashboard-card:hover {
            transform: translateY(-4px);
            border-color: var(--accent-cyan, #00bcd4);
        }
        .dashboard-card .card-icon {
            font-size: 48px;
        }
        .dashboard-card .card-label {
            font-size: 18px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .dashboard-card.full-width {
            grid-column: span 2;
        }
    </style>
</head>
<body>
    <div class="app-container">

        <%-- SIDEBAR INCLUDE --%>
        <jsp:include page="../common/SidebarAdmin.jsp" />

        <div class="main-container">

            <main class="page-content">

                <div class="page-header">
                    <div>
                        <h4>Management Overview</h4>
                        <h1>Admin Dashboard</h1>
                    </div>
                    <div class="header-buttons">
                    </div>
                </div>

                <<!-- Dashboard Cards -->
                <div class="dashboard-cards">

                    <a href="${pageContext.request.contextPath}/movies" class="dashboard-card">
                        <span class="card-icon">🎬</span>
                        <span class="card-label">Movies</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/users" class="dashboard-card">
                        <span class="card-icon">👥</span>
                        <span class="card-label">Users</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/shows" class="dashboard-card">
                        <span class="card-icon">🎭</span>
                        <span class="card-label">Shows</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/Abooking" class="dashboard-card">
                        <span class="card-icon">🎟️</span>
                        <span class="card-label">Bookings</span>
                    </a>

                </div>
            </main>

            <%-- FOOTER INCLUDE --%>
            <jsp:include page="../common/FooterAdmin.jsp" />

        </div>
    </div>
</body>
</html>