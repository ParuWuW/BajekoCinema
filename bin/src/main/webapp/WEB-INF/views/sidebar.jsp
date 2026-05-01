<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String currentURI = request.getRequestURI();
    boolean isDashboard = currentURI.endsWith("dashboard.jsp");
    boolean isMovies = currentURI.endsWith("movies.jsp");
    boolean isUsers = currentURI.endsWith("users.jsp");
    // Default to dashboard if root or unknown
    if (!isDashboard && !isMovies && !isUsers) {
        isDashboard = true; 
    }
%>
<aside class="sidebar">
    <div class="brand">
        <!-- Placeholder for mascot/logo -->
        <img src="https://ui-avatars.com/api/?name=BC&background=FFB300&color=000&rounded=true&bold=true" alt="BajekoCinema Logo">
        <span>BajekoCinema</span>
    </div>

    <div class="nav-section">
        <div class="nav-title">Main Menu</div>
        <a href="${pageContext.request.contextPath}/dashboard" class="nav-item <%= isDashboard ? "active" : "" %>">
            <i class="ph ph-squares-four"></i>
            Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/movies" class="nav-item <%= isMovies ? "active" : "" %>">
            <i class="ph ph-film-strip"></i>
            Movies
        </a>
        <a href="${pageContext.request.contextPath}/users" class="nav-item <%= isUsers ? "active" : "" %>">
            <i class="ph ph-users"></i>
            User Management
        </a>
    </div>

    <div class="spacer"></div>

    <div class="nav-section">
        <div class="nav-title">System</div>
        <a href="#" class="nav-item">
            <i class="ph ph-gear"></i>
            Settings
        </a>
        <a href="#" class="nav-item logout">
            <i class="ph ph-sign-out"></i>
            Logout
        </a>
    </div>
</aside>
