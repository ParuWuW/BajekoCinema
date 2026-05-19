<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bajeko Cinema | Coming Soon</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ComingSoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
</head>
<body>
  <jsp:include page="../common/Header.jsp"/>

  <!-- Page Banner -->
  <div class="page-banner">
    <div class="banner-inner">
      <p class="page-eyebrow">BAJEKO Cinema</p>
      <h1 class="page-title">Coming Soon</h1>
      <p class="page-subtitle">Upcoming releases — set your reminders before seats are gone</p>
      <div class="page-tabs">
        <a href="${pageContext.request.contextPath}/comingSoon" class="page-tab active">Coming Soon</a>
      </div>
    </div>
  </div>

  <!-- Main Content -->
  <section class="movies-section">

    <!-- Month Filter -->
    <form id="filterForm" method="get"
          action="${pageContext.request.contextPath}/comingSoon"
          class="genre-filter">

      <button type="submit" name="genre" value=""
              class="genre-pill ${empty selectedGenre ? 'active' : ''}">All</button>

      <c:forEach var="g" items="${genres}">
        <button type="submit" name="genre" value="${g.genreName}"
                class="genre-pill ${selectedGenre eq g.genreName ? 'active' : ''}">
          <c:out value="${g.genreName}"/>
        </button>
      </c:forEach>

      <c:if test="${empty genres}">
        <span class="chip-empty">No upcoming genres yet.</span>
      </c:if>
    </form>

    <!-- Movie Grid -->
    <div class="movie-grid">
      <c:choose>
        <c:when test="${not empty comingSoonMovies}">
          <c:forEach var="movie" items="${comingSoonMovies}">
            <div class="movie-card">
              <div class="card-poster">
                <img src="${movie.posterUrl}" alt="${movie.title}">
                <div class="card-genre-badge">
                  <c:out value="${movie.genre}"/>
                </div>
                <div class="card-release">
                  <i class="fa-regular fa-calendar"></i>
                  <c:out value="${movie.releaseDate}"/>
                </div>
                <div class="card-overlay">
                  <button class="overlay-btn secondary">
                    <i class="fa-solid fa-play"></i> Trailer
                  </button>
                </div>
              </div>
              <div class="card-info">
                <h3 class="card-title"><c:out value="${movie.title}"/></h3>
                <p class="card-meta">
                  <c:out value="${movie.genre}"/>
                  <span class="dot">&bull;</span>
                  <c:out value="${movie.durationMin}"/> min
                </p>
              </div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <p class="empty-state">No upcoming movies announced yet. Stay tuned!</p>
        </c:otherwise>
      </c:choose>
    </div>
  </section>
  
	<jsp:include page="../common/Footer.jsp"/>

  <script>
    // Month pill toggle
    document.querySelectorAll('.month-pill').forEach(pill => {
      pill.addEventListener('click', () => {
        document.querySelectorAll('.month-pill').forEach(p => p.classList.remove('active'));
        pill.classList.add('active');
      });
    });
  </script>

</body>
</html>
