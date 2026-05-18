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
	max-width: 960px;
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
							<th>Movie</th>
							<th>Show</th>
							<th>Total (Rs.)</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="booking" items="${previousBookings}">
							<tr>
								<td>#<c:out value="${booking.bookingID}" /></td>
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
</body>
</html>