<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bajeko Cinema | Now Showing</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/NowShowing.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
<style type="text/css">

form.filters-row {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 16px;
    margin-bottom: 24px;
}

.date-chips .chip,
.genre-filter .genre-pill {
    font-family: inherit;
    cursor: pointer;
}

.date-chips .chip:focus-visible,
.genre-filter .genre-pill:focus-visible {
    outline: 2px solid #e50914;
    outline-offset: 2px;
}

.date-chips .chip {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    line-height: 1.15;
}

.chip-day {
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    opacity: 0.85;
}

.chip-date {
    font-size: 14px;
    font-weight: 600;
    margin-top: 2px;
}

.chip-empty {
    color: #888;
    font-size: 13px;
    font-style: italic;
    padding: 6px 4px;
}
    /* Modal Box */
    .modal{
	    display: none;
	    position: fixed;
	    z-index: 1000;
	    left: 0;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0,0,0,0.8);
	}
    
	.modal-content{
	    position: relative;
	    width: 70%;
	    max-width: 900px;
	    margin: 5% auto;
	    background: #000;
	    border-radius: 12px;
	    overflow: hidden;
	}
	
	/* Close Button */
	.close{
	    position: absolute;
	    right: 15px;
	    top: 10px;
	    font-size: 30px;
	    color: white;
	    cursor: pointer;
	    z-index: 10;
	}
	
	iframe{
	    width: 100%;
	    height: 500px;
	    border: none;
	}
</style>
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
    <form id="filterForm" method="get"
          action="${pageContext.request.contextPath}/nowShowing"
          class="filters-row">

      <!-- Date Chips -->
      <div class="date-chips">
        <button type="submit" name="date" value=""
                class="chip ${empty selectedDate ? 'active' : ''}">
          <span class="chip-day">All</span>
        </button>

        <c:forEach var="d" items="${showDates}">
          <c:set var="dStr"><fmt:formatDate value="${d}" pattern="yyyy-MM-dd"/></c:set>
          <button type="submit" name="date" value="${dStr}"
                  class="chip ${selectedDate eq dStr ? 'active' : ''}">
            <span class="chip-day"><fmt:formatDate value="${d}" pattern="EEE"/></span>
            <span class="chip-date"><fmt:formatDate value="${d}" pattern="dd MMM"/></span>
          </button>
        </c:forEach>

        <c:if test="${empty showDates}">
          <span class="chip-empty">No scheduled shows yet.</span>
        </c:if>
      </div>

      <!-- Genre Pills -->
      <div class="genre-filter">
        <button type="submit" name="genre" value=""
                class="genre-pill ${empty selectedGenre ? 'active' : ''}">All</button>

        <c:forEach var="g" items="${genres}">
          <button type="submit" name="genre" value="${g.genreName}"
                  class="genre-pill ${selectedGenre eq g.genreName ? 'active' : ''}">
            <c:out value="${g.genreName}"/>
          </button>
        </c:forEach>
      </div>

      <!-- Preserve the OTHER filter when one is clicked -->
      <c:if test="${not empty selectedGenre}">
        <input type="hidden" name="genre" value="${selectedGenre}">
      </c:if>
      <c:if test="${not empty selectedDate}">
        <input type="hidden" name="date" value="${selectedDate}">
      </c:if>
    </form>


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
	                  <c:out value="${movie.imdbScore}"/>
	                </div>
	                <div class="card-overlay">
	                  <a href="${pageContext.request.contextPath}/booking?movieId=${movie.movieId}" class="overlay-btn primary">
	                    <i class="fa-solid fa-ticket"></i> Book Tickets
	                  </a>
                	<c:choose>
						<c:when test="${not empty movie.trailerUrl}">
							<button class="overlay-btn secondary"
								onclick="openTrailer('${movie.trailerUrl}')">
								<i class="fa-solid fa-play"></i> Watch Trailer
							</button>
						</c:when>
						<c:otherwise>
							<button class="overlay-btn secondary" disabled>
								<i class="fa-solid fa-ban"></i> No Trailer
							</button>
						</c:otherwise>
					</c:choose>
	                </div>
	              </div>
	              <div class="card-info">
	                <h3 class="card-title"><c:out value="${movie.title}"/></h3>
	                <p class="card-meta">
	                  <c:out value="${movie.genre}"/> &bull; <c:out value="${movie.durationMin}"/> min
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
  
    <!-- Trailer Modal -->
	<div class="modal" id="trailerModal">	
	    <div class="modal-content">	
	        <span class="close" onclick="closeTrailer()">
	            &times;
	        </span>	
	        <iframe
	            id="trailerFrame"
	            src=""
	            allowfullscreen>
	        </iframe>
	
	    </div>
	
	</div>
  
  <jsp:include page="../common/Footer.jsp"/>

  <script>
  
	function openTrailer(trailerUrl){
		
	    if(!trailerUrl || trailerUrl.trim() === ""){
	        return;
	    }
	
	    document.getElementById("trailerFrame").src = trailerUrl;
	    document.getElementById("trailerModal").style.display = "block";
	}
	
	function closeTrailer(){
	
	    const iframe = document.getElementById("trailerFrame");
	
	    // stop video playback
	    iframe.src = "";
	
	    document.getElementById("trailerModal").style.display = "none";
	}
	
	/* close when clicking outside */
	window.onclick = function(event){
	
	    const modal = document.getElementById("trailerModal");
	
	    if(event.target === modal){
	        closeTrailer();
	 }
	}
	    
  // When user clicks a date chip, remove the hidden date input so the new
  // value wins. Same for genre. This prevents two values being submitted.
  (function () {
    var form = document.getElementById('filterForm');
    if (!form) return;
    form.addEventListener('click', function (e) {
      var btn = e.target.closest('button[type="submit"]');
      if (!btn) return;
      var name = btn.getAttribute('name');
      if (!name) return;
      var hidden = form.querySelector('input[type="hidden"][name="' + name + '"]');
      if (hidden) hidden.parentNode.removeChild(hidden);
    });
  })();
  </script>

</body>
</html>
