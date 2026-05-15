<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>BAJEKO Cinema | Project Hail Mary</title>

    <!-- Global/Shared Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css">
    <!-- Booking Specific Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Booking.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="booking-page-body">
    <jsp:include page="Header.jsp" />

    <main class="booking-page">
        <!-- 1. Hero Banner Section -->
		<section class="hero">
	        <div class="hero-overlay"></div>
	        <!-- Hero Background Placeholder-->
	        <div class="hero-bg"
	            style="background-image: url('https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=80&w=2070&auto=format&fit=crop');">
	        </div>
	
	        <div class="hero-content">
	            <span class="hero-label">STREAMING EXCLUSIVELY AT BAJEKO</span>
	            <h1 class="hero-title">PROJECT HAIL<br>MARY</h1>
	            <p class="hero-desc">A lone astronaut must save the earth from disaster in this edge-of-your-seat
	                thriller based on the best-selling novel. Experience the journey exclusively in our IMAX theaters.
	            </p>
	
	            <div class="hero-buttons">
	                <a href="#" class="btn btn-primary"><i class="fa-solid fa-play"></i> Watch Trailer</a>
	            </div>
	        </div>
	    </section>

        <!-- 2. Booking Filters Section -->
        <section class="booking-filters">
            <!-- Cinema Filter -->
            <div class="filter-row">
                <h3 class="filter-label">Cinema</h3>
                <div class="filter-options">
                    <button class="pill-btn active">Chhaya Center</button>
                    <button class="pill-btn">Labim Mall</button>
                </div>
            </div>

            <!-- Date Filter -->
            <div class="filter-row">
                <h3 class="filter-label">Date</h3>
                <div class="filter-options date-scroll">
                    <%-- Placeholder logic for dates --%>
                    <%
                        String[] dates = {"Today, 24 May", "Sat, 25 May", "Sun, 26 May", "Mon, 27 May", "Tue, 28 May", "Wed, 29 May"};
                        request.setAttribute("dates", dates);
                    %>
                    <c:forEach var="date" items="${dates}" varStatus="status">
                        <button class="pill-btn ${status.first ? 'active' : ''}">${date}</button>
                    </c:forEach>
                </div>
            </div>

            <!-- Timing Filter -->
            <div class="filter-row">
                <h3 class="filter-label">Timing</h3>
                <div class="filter-options">
                    <%-- Placeholder logic for timings --%>
                    <%
                        String[] timings = {"6:00 am", "8:00 am", "11:00 am", "2:00 pm", "6:30 pm", "8:00 pm"};
                        request.setAttribute("timings", timings);
                    %>
                    <c:forEach var="time" items="${timings}" varStatus="status">
                        <button class="pill-btn ${status.first ? 'active' : ''}">${time}</button>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- 3. Seat Selection Grid -->
        <section class="seat-selection">
            <div class="screen-area">
                <h3 class="screen-text">Screen</h3>
                <div class="screen-line"></div>
            </div>

            <div class="seating-arrangement">
                <!-- Left Block (3x4) -->
                <div class="seat-block left-block">
                    <%-- Row Loop --%>
                    <c:forEach begin="1" end="4" var="row">
                        <%-- Col Loop --%>
                        <c:forEach begin="1" end="3" var="col">
                            <div class="seat available"></div>
                        </c:forEach>
                    </c:forEach>
                </div>

                <!-- Center Block (4x4) -->
                <div class="seat-block center-block">
                    <c:forEach begin="1" end="4" var="row">
                        <c:forEach begin="1" end="4" var="col">
                            <%-- Hardcode some selected and sold-out seats for visual, normally this comes from a DB --%>
                            <c:choose>
                                <c:when test="${row == 2 && col == 1}">
                                    <div class="seat selected"></div>
                                </c:when>
                                <c:when test="${row == 2 && col == 2}">
                                    <div class="seat selected"></div>
                                </c:when>
                                <c:when test="${row == 3 && col >= 2 && col <= 4}">
                                    <div class="seat sold-out"></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="seat available"></div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:forEach>
                </div>

                <!-- Right Block (3x4) -->
                <div class="seat-block right-block">
                    <c:forEach begin="1" end="4" var="row">
                        <c:forEach begin="1" end="3" var="col">
                            <div class="seat available"></div>
                        </c:forEach>
                    </c:forEach>
                </div>
            </div>

            <!-- Legend Section -->
            <div class="seat-legend">
                <div class="legend-item">
                    <div class="seat available"></div>
                    <span>Available</span>
                </div>
                <div class="legend-item">
                    <div class="seat sold-out"></div>
                    <span>Sold out</span>
                </div>
                <div class="legend-item">
                    <div class="seat selected"></div>
                    <span>Selected</span>
                </div>
            </div>
            
            <!-- 4. Action Button -->
            <div class="action-section">
                <button class="btn-buy-now">Buy Now</button>
            </div>
        </section>
    </main>

    <jsp:include page="Footer.jsp" />
</body>
</html>