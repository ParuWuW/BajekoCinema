<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAJEKO Cinema | Book — <c:out value="${movie.title}"/></title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Booking.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
.seat-grid { display: flex; flex-direction: column; gap: 10px; align-items: center; margin-bottom: 30px; }
.seat-row { display: flex; align-items: center; gap: 8px; }
.row-label { width: 24px; text-align: center; color: #aaa; font-weight: 600; font-size: 0.9rem; }
.seat-btn {
    width: 34px; height: 34px; border-radius: 6px;
    background: #333; border: none; cursor: pointer;
    color: transparent; font-size: 0.7rem; font-weight: 700;
    transition: background 0.15s, color 0.15s;
}
.seat-btn:hover:not(.sold-out) { background: #555; }
.seat-btn.sold-out { background: #d12a2a; cursor: not-allowed; }
.seat-btn.selected { background: #e5b022; color: #0a0a0a; }
.movie-meta-line { color: #aaa; font-size: 0.9rem; margin-top: 0.5rem; }
.movie-meta-line span { color: var(--accent-gold); font-weight: 600; }
</style>
</head>
<body class="booking-page-body">
    <c:set var="activePage" value="home" scope="request" />
    <jsp:include page="../common/Header.jsp" />

    <main class="booking-page">

        <%-- ============ HERO ============ --%>
        <section class="hero">
            <div class="hero-overlay"></div>
            <div class="hero-bg" style="background-image: url('${pageContext.request.contextPath}/${movie.posterUrl}');"></div>

            <div class="hero-content">
                <span class="hero-label">NOW SHOWING AT BAJEKO</span>
                <h1 class="hero-title"><c:out value="${movie.title}"/></h1>
                <p class="hero-desc"><c:out value="${movie.description}"/></p>
                <p class="movie-meta-line">
                    Genre: <span><c:out value="${movie.genre}"/></span>
                    &nbsp;&middot;&nbsp;
                    Duration: <span><c:out value="${movie.durationMin}"/> min</span>
                </p>
            </div>
        </section>

        <%-- ============ FILTERS (cascading GETs) ============ --%>
        <section class="booking-filters">

            <%-- Theatre --%>
            <div class="filter-row">
                <h3 class="filter-label">Theatre</h3>
                <div class="filter-options">
                    <c:choose>
                        <c:when test="${empty theatres}">
                            <span style="color:#888;">No theatres are currently showing this movie.</span>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="t" items="${theatres}">
                                <a href="${pageContext.request.contextPath}/booking?movieId=${movie.movieId}&theatreId=${t.theatreID}"
                                   class="pill-btn ${selectedTheatreId == t.theatreID ? 'active' : ''}">
                                    <c:out value="${t.theatreName}"/>
                                </a>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <%-- Date (only after theatre picked) --%>
            <c:if test="${not empty selectedTheatreId}">
                <div class="filter-row">
                    <h3 class="filter-label">Date</h3>
                    <div class="filter-options date-scroll">
                        <c:choose>
                            <c:when test="${empty dates}">
                                <span style="color:#888;">No upcoming dates at this theatre.</span>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="d" items="${dates}">
                                    <c:set var="dStr"><fmt:formatDate value="${d}" pattern="yyyy-MM-dd"/></c:set>
                                    <c:set var="dSelStr"><fmt:formatDate value="${selectedDate}" pattern="yyyy-MM-dd"/></c:set>
                                    <a href="${pageContext.request.contextPath}/booking?movieId=${movie.movieId}&theatreId=${selectedTheatreId}&date=${dStr}"
                                       class="pill-btn ${dStr == dSelStr ? 'active' : ''}">
                                        <fmt:formatDate value="${d}" pattern="EEE, dd MMM"/>
                                    </a>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:if>

            <%-- Show time (only after date picked) --%>
            <c:if test="${not empty selectedDate}">
                <div class="filter-row">
                    <h3 class="filter-label">Timing</h3>
                    <div class="filter-options">
                        <c:choose>
                            <c:when test="${empty shows}">
                                <span style="color:#888;">No shows on this date.</span>
                            </c:when>
                            <c:otherwise>
                                <c:set var="dSelStr"><fmt:formatDate value="${selectedDate}" pattern="yyyy-MM-dd"/></c:set>
                                <c:forEach var="s" items="${shows}">
                                    <a href="${pageContext.request.contextPath}/booking?movieId=${movie.movieId}&theatreId=${selectedTheatreId}&date=${dSelStr}&showId=${s.showID}"
                                       class="pill-btn ${selectedShow.showID == s.showID ? 'active' : ''}">
                                        <fmt:formatDate value="${s.startTime}" pattern="h:mm a"/>
                                        &nbsp;—&nbsp;<c:out value="${s.hallName}"/>
                                    </a>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:if>
        </section>

        <%-- ============ SEATS (only after show picked) ============ --%>
        <c:if test="${not empty seats}">
            <section class="seat-selection">

                <div class="screen-area">
                    <h3 class="screen-text">Screen</h3>
                    <div class="screen-line"></div>
                </div>

                <form id="bookForm" method="post" action="${pageContext.request.contextPath}/booking">
                    <%-- carry context forward --%>
                    <input type="hidden" name="movieId"   value="${movie.movieId}">
                    <input type="hidden" name="theatreId" value="${selectedTheatreId}">
                    <c:set var="dSelStr"><fmt:formatDate value="${selectedDate}" pattern="yyyy-MM-dd"/></c:set>
                    <input type="hidden" name="date"      value="${dSelStr}">
                    <input type="hidden" name="showId"    value="${selectedShow.showID}">

                    <%-- group seats by row using a JSTL trick: track previous row label --%>
                    <div class="seat-grid">
                        <c:set var="prevRow" value=""/>
                        <c:forEach var="seat" items="${seats}" varStatus="loop">

                            <%-- open a new row whenever row_label changes --%>
                            <c:if test="${seat.rowLabel != prevRow}">
                                <c:if test="${not loop.first}">
                                    </div>  <%-- close previous row --%>
                                </c:if>
                                <div class="seat-row">
                                    <span class="row-label">${seat.rowLabel}</span>
                            </c:if>

                            <c:choose>
                                <c:when test="${seat.booked}">
                                    <button type="button" class="seat-btn sold-out" disabled
                                            title="${seat.rowLabel}${seat.seatNumber} — Sold out">
                                        ${seat.rowLabel}${seat.seatNumber}
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button type="button"
                                            class="seat-btn"
                                            data-seat-id="${seat.seatID}"
                                            data-seat-label="${seat.rowLabel}${seat.seatNumber}"
                                            onclick="toggleSeat(this)">
                                        ${seat.rowLabel}${seat.seatNumber}
                                    </button>
                                </c:otherwise>
                            </c:choose>

                            <c:set var="prevRow" value="${seat.rowLabel}"/>

                            <%-- close last row --%>
                            <c:if test="${loop.last}">
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <%-- legend --%>
                    <div class="seat-legend">
                        <div class="legend-item"><div class="seat available" style="background:#333;width:20px;height:20px;border-radius:4px;"></div><span>Available</span></div>
                        <div class="legend-item"><div class="seat sold-out" style="background:#d12a2a;width:20px;height:20px;border-radius:4px;"></div><span>Sold out</span></div>
                        <div class="legend-item"><div class="seat selected" style="background:#e5b022;width:20px;height:20px;border-radius:4px;"></div><span>Selected</span></div>
                    </div>

                    <%-- summary line --%>
                    <div style="text-align:center; margin: 20px 0; color:#fff;">
                        <p>Selected: <span id="selectedLabels" style="color:var(--accent-gold);">None</span></p>
                        <p>Total: NPR <span id="totalAmount">0</span></p>
                    </div>

                    <%-- hidden inputs for seat ids get injected by JS --%>
                    <div id="seatInputs"></div>

                    <div class="action-section">
                        <button type="submit" class="btn-buy-now" id="buyNowBtn" disabled>Buy Now</button>
                    </div>
                </form>
            </section>
        </c:if>

    </main>

    <jsp:include page="../common/Footer.jsp" />

    <script>
        var SEAT_PRICE = ${not empty seatPrice ? seatPrice : 0};
        var selectedSeats = {}; // seatId -> label

        function toggleSeat(btn) {
            var id = btn.getAttribute('data-seat-id');
            var label = btn.getAttribute('data-seat-label');

            if (selectedSeats[id]) {
                delete selectedSeats[id];
                btn.classList.remove('selected');
            } else {
                selectedSeats[id] = label;
                btn.classList.add('selected');
            }
            refresh();
        }

        function refresh() {
            var ids = Object.keys(selectedSeats);
            var labels = ids.map(function (id) { return selectedSeats[id]; });

            document.getElementById('selectedLabels').textContent = labels.length ? labels.join(', ') : 'None';
            document.getElementById('totalAmount').textContent = (labels.length * SEAT_PRICE).toFixed(0);
            document.getElementById('buyNowBtn').disabled = labels.length === 0;

            var box = document.getElementById('seatInputs');
            box.innerHTML = '';
            ids.forEach(function (id) {
                var inp = document.createElement('input');
                inp.type = 'hidden';
                inp.name = 'seatIds';
                inp.value = id;
                box.appendChild(inp);
            });
        }
    </script>
</body>
</html>