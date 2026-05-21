<%@ page contentType="text/html; charset=UTF-8" %>

<!-- Mobile Hamburger Toggle -->
<button class="sidebar-toggle" id="sidebarToggle" aria-label="Toggle menu">&#9776;</button>

<!-- Sidebar Overlay (for mobile) -->
<div class="sidebar-overlay" id="sidebarOverlay"></div>

<aside class="sidebar" id="adminSidebar">

    <!-- Logo / Brand -->
    <div class="brand">
        <span>BajekoCinema</span>
    </div>

    <!-- Main Menu -->
    <div class="nav-section">
        <div class="nav-title">Main Menu</div>

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="nav-item ${currentPage == 'dashboard' ? 'active' : ''}">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/admin/movies"
           class="nav-item ${currentPage == 'movies' ? 'active' : ''}">
            Movies
        </a>

        <a href="${pageContext.request.contextPath}/admin/users"
           class="nav-item ${currentPage == 'users' ? 'active' : ''}">
            User Management
        </a>

        <a href="${pageContext.request.contextPath}/admin/shows"
           class="nav-item ${currentPage == 'shows' ? 'active' : ''}">
            Shows
        </a>

        <a href="${pageContext.request.contextPath}/admin/booking"
           class="nav-item ${currentPage == 'Abooking' ? 'active' : ''}">
            Booking
        </a>

        <a href="${pageContext.request.contextPath}/admin/management"
           class="nav-item ${currentPage == 'management' ? 'active' : ''}">
            Management
        </a>
    </div>

    <div class="spacer"></div>

    <!-- System Section -->
    <div class="nav-section">
        <div class="nav-title">System</div>

        <a href="${pageContext.request.contextPath}/logout" class="nav-item logout">
            Logout
        </a>
    </div>

</aside>

