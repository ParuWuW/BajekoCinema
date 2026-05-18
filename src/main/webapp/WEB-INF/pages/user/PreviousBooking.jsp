<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Previous Booking</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Previousbooking.css">
</head>
<body>
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
							<th>Total (Rs.)</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="booking" items="${previousBookings}">
							<tr>
								<td>#<c:out value="${booking.bookingId}" /></td>
								<td><c:out value="${booking.movieName}" /></td>
								<td><c:out value="${booking.totalAmount}" /></td>
								<td><c:out value="${booking.status}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>

		</c:choose>

	</div>
</body>
</html>