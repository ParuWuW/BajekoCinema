<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bajeko Cinema | Now Showing</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/NowShowing.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
</head>
<body>
  <jsp:include page="../common/Header.jsp"/>

  <!-- Page Banner -->
  <div class="page-banner">
    <div class="banner-inner">
      <p class="page-eyebrow">BAJEKO Cinema</p>
      <h1 class="page-title">Now Showing</h1>
      <p class="page-subtitle">Currently screening at all BAJEKO locations</p>
      <div class="page-tabs">
        <a href="${pageContext.request.contextPath}/nowShowing" class="page-tab active">Now Showing</a>
      </div>
    </div>
  </div>

  <!-- Main Content -->
  <section class="movies-section">

    <!-- Filters Row -->
    <div class="filters-row">
      <!-- Date Chips -->
      <div class="date-chips">
        <button class="chip active">
          <span class="chip-day">Today</span>
        </button>
        <button class="chip">
          <span class="chip-day">Mon</span>
        </button>
        <button class="chip">
          <span class="chip-day">Tue</span>
        </button>
        <button class="chip">
          <span class="chip-day">Wed</span>
        </button>
        <button class="chip">
          <span class="chip-day">Thu</span>
        </button>
        <button class="chip">
          <span class="chip-day">Fri</span>
        </button>
      </div>

      <!-- Genre Pills -->
      <div class="genre-filter">
        <button class="genre-pill active">All</button>
        <button class="genre-pill">Action</button>
        <button class="genre-pill">Sci-Fi</button>
        <button class="genre-pill">Adventure</button>
        <button class="genre-pill">Thriller</button>
        <button class="genre-pill">Drama</button>
      </div>
    </div>

    <!-- Movie Grid -->
        <div class="movie-grid">
            <c:choose>
                <c:when test="${not empty nowShowingMovies}">
                    <c:forEach var="movie" items="${nowShowingMovies}">
                        <div class="movie-card">
                            <div class="card-poster">
                                <img src="${movie.posterUrl}" alt="${movie.title}">
                                <div class="card-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <c:out value="${movie.imdbScore}" />
                                </div>
                                <div class="card-overlay">
                                    <a href="${pageContext.request.contextPath}/booking?movieId=${movie.movieId}" class="overlay-btn primary">
                                        <i class="fa-solid fa-ticket"></i> Book Tickets
                                    </a>
                                    <button class="overlay-btn secondary">
                                        <i class="fa-solid fa-play"></i> Watch Trailer
                                    </button>
                                </div>
                            </div>
                            <div class="card-info">
                                <h3 class="card-title"><c:out value="${movie.title}" /></h3>
                                <p class="card-meta">
                                    <c:out value="${movie.genre}" /> &bull; <c:out value="${movie.durationMin}" /> min
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p class="empty-state">No movies are currently showing. Please check back soon.</p>
                </c:otherwise>
            </c:choose>
        </div>
  </section>
  
  <jsp:include page="../common/Footer.jsp"/>

  <script>
    // Date chip toggle
    document.querySelectorAll('.chip').forEach(chip => {
      chip.addEventListener('click', () => {
        document.querySelectorAll('.chip').forEach(c => c.classList.remove('active'));
        chip.classList.add('active');
      });
    });

    // Genre pill toggle
    document.querySelectorAll('.genre-pill').forEach(pill => {
      pill.addEventListener('click', () => {
        document.querySelectorAll('.genre-pill').forEach(p => p.classList.remove('active'));
        pill.classList.add('active');
      });
    });
  </script>

</body>
</html>
