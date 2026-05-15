<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - Shows</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Tables.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="app-container">

        <jsp:include page="SidebarAdmin.jsp" />

        <div class="main-container">

            <main class="page-content">

                <div class="page-header">
                    <div>
                        <h4>System Settings</h4>
                        <h1>Shows</h1>
                    </div>
                    <div class="header-buttons">
                        <button class="btn btn-primary" onclick="openModal('scheduleShowModal')">
                            Schedule Show
                        </button>
                    </div>
                </div>

                <div class="dashboard-content" style="margin-top: 24px; display: flex; flex-direction: column; flex-grow: 1; overflow: hidden;">
                    <div class="section-title" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
                        <h2 style="font-size: 20px; font-weight: 600;">Recent Shows</h2>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Movie</th>
                                    <th>Hall</th>
                                    <th>Show Time</th>
                                    <th>Duration</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty shows}">
                                        <c:forEach var="show" items="${shows}" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td>${show.movieName}</td>
                                                <td>${show.hallName}</td>
                                                <td>${show.showTiming}</td>
                                                <td>${show.showDuration}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="5" style="text-align: center; padding: 30px; color: var(--text-muted);">
                                                No shows scheduled yet. Click <strong>Schedule Show</strong> to get started.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Schedule Show Modal -->
                <div id="scheduleShowModal" class="modal-overlay">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>Schedule Show</h2>
                            <button class="close-modal" onclick="closeModal('scheduleShowModal')">X</button>
                        </div>
                        <form class="modal-body" method="post" action="${pageContext.request.contextPath}/shows">
                            <input type="hidden" name="action" value="schedule">
                            <div class="modal-form-row">
                                <div class="form-group">
                                    <label>Movie</label>
                                    <select class="form-control" name="movieID" required>
                                        <option value="">Select Movie</option>
                                        <c:forEach var="movie" items="${movieList}">
                                            <option value="${movie.movieID}">${movie.movieName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Hall</label>
                                    <select class="form-control" name="hallID" required>
                                        <option value="">Select Hall</option>
                                        <c:forEach var="hall" items="${hallList}">
                                            <option value="${hall.hallID}">${hall.hallName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-form-row">
                                <div class="form-group">
                                    <label>Show Time</label>
                                    <input type="time" class="form-control" name="showTiming" required>
                                </div>
                                <div class="form-group">
                                    <label>Duration</label>
                                    <input type="text" class="form-control" name="showDuration" placeholder="e.g. 2h 15m" required>
                                </div>
                            </div>
                            <button type="submit" class="btn-save">Schedule</button>
                        </form>
                    </div>
                </div>

            </main>

            <jsp:include page="FooterAdmin.jsp" />

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
    </script>
</body>
</html>