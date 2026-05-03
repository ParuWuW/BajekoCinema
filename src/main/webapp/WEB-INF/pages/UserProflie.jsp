<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - Bajeko Cinema</title>
    <link rel="stylesheet" href="resources/css/profile.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">BAJEKO CINEMA</div>
    <div class="nav-links">
        <a href="#">Movies</a>
        <a href="#">Cinemas</a>
        <a href="#">Offers</a>
    </div>
    <div class="nav-right">
        <span class="nav-user">
            Welcome, <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %>
        </span>
        <a href="logout" class="logout-btn">Logout</a>
    </div>
</nav>

<div class="page-wrapper">

    <aside class="sidebar">
        <div class="sidebar-avatar">
            <div class="avatar-circle">
           <div class="avatar-circle">
    <span class="avatar-initials">?</span>
</div>
                <span class="avatar-initials">?</span>
            </div>
            <h3 class="sidebar-username">
    <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Username" %>
</h3>
            <span class="membership-badge">GOLD MEMBER</span>
        </div>

        <!-- Sidebar Navigation -->
        <nav class="sidebar-nav">
            <a href="#" class="nav-item active">
                <span class="nav-icon">&#128100;</span> My Profile
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">&#127915;</span> My Tickets
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">&#11088;</span> My Loyalty
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">&#128065;</span> Watchlist
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">&#9881;</span> Settings
            </a>
        </nav>

        <a href="bookTicket" class="book-btn">Book Now</a>
    </aside>

    <main class="main-content">

        <div class="page-header">
            <div>
                <h2>My Profile</h2>
                <p>Manage your personal information and cinema preferences.</p>
            </div>
            <a href="editProfile" class="edit-btn">Edit Profile</a>
        </div>

        <div class="info-row">

            <div class="card">
                <h4 class="card-title">PERSONAL DETAILS</h4>
                <div class="detail-grid">
                    <div class="detail-item">
                        <span class="detail-label">FIRST NAME</span>
                        <!-- Pull from DB: userBean.getFirstName() -->
                        <span class="detail-value">First Name</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">LAST NAME</span>
                        <!-- Pull from DB: userBean.getLastName() -->
                        <span class="detail-value">Last Name</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">DATE OF BIRTH</span>
                        <!-- Pull from DB: userBean.getDob() -->
                        <span class="detail-value">DOB</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">GENDER</span>
                        <!-- Pull from DB: userBean.getGender() -->
                        <span class="detail-value">Gender</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">USERNAME</span>
                        <!-- Pull from DB: userBean.getUsername() -->
                        <span class="detail-value">Username</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">PASSWORD</span>
                        <!-- Password is hashed — show masked placeholder -->
                        <span class="detail-value">••••••••</span>
                    </div>
                </div>
            </div>

            <div class="card contact-card">
                <h4 class="card-title">CONTACT INFO</h4>
                <div class="contact-item">
                    <span class="contact-icon">&#9993;</span>
                    <div>
                        <span class="detail-label">EMAIL</span><br>
                        <!-- Pull from DB: userBean.getEmail() -->
                        <span class="detail-value">user@email.com</span>
                    </div>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">&#128222;</span>
                    <div>
                        <span class="detail-label">PHONE</span><br>
                        <!-- Pull from DB: userBean.getPhoneNumber() -->
                        <span class="detail-value">+977 XXXXXXXXXX</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="card address-card">
            <span class="contact-icon">&#128205;</span>
            <div>
                <span class="detail-label">PRIMARY ADDRESS</span><br>
                <!-- Pull from DB: userBean.getAddress() -->
                <span class="detail-value">City, District, Nepal</span>
            </div>
            <a href="editAddress" class="change-link">Change</a>
        </div>

        <div class="section-header">
            <h4>Ticket History</h4>
            <a href="ticketHistory" class="view-all">View All History &rarr;</a>
        </div>

        <div class="ticket-grid">

            <div class="ticket-card">
                <div class="ticket-poster placeholder-poster">Movie 1</div>
                <div class="ticket-info">
                    <span class="ticket-title">Movie Title</span>
                    <span class="ticket-format imax">IMAX 4K</span>
                    <span class="ticket-date">Mar 15, 2024 &bull; 7:30 PM</span>
                    <span class="ticket-seat">Screen 04 &bull; Seat G12, G13</span>
                </div>
            </div>

            <div class="ticket-card">
                <div class="ticket-poster placeholder-poster">Movie 2</div>
                <div class="ticket-info">
                    <span class="ticket-title">Movie Title</span>
                    <span class="ticket-format dolby">DOLBY CINEMA</span>
                    <span class="ticket-date">Jan 02, 2024 &bull; 9:00 PM</span>
                    <span class="ticket-seat">Screen 01 &bull; Seat F04</span>
                </div>
            </div>

            <div class="ticket-card">
                <div class="ticket-poster placeholder-poster">Movie 3</div>
                <div class="ticket-info">
                    <span class="ticket-title">Movie Title</span>
                    <span class="ticket-format digital">DIGITAL</span>
                    <span class="ticket-date">Dec 12, 2023 &bull; 6:45 PM</span>
                    <span class="ticket-seat">Screen 02 &bull; Seat B05</span>
                </div>
            </div>

        </div>
    </main>
</div>

</body>
</html>
