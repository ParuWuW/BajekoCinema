<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.cinema.model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - Bajeko Cinema</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/userprofile.css">
</head>
<body>


<div class="profile-wrapper">
    <div class="profile-card">

        <div class="avatar-section">
            <img src="${user.profileImage}" alt="Profile Picture" class="avatar-img" />
            <span class="avatar-name">${user.username}</span>
        </div>

        <hr class="divider" />

        <div class="profile-fields">

            <div class="field-group">
                <label class="field-label">Username</label>
                <div class="field-value">${user.username}</div>
            </div>

            <div class="field-group">
                <label class="field-label">Email Address</label>
                <div class="field-value">${user.email}</div>
            </div>

            <div class="field-group">
                <label class="field-label">Phone Number</label>
                <div class="field-value">${empty user.phone ? 'Not provided' : user.phone}</div>
            </div>

            <div class="field-group">
                <label class="field-label">Password</label>
                <div class="field-value password-dots">••••••••</div>
            </div>

        </div>

        <div class="profile-actions">
            <a href="editProfile" class="btn btn-primary">Edit Profile</a>
            <a href="logout" class="btn btn-outline">Logout</a>
        </div>

    </div>
    
    <div class="booking-section">
    <div class="section-header">
    <h2 class="section-title"> Booking History</h2> 
    <span class="booking-count">
    <% List<Booking> bookingList = (List<Booking>)request.getAttribute("bookingList");
    int count = (bookingList != null) ? bookingList.size() : 0;
    out.print(count + "Booking" + (count != 1 ? "s" : ""));
    %>
    </span>
    </div>
    
    <% 
    if (bookingList == null || bookingList.isEmpty()) {
    %>
    <div class="empty-bookings"> 
    <div class="empty-icon"></div>
    <p class="empty-title"> No booking yet</p></div>
    <p class="empty-sub">Your past movie bookings will appear here.</p>
            <a href="movies" class="btn btn-primary" style="display:inline-block; margin-top: 1rem; width: auto; padding: 10px 24px;">Browse Movies</a>
        </div>
        <%
            } else {
        %>

        <div class="booking-list">
            <%
                for (Booking booking : bookingList) {
                    String statusClass = "status-confirmed";
                    if ("Cancelled".equalsIgnoreCase(booking.getStatus())) {
                        statusClass = "status-cancelled";
                    } else if ("Pending".equalsIgnoreCase(booking.getStatus())) {
                        statusClass = "status-pending";
                    }
            %>
            <div class="booking-card">

                <div class="booking-card-top">
                    <div class="booking-movie-info">
                        <span class="booking-movie-title"><%= booking.getMovieName() %></span>
                        <span class="booking-meta"><%= booking.getShowDate() %> <%= booking.getShowTime() %></span>
                    </div>
                    <span class="booking-status <%= statusClass %>"><%= booking.getStatus() %></span>
                </div>

                <hr class="booking-divider" />

                <div class="booking-card-bottom">
                    <div class="booking-details">
                        <div class="booking-detail-item">
                            <span class="detail-label">Booking ID</span>
                            <span class="detail-value">#<%= booking.getBookingId() %></span>
                        </div>
                        <div class="booking-detail-item">
                            <span class="detail-label">Seats</span>
                            <span class="detail-value"><%= booking.getSeatNumbers() %></span>
                        </div>
                        <div class="booking-detail-item">
                            <span class="detail-label">Total Paid</span>
                            <span class="detail-value booking-amount">Rs. <%= booking.getTotalAmount() %></span>
                        </div>
                    </div>

                    <div class="booking-card-actions">
                        <a href="viewBooking?id=<%= booking.getBookingId() %>" class="btn-sm btn-sm-outline">View</a>
                        <% if (!"Cancelled".equalsIgnoreCase(booking.getStatus())) { %>
                        <a href="cancelBooking?id=<%= booking.getBookingId() %>"
                           class="btn-sm btn-sm-danger"
                           onclick="return confirm('Are you sure you want to cancel this booking?');">Cancel</a>
                        <% } %>
                    </div>
                </div>

            </div>
            <%
                }
            %>
        </div>

        <%
            }
        %>

    
    </div>
</div>


</body>
</html>
