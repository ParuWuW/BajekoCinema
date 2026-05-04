<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page = "Header.jsp"/>
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
  <div class="month-filter">
    <button class="month-pill active">All</button>
    <button class="month-pill">May 2026</button>
    <button class="month-pill">June 2026</button>
    <button class="month-pill">July 2026</button>
    <button class="month-pill">August 2026</button>
  </div>
 
  <p class="results-meta"><strong>8 films</strong> arriving soon</p>
 
  <!-- Movie Grid -->
  <div class="movie-grid">
 
    <!-- Card 1 – Most anticipated -->
    <div class="movie-card">
      <div class="card-poster">
        <div class="card-hot">Most Anticipated</div>
        <img src="https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?q=80&w=800&auto=format&fit=crop" alt="Project Hail Mary">
        <div class="card-genre-badge badge-scifi">Sci-Fi</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 16 May</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Project Hail Mary</h3>
        <p class="card-meta">Sci-Fi <span class="dot">•</span> 148 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>12 days</strong></p>
      </div>
    </div>
 
    <!-- Card 2 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?q=80&w=800&auto=format&fit=crop" alt="The Last Signal">
        <div class="card-genre-badge badge-drama">Drama</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 23 May</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">The Last Signal</h3>
        <p class="card-meta">Drama <span class="dot">•</span> 108 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>19 days</strong></p>
      </div>
    </div>
 
    <!-- Card 3 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1471107340929-a87cd0f5b5f3?q=80&w=800&auto=format&fit=crop" alt="Storm Riders">
        <div class="card-genre-badge badge-action">Action</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 30 May</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Storm Riders</h3>
        <p class="card-meta">Action <span class="dot">•</span> 132 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>26 days</strong></p>
      </div>
    </div>
 
    <!-- Card 4 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?q=80&w=800&auto=format&fit=crop" alt="Echoes of Terra">
        <div class="card-genre-badge badge-adventure">Adventure</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 6 Jun</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Echoes of Terra</h3>
        <p class="card-meta">Adventure <span class="dot">•</span> 154 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>33 days</strong></p>
      </div>
    </div>
 
    <!-- Card 5 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?q=80&w=800&auto=format&fit=crop" alt="Dark Matter">
        <div class="card-genre-badge badge-horror">Horror</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 13 Jun</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Dark Matter</h3>
        <p class="card-meta">Horror <span class="dot">•</span> 97 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>40 days</strong></p>
      </div>
    </div>
 
    <!-- Card 6 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=800&auto=format&fit=crop" alt="Velocity">
        <div class="card-genre-badge badge-action">Action</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 20 Jun</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Velocity</h3>
        <p class="card-meta">Action <span class="dot">•</span> 119 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>47 days</strong></p>
      </div>
    </div>
 
    <!-- Card 7 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1470813740244-df37b8c1edcb?q=80&w=800&auto=format&fit=crop" alt="Starbound">
        <div class="card-genre-badge badge-scifi">Sci-Fi</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 4 Jul</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Starbound</h3>
        <p class="card-meta">Sci-Fi <span class="dot">•</span> 143 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>61 days</strong></p>
      </div>
    </div>
 
    <!-- Card 8 -->
    <div class="movie-card">
      <div class="card-poster">
        <img src="https://images.unsplash.com/photo-1485846234645-a62644f84728?q=80&w=800&auto=format&fit=crop" alt="Fade to Black">
        <div class="card-genre-badge badge-drama">Drama</div>
        <div class="card-release"><i class="fa-regular fa-calendar"></i> 18 Jul</div>
        <div class="card-overlay">
          <button class="overlay-btn primary"><i class="fa-solid fa-bell"></i> Notify Me</button>
          <button class="overlay-btn secondary"><i class="fa-solid fa-play"></i> Trailer</button>
        </div>
      </div>
      <div class="card-info">
        <h3 class="card-title">Fade to Black</h3>
        <p class="card-meta">Drama <span class="dot">•</span> 124 min</p>
        <button class="notify-btn"><i class="fa-regular fa-bell"></i> Notify Me</button>
        <p class="card-countdown">Releasing in <strong>75 days</strong></p>
      </div>
    </div>
 
  </div><!-- /.movie-grid -->
  
  <jsp:include page = "Header.jsp"/>
</section>
 
<script>
  // Month pill toggle
  document.querySelectorAll('.month-pill').forEach(pill => {
    pill.addEventListener('click', () => {
      document.querySelectorAll('.month-pill').forEach(p => p.classList.remove('active'));
      pill.classList.add('active');
    });
  });
 
  // Notify Me toggle (all instances — card info + overlay)
  document.querySelectorAll('.notify-btn').forEach(btn => {
    btn.addEventListener('click', e => {
      e.stopPropagation();
      const isNotified = btn.classList.toggle('notified');
      if (isNotified) {
        btn.innerHTML = '<i class="fa-solid fa-bell"></i> Notified';
      } else {
        btn.innerHTML = '<i class="fa-regular fa-bell"></i> Notify Me';
      }
    });
  });
</script>
</body>
</html>