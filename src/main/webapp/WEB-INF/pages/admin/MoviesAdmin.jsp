<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - Admin Dashboard</title>
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
                        <h4>Management Overview</h4>
                        <h1>Movie Management</h1>
                    </div>
                    <div class="header-buttons">
                        <button class="btn btn-primary" onclick="openModal('addMovieModal')">
                            Add New Movie
                        </button>
                    </div>
                </div>

                <!-- Table -->
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Movie Name</th>
                                <th>Language</th>
                                <th>Genre</th>
                                <th>Duration</th>
                                <th>Release Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty movieList}">
                                    <c:forEach var="movie" items="${movieList}">
                                        <tr>
                                            <td>
                                                <div class="movie-cell">
                                                    <div class="movie-info">
                                                        <h5>${movie.movieName}</h5>
                                                        <span>
                                                            <c:if test="${not empty movie.movieDescription}">
                                                                ${fn:substring(movie.movieDescription, 0, 40)}...
                                                            </c:if>
                                                        </span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${movie.movieLanguage}</td>
                                            <td><span class="badge badge-showing">${movie.movieGenre}</span></td>
                                            <td>${movie.movieDuration}</td>
                                            <td>${movie.movieReleaseDate}</td>
                                            <td>
                                                <div class="actions">
                                                    <form method="post" action="${pageContext.request.contextPath}/movies" style="display:inline;">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="movieID" value="${movie.movieID}">
                                                        <button type="submit" title="Delete" onclick="return confirm('Delete ${movie.movieName}?')">
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
                                        <td colspan="6" style="text-align:center; padding:30px; color: var(--text-muted);">
                                            No movies found. Click <strong>Add New Movie</strong> to get started.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <!-- Add Movie Modal -->
                <div id="addMovieModal" class="modal-overlay">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>Add New Movie</h2>
                            <button class="close-modal" onclick="closeModal('addMovieModal')">X</button>
                        </div>
                        <form class="modal-body" method="post" action="${pageContext.request.contextPath}/movies">
                            <input type="hidden" name="action" value="add">
                            <div class="modal-form-row">
                                <div class="form-group">
                                    <label>Movie Name</label>
                                    <input type="text" class="form-control" name="movieName" placeholder="Enter movie name" required>
                                </div>
                                <div class="form-group">
                                    <label>Language</label>
                                    <input type="text" class="form-control" name="movieLanguage" placeholder="e.g. English, Nepali" required>
                                </div>
                            </div>
                            <div class="modal-form-row">
                                <div class="form-group">
                                    <label>Release Date</label>
                                    <input type="date" class="form-control" name="movieReleaseDate" required>
                                </div>
                                <div class="form-group">
                                    <label>Duration</label>
                                    <input type="text" class="form-control" name="movieDuration" placeholder="e.g. 2h 15m" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Genre</label>
                                <input type="text" class="form-control" name="movieGenre" placeholder="e.g. Action, Sci-Fi" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="movieDescription" rows="3"
                                    placeholder="Enter movie description" style="resize: vertical;"></textarea>
                            </div>
                            <button type="submit" class="btn-save">Add Movie</button>
                        </form>
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
    </script>
</body>
</html>