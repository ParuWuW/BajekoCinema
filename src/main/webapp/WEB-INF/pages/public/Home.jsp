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
    	.btn-primary, .btn-outline {
		    border-radius: 50px !important;
		}
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

    <!-- ==================== Now Showing Section ==================== -->
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
				    <a href="${pageContext.request.contextPath}/movie?id=${movie.movieId}" class="movie-card">
				        <div class="card-poster">
				            <img src="${movie.posterUrl}" alt="${movie.title}">
				            <div class="card-rating">
				                <i class="fa-solid fa-star"></i>
				                <c:out value="${movie.imdbScore}" />
				            </div>
				        </div>
				        <div class="card-info">
				            <h3 class="card-title"><c:out value="${movie.title}" /></h3>
				            <p class="card-meta">
				                <c:out value="${movie.genre}" /> &bull; <c:out value="${movie.durationMin}" /> min
				            </p>
				        </div>
				    </a>
				</c:forEach>
                </c:when>
                <c:otherwise>
                    <p class="empty-state">No movies are currently showing. Please check back soon.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <!-- ==================== Coming Soon Section ==================== -->
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
				    <a href="${pageContext.request.contextPath}/movie?id=${movie.movieId}" class="movie-card">
				        <div class="card-poster">
				            <img src="${movie.posterUrl}" alt="${movie.title}">
				            <div class="card-rating">
				                <i class="fa-solid fa-star"></i>
				                <c:out value="${movie.imdbScore}" />
				            </div>
				        </div>
				        <div class="card-info">
				            <h3 class="card-title"><c:out value="${movie.title}" /></h3>
				            <p class="card-meta">
				                <c:out value="${movie.genre}" /> &bull; <c:out value="${movie.durationMin}" /> min
				            </p>
				        </div>
				    </a>
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