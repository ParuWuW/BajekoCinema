<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>BAJEKO Cinema | Review Booking</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Review.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="review-page-body">
    <jsp:include page="../common/Header.jsp" />

    <main class="review-page">
        <div class="review-container">
            <h1 class="page-title">Review Booking</h1>
            
            <div class="review-layout">
                <!-- Left Column (Main Content) -->
                <div class="review-main">
                    <!-- Booking Card -->
                    <div class="booking-card dark-card">
                        <img src="${pageContext.request.contextPath}/${posterUrl}"
                             alt="${movieTitle}" class="movie-poster">
                        <div class="booking-details">
                            <span class="now-showing">BOOKING #${bookingId}</span>
                            <h2 class="movie-title"><c:out value="${movieTitle}"/></h2>

                            <div class="details-grid">
                                <div>
                                    <span class="detail-label">DATE &amp; TIME</span>
                                    <span class="detail-value">
                                        <fmt:formatDate value="${showDate}" pattern="MMM dd, yyyy"/>
                                        &nbsp;&middot;&nbsp;
                                        <fmt:formatDate value="${startTime}" pattern="h:mm a"/>
                                    </span>
                                </div>
                                <div>
                                    <span class="detail-label">THEATRE</span>
                                    <span class="detail-value"><c:out value="${theatreName}"/></span>
                                </div>
                                <div>
                                    <span class="detail-label">HALL</span>
                                    <span class="detail-value">
                                        <c:out value="${hallName}"/> (ID: ${hallId})
                                    </span>
                                </div>
                                
                                <div>
                                    <span class="detail-label">BOOKED BY</span>
                                    <span class="detail-value">
                                        <c:out value="${userName}"/> (User #${userId})
                                    </span>
                                </div>
                            </div>

                            <div class="seats-section">
                                <span class="detail-label">SELECTED SEATS</span>
                                <div class="seat-tags">
                                    <c:forEach var="s" items="${seats}">
                                        <div class="seat-chip">
                                            <i class="fa-solid fa-chair"></i>
                                            ${s.rowLabel}${s.seatNumber}
                                            <small style="opacity:0.6;">(#${s.seatID})</small>
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
                            <span class="summary-item">${seatCount}x Premium Seats</span>
                            <span class="summary-price">NPR ${totalAmount}</span>
                        </div>

                        <hr class="summary-divider">

                        <div class="summary-total-row">
                            <span class="total-label">Total Amount</span>
                            <span class="total-amount">NPR ${totalAmount}</span>
                        </div>

                        <div class="summary-row" style="margin-top:14px;">
                            <span class="summary-item">Status</span>
                            <span class="summary-price" style="text-transform:uppercase;color:var(--accent-gold);">
                                <c:out value="${status}"/>
                            </span>
                        </div>
                        
                        <%-- Confirm form --%>
                        <form method="post" action="${pageContext.request.contextPath}/review">
                            <input type="hidden" name="bookingId" value="${bookingId}">
                            <input type="hidden" name="action" value="confirm">
                            <button type="submit" class="btn-confirm">
                                CONFIRM &amp; PAY <i class="fa-solid fa-arrow-right"></i>
                            </button>
                        </form>

                        <%-- Cancel form --%>
                        <form method="post" action="${pageContext.request.contextPath}/review"
                              onsubmit="return confirm('Cancel this booking?');">
                            <input type="hidden" name="bookingId" value="${bookingId}">
                            <input type="hidden" name="action" value="cancel">
                            <button type="submit" class="btn-cancel">CANCEL TRANSACTION</button>
                        </form>

                        <p class="legal-text">
                            By clicking confirm, you agree to our Terms of Service and Privacy Policy.
                        </p>
                    </div>                                            
                </aside>
            </div>
        </div>
    </main>

    <jsp:include page="../common/Footer.jsp" />
</body>
</html>