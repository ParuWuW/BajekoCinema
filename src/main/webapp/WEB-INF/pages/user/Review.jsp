<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Mock Data for demonstration
    request.setAttribute("movieTitle", "Project Hail Mary");
    request.setAttribute("bookingDate", "Dec 14, 2024 • 21:30");
    request.setAttribute("selectedCinema", "Chhaya Center");
    request.setAttribute("totalPrice", "640");
    request.setAttribute("moviePoster", "https://images.unsplash.com/photo-1534447677768-be436bb09401?q=80&w=300&auto=format&fit=crop"); 
    
    String[] selectedSeats = {"Row H, Seat 12", "Row H, Seat 13"};
    request.setAttribute("selectedSeats", selectedSeats);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>BAJEKO Cinema | Review Booking</title>

    <!-- Global/Shared Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/home.css">
    <!-- Review Specific Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/review.css">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="review-page-body">
    <!-- Using generic inner page active state -->
    <% request.setAttribute("activePage", "home"); %>
    <jsp:include page="../common/Header.jsp" />

    <main class="review-page">
        <div class="review-container">
            <h1 class="page-title">Review Booking</h1>
            
            <div class="review-layout">
                <!-- Left Column (Main Content) -->
                <div class="review-main">
                    <!-- Booking Card -->
                    <div class="booking-card dark-card">
                        <img src="${moviePoster}" alt="${movieTitle}" class="movie-poster">
                        <div class="booking-details">
                            <span class="now-showing">NOW SHOWING</span>
                            <h2 class="movie-title">${movieTitle}</h2>
                            
                            <div class="details-grid">
                                <div>
                                    <span class="detail-label">DATE & TIME</span>
                                    <span class="detail-value">${bookingDate}</span>
                                </div>
                                <div>
                                    <span class="detail-label">CINEMA HALL</span>
                                    <span class="detail-value">${selectedCinema}</span>
                                </div>
                            </div>
                            
                            <div class="seats-section">
                                <span class="detail-label">SELECTED SEATS</span>
                                <div class="seat-tags">
                                    <c:forEach var="seat" items="${selectedSeats}">
                                        <div class="seat-chip">
                                            <i class="fa-solid fa-chair"></i> ${seat}
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Payment Methods -->
                    <div class="payment-section">
                        <h3 class="section-heading">Payment Method</h3>
                        <div class="payment-grid">
                            <div class="payment-card selected">
                                <i class="fa-solid fa-wallet"></i>
                                <span>ESEWA</span>
                            </div>
                            <div class="payment-card">
                                <i class="fa-solid fa-wallet"></i>
                                <span>KHALTI</span>
                            </div>
                            <div class="payment-card">
                                <i class="fa-solid fa-qrcode"></i>
                                <span>QR PAY</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column (Sidebar) -->
                <aside class="review-sidebar">
                    <div class="summary-card dark-card">
                        <h3 class="summary-title">Ticket Summary</h3>
                        
                        <div class="summary-row">
                            <span class="summary-item">2x Premium Gallery Seats</span>
                            <span class="summary-price">Rs. ${totalPrice}</span>
                        </div>
                        
                        <hr class="summary-divider">
                        
                        <div class="summary-total-row">
                            <span class="total-label">Total Amount</span>
                            <span class="total-amount">Rs. ${totalPrice}</span>
                        </div>
                        
                        <button class="btn-confirm">CONFIRM & PAY <i class="fa-solid fa-arrow-right"></i></button>
                        <button class="btn-cancel">CANCEL TRANSACTION</button>
                        
                        <p class="legal-text">
                            By clicking confirm, you agree to our Terms of Service and Privacy Policy. All sales are final and non-refundable.
                        </p>
                    </div>
                </aside>
            </div>
        </div>
    </main>

    <jsp:include page="../common/Footer.jsp" />
</body>
</html>