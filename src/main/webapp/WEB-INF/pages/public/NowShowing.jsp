<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bajeko Cinema | Now Showing</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/NowShowing.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
</head>
<body>
  <jsp:include page = "Header.jsp"/>
 
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
        <span class="chip-date">4 May</span>
      </button>
      <button class="chip">
        <span class="chip-day">Mon</span>
        <span class="chip-date">5 May</span>
      </button>
      <button class="chip">
        <span class="chip-day">Tue</span>
        <span class="chip-date">6 May</span>
      </button>
      <button class="chip">
        <span class="chip-day">Wed</span>
        <span class="chip-date">7 May</span>
      </button>
      <button class="chip">
        <span class="chip-day">Thu</span>
        <span class="chip-date">8 May</span>
      </button>
      <button class="chip">
        <span class="chip-day">Fri</span>
        <span class="chip-date">9 May</span>
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
 
  <p class="results-meta"><strong>8 movies</strong> showing today</p>
 
  <!-- Movie Grid -->
  <div class="movie-grid">
 
    <!-- Card 1 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=800&auto=format&fit=crop" alt="Interstellar Journey">
        <div class="card-format">IMAX</div>
        <div class="card-rating"><i class="fa-solid fa-star"></i> 8.4</div>
        <div class="card-overlay">
          <button class="overlay-btn primary" onclick="${pageContext.request.contextPath}/booking"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Interstellar Journey</h3>
        <p class="card-meta">Sci-Fi <span class="dot">•</span> 126 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">10:00</span>
          <span class="showtime-tag">13:30</span>
          <span class="showtime-tag sold-out">16:45</span>
          <span class="showtime-tag">20:00</span>
        </div>
      </div>
    </div>
 
    <!-- Card 2 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?q=80&w=800&auto=format&fit=crop" alt="Midnight Vigilante">
        <div class="card-rating"><i class="fa-solid fa-star"></i> 7.9</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Midnight Vigilante</h3>
        <p class="card-meta">Action <span class="dot">•</span> 142 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">11:15</span>
          <span class="showtime-tag">14:30</span>
          <span class="showtime-tag">18:00</span>
          <span class="showtime-tag sold-out">21:30</span>
        </div>
      </div>
    </div>
 
    <!-- Card 3 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?q=80&w=800&auto=format&fit=crop" alt="Desert Odyssey">
        <div class="card-format">4DX</div>
        <div class="card-rating"><i class="fa-solid fa-star"></i> 9.1</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Desert Odyssey</h3>
        <p class="card-meta">Adventure <span class="dot">•</span> 166 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">09:45</span>
          <span class="showtime-tag sold-out">13:00</span>
          <span class="showtime-tag">17:15</span>
          <span class="showtime-tag">21:00</span>
        </div>
      </div>
    </div>
 
    <!-- Card 4 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1572177812156-58036aae439c?q=80&w=800&auto=format&fit=crop" alt="Cybernetic Dawn">
        <div class="card-rating"><i class="fa-solid fa-star"></i> 8.0</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Cybernetic Dawn</h3>
        <p class="card-meta">Thriller <span class="dot">•</span> 115 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">10:30</span>
          <span class="showtime-tag">14:00</span>
          <span class="showtime-tag">17:30</span>
          <span class="showtime-tag">21:15</span>
        </div>
      </div>
    </div>
 
    <!-- Card 5 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1470813740244-df37b8c1edcb?q=80&w=800&auto=format&fit=crop" alt="Nebula Rising">
        <div class="card-format">IMAX</div>
        <div class="card-rating"><i class="fa-solid fa-star"></i> 8.7</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Nebula Rising</h3>
        <p class="card-meta">Sci-Fi <span class="dot">•</span> 138 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">12:00</span>
          <span class="showtime-tag">15:30</span>
          <span class="showtime-tag sold-out">19:00</span>
          <span class="showtime-tag">22:00</span>
        </div>
      </div>
    </div>
 
    <!-- Card 6 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=800&auto=format&fit=crop" alt="Phantom Protocol">
        <div class="card-rating"><i class="fa-solid fa-star"></i> 7.5</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Phantom Protocol</h3>
        <p class="card-meta">Action <span class="dot">•</span> 128 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">11:00</span>
          <span class="showtime-tag">14:45</span>
          <span class="showtime-tag">18:30</span>
          <span class="showtime-tag">22:15</span>
        </div>
      </div>
    </div>
 
    <!-- Card 7 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?q=80&w=800&auto=format&fit=crop" alt="Silent Frontier">
        <div class="card-rating"><i class="fa-solid fa-star"></i> 8.2</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Silent Frontier</h3>
        <p class="card-meta">Drama <span class="dot">•</span> 112 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">10:15</span>
          <span class="showtime-tag">13:45</span>
          <span class="showtime-tag">17:00</span>
          <span class="showtime-tag">20:30</span>
        </div>
      </div>
    </div>
 
    <!-- Card 8 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1485846234645-a62644f84728?q=80&w=800&auto=format&fit=crop" alt="Eclipse Protocol">
        <div class="card-format">Dolby</div>
        <div class="card-rating"><i class="fa-solid fa-star"></i> 7.6</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-ticket"></i> Book Now</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Eclipse Protocol</h3>
        <p class="card-meta">Thriller <span class="dot">•</span> 121 min</p>
        <div class="card-showtimes">
          <span class="showtime-tag">09:30</span>
          <span class="showtime-tag">12:45</span>
          <span class="showtime-tag">16:15</span>
          <span class="showtime-tag sold-out">20:00</span>
        </div>
      </div>
    </div>
 
  </div><!-- /.movie-grid -->
  
  <jsp:include page = "Footer.jsp"/>
</section>
 
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