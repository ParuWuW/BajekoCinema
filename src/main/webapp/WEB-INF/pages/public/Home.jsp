<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>BAJEKO Cinema | Home</title>

    <!-- External Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/GlobalUser.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<style>
	.card-overlay {
	    position: absolute;
	    inset: 0;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: flex-end;
	    padding: 1.2rem;
	    gap: 0.6rem;
	    opacity: 0;
	    transition: var(--transition-base);
	    z-index: 4;
	}
	
	.movie-card:hover .card-overlay {
	    opacity: 1;
	}
	
	.overlay-btn {
	    width: 100%;
	    display: inline-flex;
	    align-items: center;
	    justify-content: center;
	    gap: 0.5rem;
	    padding: 0.65rem 1rem;
	    font-size: 0.78rem;
	    font-weight: 700;
	    letter-spacing: 1px;
	    text-transform: uppercase;
	    border-radius: var(--radius-sm);
	    transition: var(--transition-fast);
	    font-family: inherit;
	    cursor: pointer;
	    border: none;
	    text-decoration: none;
	}
	
	.overlay-btn.primary {
	    background: var(--accent-gold);
	    color: var(--bg-main);
	}
	
	.overlay-btn.primary:hover {
	    background: var(--accent-gold-light);
	}
	
	.overlay-btn.secondary {
	    background: rgba(255, 255, 255, 0.08);
	    color: var(--text-primary);
	    border: 1px solid rgba(255, 255, 255, 0.15);
	    backdrop-filter: blur(8px);
	}
	
	.overlay-btn.secondary:hover {
	    border-color: rgba(255, 255, 255, 0.3);
	}
	.card-release {
	    position: absolute;
	    top: 0.85rem; right: 0.85rem;
	    z-index: 3;
	    background: rgba(10,10,10,0.75);
	    backdrop-filter: blur(8px);
	    color: var(--accent-gold);
	    padding: 0.35rem 0.7rem;
	    border-radius: var(--radius-sm);
	    font-weight: 700;
	    font-size: 0.78rem;
	    display: flex; align-items: center; gap: 0.35rem;
	    border: 1px solid rgba(212,160,23,0.25);
	    line-height: 1.3;
	    text-align: center;
	  }
	  .card-release i { font-size: 0.72rem; }
	</style>
    <meta name="description" content="BAJEKO Cinema — Experience the luminescent gallery. Book tickets, watch trailers, and explore now showing and coming soon movies.">
</head>
<body>
    <c:set var="activePage" value="home" scope="request" />
    <jsp:include page = "../common/Header.jsp"/>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-bg"
            style="background-image: url('https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
        </div>

        <div class="hero-content"> 
            <span class="hero-label">STREAMING EXCLUSIVELY AT BAJEKO</span>
            <h1 class="hero-title">PROJECT HAIL<br>MARY</h1>
            <p class="hero-desc">A lone astronaut must save the earth from disaster in this edge-of-your-seat
                thriller based on the best-selling novel. Experience the journey exclusively in our IMAX theaters.
            </p>

            <div class="hero-buttons">
                <a href="" class="btn btn-primary"><i class="fa-solid fa-play"></i> Watch Trailer</a>
                <a href="${pageContext.request.contextPath}/booking" class="btn btn-outline"><i class="fa-solid fa-ticket"></i> Book Tickets</a>
            </div>
        </div>
    </section>

    <!-- Now Showing Section-->
    <section class="movies-section">
        <div class="section-header">
            <h2 class="section-title">Now Showing</h2>
            <a href="${pageContext.request.contextPath}/nowShowing" class="view-all-link">
                View All <i class="fa-solid fa-arrow-right"></i>
            </a>
        </div>

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

    <!-- Coming Soon Section -->
    <section class="movies-section">
        <div class="section-header">
            <h2 class="section-title">Coming Soon</h2>
            <a href="${pageContext.request.contextPath}/comingSoon" class="view-all-link">
                View All <i class="fa-solid fa-arrow-right"></i>
            </a>
        </div>

        <div class="movie-grid">
	      <c:choose>
	        <c:when test="${not empty comingSoonMovies}">
	          <c:forEach var="movie" items="${comingSoonMovies}">
	            <div class="movie-card">
	              <div class="card-poster">
	                <img src="${movie.posterUrl}" alt="${movie.title}">
	                <div class="card-genre-badge">
	                  <c:out value="${movie.genre}" />
	                </div>
	                <div class="card-release">
	                  <i class="fa-regular fa-calendar"></i>
	                  <c:out value="${movie.releaseDate}" />
	                </div>
	                <div class="card-overlay">
	                  <button class="overlay-btn secondary">
	                    <i class="fa-solid fa-play"></i> Trailer
	                  </button>
	                </div>
	              </div>
	              <div class="card-info">
	                <h3 class="card-title"><c:out value="${movie.title}" /></h3>
	                <p class="card-meta">
	                  <c:out value="${movie.genre}" /> <span class="dot">&bull;</span> <c:out value="${movie.durationMin}" /> min
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

    <jsp:include page="../common/Footer.jsp" />	

</body>
</html>
