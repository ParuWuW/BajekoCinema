<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>BAJEKO Cinema | Home</title>

    <!-- External Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css//Home.css">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <meta name="description" content="BAJEKO Cinema — Experience the luminescent gallery. Book tickets, watch trailers, and explore now showing and coming soon movies.">
</head>
<body>
    <c:set var="activePage" value="home" scope="request" />
    <jsp:include page = "Header.jsp"/>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-overlay"></div>
        <!-- Hero Background Placeholder (Replace URL dynamically if needed) -->
        <div class="hero-bg"
            style="background-image: url('https://images.unsplash.com/photo-1440404653325-ab127d49abc1?q=80&w=2070&auto=format&fit=crop');">
        </div>

        <div class="hero-content">
            <span class="hero-label">STREAMING EXCLUSIVELY AT BAJEKO</span>
            <h1 class="hero-title">PROJECT HAIL<br>MARY</h1>
            <p class="hero-desc">A lone astronaut must save the earth from disaster in this edge-of-your-seat
                thriller based on the best-selling novel. Experience the journey exclusively in our IMAX theaters.
            </p>

            <div class="hero-buttons">
                <a href="#" class="btn btn-primary"><i class="fa-solid fa-play"></i> Watch Trailer</a>
                <a href="#" class="btn btn-outline"><i class="fa-solid fa-ticket"></i> Book Tickets</a>
            </div>
        </div>
    </section>

    <!-- Movies Content Section -->
    <section class="movies-section">

        <!-- Section Tabs -->
        <div class="tabs-container">
            <button class="tab-btn active">Now Showing</button>
            <button class="tab-btn">Coming Soon</button>
        </div>

        <!-- Date Filter Chips -->
        <div class="date-chips">
            <button class="chip active">
                <span class="chip-day">Today</span>
                <span class="chip-date">24 May</span>
            </button>
            <button class="chip">
                <span class="chip-day">Sat</span>
                <span class="chip-date">25 May</span>
            </button>
            <button class="chip">
                <span class="chip-day">Sun</span>
                <span class="chip-date">26 May</span>
            </button>
            <button class="chip">
                <span class="chip-day">Mon</span>
                <span class="chip-date">27 May</span>
            </button>
            <button class="chip">
                <span class="chip-day">Tue</span>
                <span class="chip-date">28 May</span>
            </button>
            <button class="chip">
                <span class="chip-day">Wed</span>
                <span class="chip-date">29 May</span>
            </button>
        </div>

        <!-- Movie Cards Grid -->
        <div class="movie-grid">

            <%-- Future DB loop goes here: for(Movie m : moviesList) { --%>

                <!-- Dummy Card 1 -->
                <div class="movie-card">
                    <div class="card-poster">
                        <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=800&auto=format&fit=crop"
                            alt="Interstellar Journey">
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 8.4</div>
                    </div>
                    <div class="card-info">
                        <h3 class="card-title">Interstellar Journey</h3>
                        <p class="card-meta">Sci-Fi • 126 min</p>
                    </div>
                </div>

                <!-- Dummy Card 2 -->
                <div class="movie-card">
                    <div class="card-poster">
                        <img src="https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=80&w=800&auto=format&fit=crop"
                            alt="The Dark Knight">
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 7.9</div>
                    </div>
                    <div class="card-info">
                        <h3 class="card-title">Midnight Vigilante</h3>
                        <p class="card-meta">Action • 142 min</p>
                    </div>
                </div>

                <!-- Dummy Card 3 -->
                <div class="movie-card">
                    <div class="card-poster">
                        <img src="https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=80&w=800&auto=format&fit=crop"
                            alt="Dune Sand">
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 9.1</div>
                    </div>
                    <div class="card-info">
                        <h3 class="card-title">Desert Odyssey</h3>
                        <p class="card-meta">Adventure • 166 min</p>
                    </div>
                </div>

                <!-- Dummy Card 4 -->
                <div class="movie-card">
                    <div class="card-poster">
                        <img src="https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=80&w=800&auto=format&fit=crop"
                            alt="Cyberpunk City">
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 8.0</div>
                    </div>
                    <div class="card-info">
                        <h3 class="card-title">Cybernetic Dawn</h3>
                        <p class="card-meta">Thriller • 115 min</p>
                    </div>
                </div>

                <%-- } End DB Loop --%>
        </div>
    </section> 

    <jsp:include page="Footer.jsp" />	

</body>
</html>