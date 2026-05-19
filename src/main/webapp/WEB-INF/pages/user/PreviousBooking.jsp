<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Previous Booking</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/Front-base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/PreviousBooking2.css">
<style>
.booking-wrapper {
    width: 90%;
    margin: 120px auto 0 auto;
    padding: 2rem;
    text-align: center;

}

.page-title {
	color: #e8b92d;
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 2rem;
}

.no-bookings {
	color: #ffffff;
	font-size: 14px;
	padding: 3rem 2rem;
	background: #131415;
	border: 1px solid rgba(255, 255, 255, 0.08);
	border-radius: 20px;
	display: inline-block;
	}

.booking-table {
    width: 100%;
    border-collapse: collapse;
}
.booking-table thead th {
    padding: 0.75rem 1rem;
    font-size: 13px;
    font-weight: 700;
    color: #e8b92d;
    text-align: left;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}
.booking-table tbody tr {
    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
}
.booking-table tbody tr:last-child { border-bottom: none; }
.booking-table tbody tr:hover { background: #1a1a1c; }
.booking-table tbody td {
    padding: 0.85rem 1rem;
    font-size: 14px;
    color: #c0c0c8;
    text-align: left;
}
td.status-confirmed { color: #00e5e5; }
td.status-cancelled { color: #f87171; }
td.status-pending   { color: #e8b92d; }
</style>


</head>
<body>

	<jsp:include page="/WEB-INF/pages/common/Header.jsp" />
	<div class="booking-wrapper">

		<h2 class="page-title">Booking History</h2>

		<c:choose>

			<c:when test="${empty previousBookings}">
				<p class="no-bookings">You have no bookings yet.</p>
			</c:when>

			<c:otherwise>
				<table class="booking-table">
					<thead>
						<tr>
							<th>Booking ID</th>
							<th>Movie Name</th>
							<th>Show Date</th>
							<th>Total (Rs.)</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="booking" items="${previousBookings}">
							<tr>
								<td><c:out value="${booking.bookingID}" /></td>
								<td><c:out value="${booking.movieName}" /></td>
								<td><c:out value="${booking.showTiming}" /></td>
								<td><c:out value="${booking.totalAmount}" /></td>
								<td class="status-${booking.bookingStatus}"><c:out
										value="${booking.bookingStatus}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>

		</c:choose>

	</div>
    <jsp:include page="../common/Footer.jsp" />	
</body>
</html>