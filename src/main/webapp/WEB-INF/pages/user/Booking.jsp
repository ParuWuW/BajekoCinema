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
</head>
<body class="booking-page-body">
    <jsp:include page="../common/Header.jsp" />

    <main class="booking-page">
    
        <!-- Hero Banner Section -->
		<section class="hero">
	        <div class="hero-overlay"></div>

	        <div class="hero-bg"
	            style="background-image: url(
	            	<c:choose>
                        <c:when test="${not empty movie.posterUrl}">${movie.posterUrl}</c:when>
                        <c:otherwise>https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=80&w=2070&auto=format&fit=crop</c:otherwise>
                    </c:choose>   		
	            	');">
	        </div>
	
	        <div class="hero-content">
                <div class="hero-badges">
                    <span class="hero-label">${movie.genre}</span>
                    <c:if test="${movie.status == 'now_showing'}">
                        <span class="badge badge-now-showing">Now Showing</span>
                    </c:if>
                    <c:if test="${movie.status == 'upcoming'}">
                        <span class="badge badge-upcoming">Upcoming</span>
                    </c:if>
                </div>
                
                <h1 class="hero-title">${movie.title}</h1>  
                
                <div class="hero-meta">
                    <c:if test="${not empty movie.durationMin}">
                        <span class="meta-item">
                            <i class="fa-regular fa-clock"></i>
                            ${movie.durationMin} min
                        </span>
                    </c:if>
                    <c:if test="${not empty movie.imdbScore}">
                        <span class="meta-item">
                            <i class="fa-solid fa-star" style="color:#e5b022;"></i>
                            ${movie.imdbScore} / 10
                        </span>
                    </c:if>
                    <c:if test="${not empty movie.releaseDate}">
                        <span class="meta-item">
                            <i class="fa-regular fa-calendar"></i>
                            <fmt:formatDate value="${movie.releaseDate}" pattern="dd MMM yyyy"/>
                        </span>
                    </c:if>
                </div>                              
                <c:if test="${not empty movie.description}">
                    <p class="hero-desc">${movie.description}</p>
                </c:if>
                	
                <div class="hero-buttons">
                    <c:choose>
                        <c:when test="${not empty movie.trailerUrl}">
                            <a href="${movie.trailerUrl}" target="_blank" rel="noopener" class="btn btn-primary">
                                <i class="fa-solid fa-play"></i> Watch Trailer
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="btn btn-primary btn-disabled" aria-disabled="true">
                                <i class="fa-solid fa-play"></i> Trailer Unavailable
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
	        </div>
	    </section>

        <!-- Booking Filters Section -->
        <section class="booking-filters">
            <!-- Cinema Filter -->
            <div class="filter-row">
                <h3 class="filter-label">Cinema</h3>
                <div class="filter-options">
                    <c:choose>
                        <c:when test="${not empty halls}">
                            <c:forEach var="hall" items="${halls}">
                                <c:url var="hallUrl" value="${pageContext.request.contextPath}/booking">
                                    <c:param name="movieId" value="${movie.movieId}"/>
                                    <c:param name="hallId"  value="${hall.hallID}"/>
                                </c:url>
                                <a href="${hallUrl}"
                                   class="pill-btn ${hall.hallID == selectedHall.hallID ? 'active' : ''}">
                                    ${hall.hallName}
                                </a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <span class="no-data-hint">No cinemas available for this movie.</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Date Filter -->
            <div class="filter-row">
                <h3 class="filter-label">Show</h3>
                <div class="filter-options date-scroll">
                    <c:choose>
                        <c:when test="${not empty shows}">
                            <c:forEach var="show" items="${shows}">
                                <c:if test="${show.status == 'scheduled'}">
                                    <c:url var="showUrl" value="${pageContext.request.contextPath}/booking">
                                        <c:param name="movieId" value="${movie.movieId}"/>
                                        <c:param name="hallId"  value="${selectedHall.hallID}"/>
                                        <c:param name="showId"  value="${show.showId}"/>
                                    </c:url>
                                    <a href="${showUrl}"
                                       class="pill-btn ${show.showId == selectedShow.showId ? 'active' : ''}">
                                        <c:choose>
                                            <c:when test="${not empty show.showDate}">
                                                <fmt:formatDate value="${show.showDate}" pattern="EEE, dd MMM"/>
                                                &nbsp;&middot;&nbsp;
                                                <fmt:formatDate value="${show.startTime}" pattern="h:mm a"/>
                                            </c:when>
                                            <c:otherwise>
                                                ${show.showTiming}
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <span class="no-data-hint">No shows scheduled at this cinema.</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Selecetd show info chipr -->
            <c:if test="${not empty selectedShow}">
                <div class="filter-row">
                    <h3 class="filter-label">Hall</h3>
                    <div class="filter-options">
                        <span class="info-chip">
                            <i class="fa-solid fa-building"></i>
                            ${selectedShow.hallName}
                            &nbsp;&middot;&nbsp;
                            Price per seat:
                            <strong>NPR <fmt:formatNumber value="${seatPrice}" type="number" minFractionDigits="0" maxFractionDigits="0"/></strong>
                        </span>
                    </div>
                </div>
            </c:if>
        </section>

        <!-- 3. Seat Selection Grid -->
        <c:choose>
            <c:when test="${not empty selectedShow && not empty seats}">

                <section class="seat-selection">

                    <div class="screen-area">
                        <h3 class="screen-text">Screen</h3>
                        <div class="screen-line"></div>
                    </div>

                    <form id="bookingForm"
                          action="${pageContext.request.contextPath}/booking"
                          method="post">

                        <input type="hidden" name="showId"  value="${selectedShow.showId}"/>
                        <input type="hidden" name="userId"  value="${sessionScope.loggedUser.userID}"/>
                        <input type="hidden" name="movieId" value="${movie.movieId}"/>
                        <input type="hidden" name="hallId"  value="${selectedHall.hallID}"/>

                        <div id="selectedSeatInputs"></div>
                        
                        <!-- Seat grid — grouped by row if seatsByRow is populated -->
						<div class="seating-arrangement">
						    <c:choose>
						        <c:when test="${not empty seatsByRow}">
						            <div class="seating-container">
						                <c:forEach var="row" items="${seatsByRow}">
						                    <div class="seat-row">
						                        <div class="row-letter">${row.key}</div>
						                        <div class="seats-in-row">
						                            <c:forEach var="seat" items="${row.value}">
						                                <c:set var="sc" value="seat ${seat.seatStatus == 'booked' ? 'sold-out' : 'available'}"/>
						                                <div class="${sc}"
						                                     data-seat-id="${seat.seatId}"
						                                     data-row="${seat.rowLabel}"
						                                     data-number="${seat.seatNumber}"
						                                     data-status="${seat.seatStatus}"
						                                     title="Row ${seat.rowLabel}, Seat ${seat.seatNumber}">
						                                </div>
						                            </c:forEach>
						                        </div>
						                    </div>
						                </c:forEach>
						            </div>
						        </c:when>
						        <c:otherwise>
						            <div class="no-seats-message">No seats available for this show.</div>
						        </c:otherwise>
						    </c:choose>
						</div>
                        
            			<!-- Legend Section -->
                        <div class="seat-legend">
                            <div class="legend-item">
                                <div class="seat available"></div>
                                <span>Available</span>
                            </div>
                            <div class="legend-item">
                                <div class="seat sold-out"></div>
                                <span>Sold Out</span>
                            </div>
                            <div class="legend-item">
                                <div class="seat selected"></div>
                                <span>Selected</span>
                            </div>
                        </div>

            
            			<!-- 4. Action Button -->
                        <div class="action-section">
                            <div class="booking-summary" id="bookingSummary">
                                <div class="summary-row">
                                    <span>Selected seats:</span>
                                    <span id="summarySeats">None</span>
                                </div>
                                <div class="summary-row">
                                    <span>Seat count:</span>
                                    <span id="summaryCount">0</span>
                                </div>
                                <div class="summary-row summary-total">
                                    <span>Total:</span>
                                    <span id="summaryTotal">NPR 0</span>
                                </div>
                            </div>

                            <p class="booking-user-note">
                                Booking as:
                                <strong>${sessionScope.loggedUser.fullName}</strong>
                                (${sessionScope.loggedUser.email})
                            </p>

                            <button type="submit" class="btn-buy-now" id="btnBuyNow" disabled>
                                Confirm Booking
                            </button>
                            <p class="booking-hint" id="buyHint">Select at least one seat to continue.</p>
                        </div>
                  </form>
        </section>
        </c:when>
        
            <c:when test="${empty selectedShow}">
                <div class="empty-state">
                    <i class="fa-solid fa-ticket-simple fa-2x"></i>
                    <p>Please select a cinema and show time above to view available seats.</p>
                </div>
            </c:when>

            <c:otherwise>
                <div class="empty-state">
                    <i class="fa-solid fa-couch fa-2x"></i>
                    <p>No seat data found for this hall. Please contact the cinema.</p>
                </div>
            </c:otherwise>
        </c:choose>        
    </main>

    <jsp:include page="../common/Footer.jsp" />
    
    <script>
    (function () {
        const SEAT_PRICE    = parseFloat("${not empty seatPrice ? seatPrice : 0}") || 0;
        const form          = document.getElementById("bookingForm");
        const inputsWrapper = document.getElementById("selectedSeatInputs");
        const btnBuy        = document.getElementById("btnBuyNow");
        const hintEl        = document.getElementById("buyHint");
        const summarySeats  = document.getElementById("summarySeats");
        const summaryCount  = document.getElementById("summaryCount");
        const summaryTotal  = document.getElementById("summaryTotal");

        if (!form) return;

        const selectedIds = new Set();

        document.querySelectorAll(".seat.available, .seat.selected").forEach(function (seatEl) {
            seatEl.addEventListener("click", function () {
                if (seatEl.dataset.status === "booked") return;    
                
                const id = seatEl.dataset.seatId;
                if (selectedIds.has(id)) {
                    selectedIds.delete(id);
                    seatEl.classList.remove("selected");
                    seatEl.classList.add("available");
                } else {
                    selectedIds.add(id);
                    seatEl.classList.remove("available");
                    seatEl.classList.add("selected");
                }

                syncHiddenInputs();
                updateSummary();
            });
        });                
 
        
        function syncHiddenInputs() {
            inputsWrapper.innerHTML = "";
            selectedIds.forEach(function (id) {
                const inp = document.createElement("input");
                inp.type  = "hidden";
                inp.name  = "seatIds";
                inp.value = id;
                inputsWrapper.appendChild(inp);
            });
        }

        function updateSummary() {
            const count  = selectedIds.size;
            const total  = count * SEAT_PRICE;
            const labels = [];

            selectedIds.forEach(function (id) {
                const el = document.querySelector(".seat[data-seat-id='" + id + "']");
                if (el) labels.push(el.dataset.row + el.dataset.number);
            });

            summarySeats.textContent = labels.length > 0 ? labels.sort().join(", ") : "None";
            summaryCount.textContent = count;
            summaryTotal.textContent = "NPR " + total.toLocaleString();

            if (count > 0) {
                btnBuy.removeAttribute("disabled");
                hintEl.style.display = "none";
            } else {
                btnBuy.setAttribute("disabled", "disabled");
                hintEl.style.display = "";
            }
        }
        
        document.querySelectorAll(".flash-message").forEach(function (el) {
            setTimeout(function () {
                el.style.opacity    = "0";
                el.style.transition = "opacity 0.4s";
                setTimeout(function () { el.remove(); }, 400);
            }, 5000);
        });

    }());
    
    </script>        
</body>
</html>