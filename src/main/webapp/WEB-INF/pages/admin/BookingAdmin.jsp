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
                        <h1>Booking</h1>
                    </div>
                    <div class="header-buttons">
                        <button class="btn btn-primary" onclick="openModal('bookShowModal')">
                            Book Show
                        </button>
                    </div>
                </div>

                <!-- Bookings Table -->
                <div class="dashboard-content" style="margin-top: 24px; display: flex; flex-direction: column; flex-grow: 1; overflow: hidden;">
                    <div class="section-title" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
                        <h2 style="font-size: 20px; font-weight: 600;">Recent Bookings</h2>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Booking Date</th>
                                    <th>Movie</th>
                                    <th>Hall</th>
                                    <th>Show Time</th>
                                    <th>Booked By</th>
                                    <th>Total Amount</th>
                                    <th>Status</th>
                                    <th>Actions</th>
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
                                                <td>#${b.bookingID}</td>
                                                <td>${b.bookingDate}</td>
                                                <td><c:out value="${not empty b.movieName ? b.movieName : 'N/A'}" /></td>
                                                <td><c:out value="${not empty b.hallName ? b.hallName : 'N/A'}" /></td>
                                                <td><c:out value="${not empty b.showTiming ? b.showTiming : 'N/A'}" /></td>
                                                <td><c:out value="${not empty b.username ? b.username : 'N/A'}" /></td>
                                                <td>NRs. ${b.totalAmount}</td>
                                                <td>
                                                    <span class="badge ${statusClass}">${b.bookingStatus}</span>
                                                </td>
                                                <td>
                                                    <div class="actions">
                                                        <!-- Update Status Form -->
                                                        <form method="post" action="${pageContext.request.contextPath}/Abooking" style="display:inline;">
                                                            <input type="hidden" name="action" value="updateStatus">
                                                            <input type="hidden" name="bookingID" value="${b.bookingID}">
                                                            <select name="bookingStatus" class="form-control" style="padding: 4px 8px; font-size: 13px;">
                                                                <option value="PENDING" ${b.bookingStatus == 'PENDING' ? 'selected' : ''}>Pending</option>
                                                                <option value="CONFIRMED" ${b.bookingStatus == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
                                                                <option value="CANCELLED" ${b.bookingStatus == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                                                            </select>
                                                            <button type="submit" class="btn btn-secondary" style="padding: 4px 8px; font-size: 13px;">
                                                                Update
                                                            </button>
                                                        </form>
                                                        <!-- Delete Form -->
                                                        <form method="post" action="${pageContext.request.contextPath}/Abooking" style="display:inline;">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="bookingID" value="${b.bookingID}">
                                                            <button type="submit" title="Delete" onclick="return confirm('Delete Booking #${b.bookingID}?')">
                                                                Delete
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="9" style="text-align:center; padding:30px; color: var(--text-muted);">
                                                No bookings found.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Book Show Modal -->
                <div id="bookShowModal" class="modal-overlay">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>Book Show</h2>
                            <button class="close-modal" onclick="closeModal('bookShowModal')">X</button>
                        </div>
                        <div class="modal-body">

                            <!-- STEP 1: Select Movie -->
                            <form method="get" action="${pageContext.request.contextPath}/Abooking">
                                <div class="form-group">
                                    <label>Step 1 — Select Movie</label>
                                    <select class="form-control" name="selectedMovieID" required>
                                        <option value="">Select a Movie</option>
                                        <c:forEach var="movie" items="${movieList}">
                                            <option value="${movie.movieID}"
                                                ${selectedMovieID == movie.movieID ? 'selected' : ''}>
                                                ${movie.movieName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-secondary">Load Shows</button>
                            </form>

                            <!-- STEP 2: Only shown after a movie is selected -->
                            <c:if test="${not empty filteredShows}">
                                <form method="post" action="${pageContext.request.contextPath}/Abooking"
                                      style="margin-top: 24px;">
                                    <input type="hidden" name="action" value="book">
                                    <div class="form-group">
                                        <label>Step 2 — Select Show Time &amp; Hall</label>
                                        <select class="form-control" name="showID" required>
                                            <option value="">Select a Show</option>
                                            <c:forEach var="show" items="${filteredShows}">
                                                <option value="${show.showID}">
                                                    ${show.showTiming} — ${show.hallName} — ${show.showDuration}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn-save">Confirm Booking</button>
                                </form>
                            </c:if>

                        </div>
                    </div>
                </div>

            </main>

            <jsp:include page="../common/FooterAdmin.jsp" />

        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target.classList.contains('modal-overlay')) {
                event.target.style.display = 'none';
            }
        }

        // ADDED - auto open modal if a movie was selected so step 2 is visible
        window.onload = function() {
            var selectedMovie = "${selectedMovieID}";
            if (selectedMovie !== "" && selectedMovie !== "0") {
                document.getElementById('bookShowModal').style.display = 'flex';
            }
        }
    </script>
</body>
</html>