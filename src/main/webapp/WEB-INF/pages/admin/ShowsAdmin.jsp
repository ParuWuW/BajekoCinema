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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Tables.css?v=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ResponsiveAdmin.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="app-container">

    <jsp:include page="../common/SidebarAdmin.jsp" />

    <div class="main-container">
        <main class="page-content">

            <%-- ====== DEFAULT TABLE VIEW ====== --%>
            <c:if test="${empty showPickForm and empty showScheduleForm and empty showEditForm}">

                <div class="page-header">
                    <div>
                        <h4>Management Overview</h4>
                        <h1>Shows</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/shows?form=pick"
                           class="btn btn-primary">Schedule Show</a>
                    </div>
                </div>

                <div class="dashboard-content" style="margin-top:24px; display:flex; flex-direction:column; flex-grow:1; overflow:hidden;">
                    <div class="section-title" style="display:flex; justify-content:space-between; align-items:center; margin-bottom:24px;">
                        <h2 style="font-size:20px; font-weight:600;">Shows List</h2>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Movie</th>
                                    <th>Theatre</th>
                                    <th>Hall</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty shows}">
                                        <c:forEach var="show" items="${shows}" varStatus="loop">
                                            <tr>
                                                <td>${loop.count}</td>
                                                <td>${show.movieTitle}</td>
                                                <td>${show.theatreName}</td>
                                                <td>${show.hallName}</td>
                                                <td>${show.showDate}</td>
                                                <td>${show.startTime}</td>
                                                <td>${show.status}</td>
                                                <td>
                                                    <div class="actions">
                                                        <%-- Edit button --%>
                                                        <a href="${pageContext.request.contextPath}/admin/shows?form=edit&showID=${show.showId}"
                                                           class="edit">Edit</a>
                                                        <%-- Delete button --%>
                                                        <form method="post"
                                                              action="${pageContext.request.contextPath}/admin/shows"
                                                              style="display:inline;">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="showID" value="${show.showId}">
                                                            <button type="submit" class="delete">Delete</button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="8" style="text-align:center;padding:30px;color:var(--text-muted);">
                                                No shows scheduled yet. Click <strong>Schedule Show</strong> to get started.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

            </c:if>

            <%-- ====== STEP 1 — PICK MOVIE AND THEATRE ====== --%>
            <c:if test="${showPickForm}">

                <div class="page-header">
                    <div>
                        <h4>Show Management</h4>
                        <h1>Schedule Show — Step 1 of 2</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/shows"
                           class="btn btn-secondary">Back to Shows</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="get"
                          action="${pageContext.request.contextPath}/admin/shows">
                        <input type="hidden" name="form" value="schedule">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Movie</label>
                                <select class="form-control" name="movieID" required>
                                    <option value="">Select Movie</option>
                                    <c:forEach var="movie" items="${movieList}">
                                        <option value="${movie.movieId}">${movie.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Theatre</label>
                                <select class="form-control" name="theatreID" required>
                                    <option value="">Select Theatre</option>
                                    <c:forEach var="theatre" items="${theatreList}">
                                        <option value="${theatre.theatreId}">${theatre.theatreName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Next</button>
                    </form>
                </div>

            </c:if>

            <%-- ====== STEP 2 — SCHEDULE DETAILS ====== --%>
            <c:if test="${showScheduleForm}">

                <div class="page-header">
                    <div>
                        <h4>Show Management</h4>
                        <h1>Schedule Show — Step 2 of 2</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/shows?form=pick"
                           class="btn btn-secondary">Back</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/shows">
                        <input type="hidden" name="action"    value="schedule">
                        <input type="hidden" name="movieID"   value="${selectedMovieId}">
                        <input type="hidden" name="theatreID" value="${selectedTheatreId}">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Movie</label>
                                <input type="text" class="form-control"
                                       value="${chosenMovie.title}" disabled>
                            </div>
                            <div class="form-group">
                                <label>Theatre</label>
                                <input type="text" class="form-control"
                                       value="${chosenTheatre.theatreName}" disabled>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Hall</label>
                                <c:choose>
                                    <c:when test="${not empty hallList}">
                                        <select class="form-control" name="hallID" required>
                                            <option value="">Select Hall</option>
                                            <c:forEach var="hall" items="${hallList}">
                                                <option value="${hall.hallId}">${hall.hallName} (${hall.totalSeats} seats)</option>
                                            </c:forEach>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        <p style="color:var(--text-muted); padding: 8px 0;">
                                            No halls found for this theatre.
                                        </p>
                                        <input type="hidden" name="hallID" value="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="status" required>
                                    <option value="">Select Status</option>
                                    <c:forEach var="s" items="${statusList}">
                                        <option value="${s}">${s}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Show Date</label>
                                <input type="date" class="form-control" name="showDate" required>
                            </div>
                            <div class="form-group">
                                <label>Start Time</label>
                                <input type="time" class="form-control" name="startTime" required>
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Schedule Show</button>
                    </form>
                </div>

            </c:if>

            <%-- ====== EDIT FORM ====== --%>
            <c:if test="${showEditForm}">

                <div class="page-header">
                    <div>
                        <h4>Show Management</h4>
                        <h1>Edit Show</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/shows"
                           class="btn btn-secondary">Back to Shows</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/shows">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="showID" value="${editShow.showId}">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Movie</label>
                                <input type="text" class="form-control"
                                       value="${editShow.movieTitle}" disabled>
                            </div>
                            <div class="form-group">
                                <label>Theatre</label>
                                <input type="text" class="form-control"
                                       value="${editShow.theatreName}" disabled>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Hall</label>
                                <select class="form-control" name="hallID" required>
                                    <option value="">Select Hall</option>
                                    <c:forEach var="hall" items="${hallList}">
                                        <option value="${hall.hallId}"
                                            ${hall.hallId == editShow.hallId ? 'selected' : ''}>
                                            ${hall.hallName} (${hall.totalSeats} seats)
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="status" required>
                                    <option value="">Select Status</option>
                                    <c:forEach var="s" items="${statusList}">
                                        <option value="${s}"
                                            ${s == editShow.status ? 'selected' : ''}>
                                            ${s}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Show Date</label>
                                <input type="date" class="form-control" name="showDate"
                                       value="${editShow.showDate}" required>
                            </div>
                            <div class="form-group">
                                <label>Start Time</label>
                                <input type="time" class="form-control" name="startTime"
                                       value="${editShow.startTime}" required>
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Save Changes</button>
                    </form>
                </div>

            </c:if>

        </main>

        <jsp:include page="../common/FooterAdmin.jsp" />
    </div>
</div>
</body>
</html>