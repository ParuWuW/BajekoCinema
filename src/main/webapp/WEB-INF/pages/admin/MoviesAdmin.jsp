<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bajekocinema.model.MovieModel" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - Movies</title>
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
            <c:if test="${empty showAddForm and empty showEditForm and empty showGenreForm}">

                <div class="page-header">
                    <div>
                        <h4>Management Overview</h4>
                        <h1>Movies</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/movies?form=genre"
                           class="btn btn-secondary">Add Genre</a>
                        <a href="${pageContext.request.contextPath}/admin/movies?form=add"
                           class="btn btn-primary">Add Movie</a>
                    </div>
                </div>

                <div class="dashboard-content" style="margin-top:24px; display:flex; flex-direction:column; flex-grow:1; overflow:hidden;">
                    <div class="section-title" style="display:flex; justify-content:space-between; align-items:center; margin-bottom:24px;">
                        <h2 style="font-size:20px; font-weight:600;">Movie List</h2>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Poster</th>
                                    <th>Movie Name</th>
                                    <th>Genre</th>
                                    <th>Duration</th>
                                    <th>Release Date</th>
                                    <th>IMDB</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty movieList}">
                                        <c:forEach var="movie" items="${movieList}" varStatus="loop">
                                            <tr>
                                                <td>${loop.count}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty movie.posterUrl}">
                                                            <img src="${pageContext.request.contextPath}/${movie.posterUrl}"
                                                                 alt="poster" width="40" height="55"
                                                                 style="object-fit:cover;border-radius:3px;">
                                                        </c:when>
                                                        <c:otherwise>—</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${movie.title}</td>
                                                <td>${movie.genre}</td>
                                                <td>${movie.durationMin} min</td>
                                                <td>${movie.releaseDate}</td>
                                                <td>${movie.imdbScore}</td>
                                                <td>${movie.status}</td>
                                                <td>
                                                    <div class="actions">
                                                        <a href="${pageContext.request.contextPath}/admin/movies?editMovieID=${movie.movieId}"
                                                           class="edit">Edit</a>
                                                        <form method="post"
                                                              action="${pageContext.request.contextPath}/admin/movies"
                                                              enctype="multipart/form-data"
                                                              style="display:inline;">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="movieID" value="${movie.movieId}">
                                                            <button type="submit" class="delete">Delete</button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="9" style="text-align:center;padding:30px;color:var(--text-muted);">
                                                No movies found. Click <strong>Add Movie</strong> to get started.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

            </c:if>

            <%-- ====== ADD MOVIE FORM ====== --%>
            <c:if test="${showAddForm}">

                <div class="page-header">
                    <div>
                        <h4>Movie Management</h4>
                        <h1>Add New Movie</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/movies"
                           class="btn btn-secondary">Back to Movies</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/movies"
                          enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Movie Name</label>
                                <input type="text" class="form-control" name="movieName"
                                       placeholder="Enter movie name" required>
                            </div>
                            <div class="form-group">
                                <label>Genre</label>
                                <c:choose>
                                    <c:when test="${not empty genreList}">
                                        <select class="form-control" name="movieGenre" required>
                                            <option value="">Select Genre</option>
                                            <c:forEach var="g" items="${genreList}">
                                                <option value="${g}">${g}</option>
                                            </c:forEach>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" name="movieGenre"
                                               placeholder="Add genres first via Add Genre" required>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Duration (minutes)</label>
                                <input type="number" class="form-control" name="movieDuration"
                                       placeholder="e.g. 148" min="1" required>
                            </div>
                            <div class="form-group">
                                <label>Release Date</label>
                                <input type="date" class="form-control" name="movieReleaseDate" required>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>IMDB Score</label>
                                <input type="number" class="form-control" name="imdbScore"
                                       placeholder="e.g. 8.3" step="0.1" min="0" max="10">
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="movieStatus" required>
                                    <option value="">Select Status</option>
                                    <c:forEach var="s" items="${statusList}">
                                        <option value="${s}">${s}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" name="movieDescription" rows="3"
                                      placeholder="Enter movie description"
                                      style="resize:vertical;"></textarea>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Poster Image</label>
                                <input type="file" class="form-control" name="posterFile" accept="image/*">
                            </div>
                            <div class="form-group">
                                <label>Trailer (YouTube Embed Link)</label>
                                <input type="text" class="form-control" name="trailerUrl"
                                       placeholder="e.g. https://www.youtube.com/embed/dQw4w9WgXcQ">
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Add Movie</button>
                    </form>
                </div>

            </c:if>

            <%-- ====== EDIT MOVIE FORM ====== --%>
            <c:if test="${showEditForm}">

                <div class="page-header">
                    <div>
                        <h4>Movie Management</h4>
                        <h1>Edit — ${editMovie.title}</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/movies"
                           class="btn btn-secondary">Back to Movies</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/movies"
                          enctype="multipart/form-data">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="editMovieID" value="${editMovie.movieId}">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Movie Name</label>
                                <input type="text" class="form-control" name="editMovieName"
                                       value="${editMovie.title}" required>
                            </div>
                            <div class="form-group">
                                <label>Genre</label>
                                <c:choose>
                                    <c:when test="${not empty genreList}">
                                        <select class="form-control" name="editMovieGenre" required>
                                            <option value="">Select Genre</option>
                                            <c:forEach var="g" items="${genreList}">
                                                <option value="${g}"
                                                    <c:if test="${g == editMovie.genre}">selected</c:if>>${g}</option>
                                            </c:forEach>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" name="editMovieGenre"
                                               value="${editMovie.genre}" required>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Duration (minutes)</label>
                                <input type="number" class="form-control" name="editMovieDuration"
                                       value="${editMovie.durationMin}" min="1" required>
                            </div>
                            <div class="form-group">
                                <label>Release Date</label>
                                <input type="date" class="form-control" name="editMovieReleaseDate"
                                       value="${editMovie.releaseDate}" required>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>IMDB Score</label>
                                <input type="number" class="form-control" name="editImdbScore"
                                       value="${editMovie.imdbScore}" step="0.1" min="0" max="10">
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="editMovieStatus" required>
                                    <option value="">Select Status</option>
                                    <c:forEach var="s" items="${statusList}">
                                        <option value="${s}"
                                            <c:if test="${s == editMovie.status}">selected</c:if>>${s}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" name="editMovieDescription" rows="3"
                                      style="resize:vertical;">${editMovie.description}</textarea>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Replace Poster (leave blank to keep current)</label>
                                <c:if test="${not empty editMovie.posterUrl}">
                                    <img src="${pageContext.request.contextPath}/${editMovie.posterUrl}"
                                         alt="Current poster" width="50" height="68"
                                         style="object-fit:cover;border-radius:3px;display:block;margin-bottom:6px;">
                                </c:if>
                                <input type="file" class="form-control" name="editPosterFile" accept="image/*">
                            </div>
                            <div class="form-group">
                                <label>Trailer (YouTube Embed Link)</label>
                                <input type="text" class="form-control" name="editTrailerUrl"
                                       value="${editMovie.trailerUrl}"
                                       placeholder="e.g. https://www.youtube.com/embed/dQw4w9WgXcQ">
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Save Changes</button>
                    </form>
                </div>

            </c:if>

            <%-- ====== ADD GENRE FORM ====== --%>
            <c:if test="${showGenreForm}">

                <div class="page-header">
                    <div>
                        <h4>Movie Management</h4>
                        <h1>Add Genre</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/movies"
                           class="btn btn-secondary">Back to Movies</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/movies"
                          enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add_genre">
                        <div class="form-group">
                            <label>Genre Name</label>
                            <input type="text" class="form-control" name="genreName"
                                   placeholder="e.g. Action, Comedy, Thriller" required>
                        </div>
                        <button type="submit" class="btn-save">Add Genre</button>
                    </form>
                </div>

            </c:if>

        </main>

        <jsp:include page="../common/FooterAdmin.jsp" />
    </div>
</div>
</body>
</html>