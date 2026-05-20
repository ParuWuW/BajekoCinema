<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - Bookings</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Tables.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ResponsiveAdmin.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="app-container">

        <jsp:include page="../common/SidebarAdmin.jsp" />

        <div class="main-container">
            <main class="page-content">

                <div class="page-header">
                    <div>
                        <h4>System Settings</h4>
                        <h1>Bookings</h1>
                    </div>
                </div>

                <div class="dashboard-content" style="margin-top:24px; display:flex; flex-direction:column; flex-grow:1; overflow:hidden;">
                    <div class="table-scroll-wrap">
                  	  <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>User ID</th>
                                    <th>User Name</th>
                                    <th>Movie</th>
                                    <th>Show ID</th>
                                    <th>Show Date &amp; Time</th>
                                    <th>Hall</th>
                                    <th>Total Amount</th>
                                    <th>Booked At</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty bookingList}">
                                        <c:forEach var="b" items="${bookingList}">

                                            <c:set var="statusClass" value="badge-pending" />
                                            <c:if test="${b.bookingStatus == 'CONFIRMED'}">
                                                <c:set var="statusClass" value="badge-confirmed" />
                                            </c:if>
                                            <c:if test="${b.bookingStatus == 'CANCELLED'}">
                                                <c:set var="statusClass" value="badge-cancelled" />
                                            </c:if>

                                            <tr>
                                                <td>#${b.bookingId}</td>
                                                <td>${b.userId}</td>
                                                <td><c:out value="${not empty b.userFullName ? b.userFullName : 'N/A'}" /></td>
                                                <td><c:out value="${not empty b.movieName ? b.movieName : 'N/A'}" /></td>
                                                <td>#${b.showId}</td>
                                                <td><c:out value="${not empty b.showTiming ? b.showTiming : 'N/A'}" /></td>
                                                <td><c:out value="${not empty b.hallName ? b.hallName : 'N/A'}" /></td>
                                                <td>NRs. ${b.totalAmount}</td>
                                                <td>${b.bookingTime}</td>
                                                <td>
                                                    <span class="badge ${statusClass}">${b.bookingStatus}</span>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="10"
                                                style="text-align:center; padding:30px; color:var(--text-muted);">
                                                No bookings found.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                	</div>
                </div>

            </main>

            <jsp:include page="../common/FooterAdmin.jsp" />
        </div>
    </div>
</body>
</html>