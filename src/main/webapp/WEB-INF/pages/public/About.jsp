<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Bajeko Cinema</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/AboutUs.css">
</head>
<body>
    <c:set var="activePage" value="aboutUs" scope="request" />
    <jsp:include page = "../common/Header.jsp"/>
        
    <main class="about-container">
        
        <header class="page-header">
            <h1 class="page-title">The Bajeko <span>Experience</span></h1>
            <p class="page-desc">Where cinematic mastery meets unparalleled digital luxury. Redefining the way you discover, book, and immerse yourself in the art of film.</p>
        </header>

        <section class="features-section">
            <div class="feature-grid">
                
                <div class="feature-card">
                    <i class="fa-solid fa-crown feature-icon"></i>
                    <h3 class="feature-title">The Bajeko Standard</h3>
                    <p class="feature-text">Our curation ensures every screening meets an uncompromising baseline of visual acoustics and service.</p>
                </div>

                <div class="feature-card">
                    <i class="fa-solid fa-compact-disc feature-icon"></i>
                    <h3 class="feature-title">Curated Selection</h3>
                    <p class="feature-text">We don't just show movies; we present an anthology of independent gems and mainstream spectacles alike.</p>
                </div>

                <div class="feature-card">
                    <i class="fa-solid fa-couch feature-icon"></i>
                    <h3 class="feature-title">Digital Concierge</h3>
                    <p class="feature-text">Seamless booking algorithms with a digital concierge system predicting your comfort needs.</p>
                </div>

            </div>
        </section>
		<!-- Group Member Individual --> 
        <section class="visionaries-section">
            <span class="visionaries-label">THE VISIONARIES</span>
            <h2 class="visionaries-title">Our Co-Founders</h2>

            <div class="founders-grid-top">
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/resources/images/khushi.jpg" alt="Khushi Shrestha" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=K+S&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Khushi Shrestha</h4>
                    <span class="founder-role">PROJECT MANAGER</span>
                </div>
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/resources/images/paru.jpg" alt="Pragun Bhattarai" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=P+B&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Pragun Bhattarai</h4>
                    <span class="founder-role">BACKEND DEVELOPER</span>
                </div>
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/resources/images/darsheel.jpg" alt="Darsheel Bam" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=D+B&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Darsheel Bam</h4>
                    <span class="founder-role">UI / UX</span>
                </div>
            </div>

            <div class="founders-grid-bottom">
                <div class="founder-card" style="width: 250px;">
                    <img src="${pageContext.request.contextPath}/resources/images/sichu.jpg" alt="Sichu Maharjan" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=S+M&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Sichu Maharjan</h4>
                    <span class="founder-role">DATBASE ADMINISTRATOR</span>
                </div>
                <div class="founder-card" style="width: 250px;">
                    <img src="${pageContext.request.contextPath}/resources/images/aviyaan.jpg" alt="Aviyaan Shrestha" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=A+S&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Aviyaan Shrestha</h4>
                    <span class="founder-role">FRONTEND DEVELOPER</span>
                </div>
            </div>
        </section>
        <!-- Our story --> 
<section class="story-section">
    <span class="ab-label">OUR ORIGIN</span>
    <div class="story-grid">
        <div class="story-text">
            <h2 class="story-title">Born from a <span>Passion</span><br>for Cinema</h2>
            <p class="story-body">Bajeko Cinema was founded on a singular belief — that watching a film should feel like an event, not a transaction. What began as a small collective of film enthusiasts in Kathmandu grew into Nepal's most refined cinematic destination.</p>
            <p class="story-body">We blended technology with the warmth of storytelling to build a platform where every booking feels intentional and every screening feels curated. Bajeko is not just a cinema. It is a commitment.</p>
        </div>
        <div class="story-stats">
            <div class="stat-card">
                <i class="fa-solid fa-ticket stat-icon"></i>
                <span class="stat-num">50K+</span>
                <span class="stat-label">Tickets Booked</span>
            </div>
            <div class="stat-card">
                <i class="fa-solid fa-clapperboard stat-icon"></i>
                <span class="stat-num">120+</span>
                <span class="stat-label">Premieres Hosted</span>
            </div>
            <div class="stat-card">
                <i class="fa-solid fa-display stat-icon"></i>
                <span class="stat-num">25+</span>
                <span class="stat-label">Luxury Screens</span>
            </div>
            <div class="stat-card">
                <i class="fa-solid fa-star stat-icon"></i>
                <span class="stat-num">98%</span>
                <span class="stat-label">Guest Satisfaction</span>
            </div>
        </div>
    </div>
</section>

<!-- Mission & Vision --> 
<section class="mv-section">
    <span class="ab-label">OUR PURPOSE</span>
    <div class="mv-grid">
        <div class="mv-card">
            <div class="mv-icon-wrap"><i class="fa-solid fa-eye"></i></div>
            <h3 class="mv-title">Our Vision</h3>
            <p class="mv-text">To become South Asia's most respected cinematic platform — where technology dissolves into the background and the story takes center stage.</p>
        </div>
        <div class="mv-card mv-card--accent">
            <div class="mv-icon-wrap"><i class="fa-solid fa-bullseye"></i></div>
            <h3 class="mv-title">Our Mission</h3>
            <p class="mv-text">To deliver a seamless, luxurious, and emotionally resonant cinema experience to every guest — from the moment they discover a film to the final credit roll.</p>
        </div>
        <div class="mv-card">
            <div class="mv-icon-wrap"><i class="fa-solid fa-heart"></i></div>
            <h3 class="mv-title">Our Promise</h3>
            <p class="mv-text">Every seat, every screen, every interaction is designed with care. We promise not just a ticket, but a memory worth returning for.</p>
        </div>
    </div>
</section>

<!-- Why choose Bajeko --> 
<section class="why-section">
    <span class="ab-label">THE BAJEKO DIFFERENCE</span>
    <h2 class="ab-title">Why Choose <span>Bajeko Cinema</span></h2>
    <div class="why-grid">
        <div class="why-card">
            <i class="fa-solid fa-level-up why-icon"></i>
            <h4 class="why-card-title">Cinema Upgrade</h4>
            <p class="why-card-text">360-degree immersive audio that places you inside the story, not beside it.</p>
        </div>
        <div class="why-card">
            <i class="fa-solid fa-chair why-icon"></i>
            <h4 class="why-card-title">Velvet Recliners</h4>
            <p class="why-card-text">Hand-stitched motorized recliners with personal tray tables and USB charging.</p>
        </div>
        <div class="why-card">
            <i class="fa-solid fa-martini-glass-citrus why-icon"></i>
            <h4 class="why-card-title">VIP Lounge</h4>
            <p class="why-card-text">An exclusive pre-screening lounge with curated beverages and ambient lighting.</p>
        </div>
        <div class="why-card">
            <i class="fa-solid fa-mobile-screen why-icon"></i>
            <h4 class="why-card-title">Digital Concierge</h4>
            <p class="why-card-text">Book, modify, and personalize your entire screening experience from anywhere.</p>
        </div>
        <div class="why-card">
            <i class="fa-solid fa-utensils why-icon"></i>
            <h4 class="why-card-title">In-Seat Dining</h4>
            <p class="why-card-text">Chef-curated menus delivered silently to your seat before the film begins.</p>
        </div>
        <div class="why-card">
            <i class="fa-solid fa-shield-halved why-icon"></i>
            <h4 class="why-card-title">Private Screenings</h4>
            <p class="why-card-text">Reserve an entire auditorium for personal events or corporate functions.</p>
        </div>
    </div>
</section>

<!-- Value --> 
<section class="values-section">
    <span class="ab-label">WHAT WE STAND FOR</span>
    <h2 class="ab-title">Our Core <span>Values</span></h2>
    <div class="values-list">
        <div class="value-row">
            <span class="value-num">01</span>
            <div class="value-body">
                <h4 class="value-name">Innovation</h4>
                <p class="value-desc">We constantly push the boundaries of what a cinema platform can offer — from AI-assisted seating to real-time concierge support.</p>
            </div>
            <i class="fa-solid fa-microchip value-icon"></i>
        </div>
        <div class="value-row">
            <span class="value-num">02</span>
            <div class="value-body">
                <h4 class="value-name">Comfort</h4>
                <p class="value-desc">Every physical and digital touchpoint is obsessively designed around the ease and comfort of our guests.</p>
            </div>
            <i class="fa-solid fa-couch value-icon"></i>
        </div>
        <div class="value-row">
            <span class="value-num">03</span>
            <div class="value-body">
                <h4 class="value-name">Community</h4>
                <p class="value-desc">We champion local filmmakers, host cultural film festivals, and believe cinema is a right — not a privilege.</p>
            </div>
            <i class="fa-solid fa-globe value-icon"></i>
        </div>
        <div class="value-row">
            <span class="value-num">04</span>
            <div class="value-body">
                <h4 class="value-name">Storytelling</h4>
                <p class="value-desc">We curate with purpose — every film on our platform is selected to move, challenge, or inspire the audience.</p>
            </div>
            <i class="fa-solid fa-film value-icon"></i>
        </div>
    </div>
</section>
<!-- Timeline --> 
<section class="timeline-section">
    <span class="ab-label">OUR JOURNEY</span>
    <h2 class="ab-title">Milestones That <span>Defined</span> Us</h2>
    <div class="timeline">
        <div class="tl-item">
            <div class="tl-year">2019</div>
            <div class="tl-dot"></div>
            <div class="tl-card">
                <h4 class="tl-event">The Idea</h4>
                <p class="tl-desc">Five co-founders gather in Kathmandu with a shared frustration — cinema deserves better.</p>
            </div>
        </div>
        <div class="tl-item tl-item--right">
            <div class="tl-card">
                <h4 class="tl-event">First Screening</h4>
                <p class="tl-desc">Bajeko hosts its inaugural curated screening to 200 guests. Every seat sells out in under 4 hours.</p>
            </div>
            <div class="tl-dot"></div>
            <div class="tl-year">2020</div>
        </div>
        <div class="tl-item">
            <div class="tl-year">2021</div>
            <div class="tl-dot"></div>
            <div class="tl-card">
                <h4 class="tl-event">Platform Launch</h4>
                <p class="tl-desc">The Bajeko digital platform goes live — seamless booking, digital tickets, and the concierge system debut.</p>
            </div>
        </div>
        <div class="tl-item tl-item--right">
            <div class="tl-card">
                <h4 class="tl-event">Cinema Enhancement</h4>
                <p class="tl-desc">All auditoriums are equppiued with better sound devices and 4K laser projection, setting a new national standard.</p>
            </div>
            <div class="tl-dot"></div>
            <div class="tl-year">2023</div>
        </div>
        <div class="tl-item">
            <div class="tl-year">2025</div>
            <div class="tl-dot"></div>
            <div class="tl-card">
                <h4 class="tl-event">50,000 Guests</h4>
                <p class="tl-desc">Bajeko Cinema welcomes its 50,000th guest.</p>
            </div>
        </div>
    </div>
</section>

<!-- Reviews --> 
<section class="testimonials-section">
    <span class="ab-label">GUEST VOICES</span>
    <h2 class="ab-title">What Our <span>Guests</span> Say</h2>
    <div class="testimonials-grid">
        <div class="testi-card">
            <div class="testi-stars">
                <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
            </div>
            <p class="testi-text">"The recliner, the Atmos sound, the in-seat menu — I forgot I was still in Kathmandu. This is world-class cinema."</p>
            <div class="testi-author">
                <div class="testi-avatar">RK</div>
                <div>
                    <span class="testi-name">Rohan K.</span>
                    <span class="testi-tag">Velvet Member</span>
                </div>
            </div>
        </div>
        <div class="testi-card testi-card--featured">
            <div class="testi-stars">
                <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
            </div>
            <p class="testi-text">"I booked a private screening for my anniversary. The concierge handled everything — flowers, menu, timing. Absolutely magical."</p>
            <div class="testi-author">
                <div class="testi-avatar">PS</div>
                <div>
                    <span class="testi-name">Priya S.</span>
                    <span class="testi-tag">Private Screening Guest</span>
                </div>
            </div>
        </div>
        <div class="testi-card">
            <div class="testi-stars">
                <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
            </div>
            <p class="testi-text">"The smoothest booking experience I have ever used. The QR ticket worked instantly at entry. Loved every moment."</p>
            <div class="testi-author">
                <div class="testi-avatar">AM</div>
                <div>
                    <span class="testi-name">Aditya M.</span>
                    <span class="testi-tag">Regular Guest</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Group Section -->
<section class="family-section">
    <span class="ab-label">THE TEAM</span>
    <h2 class="ab-title">The Bajeko <span>Family</span></h2>
    <p class="family-desc">Five visionaries. One shared obsession. The people behind every frame, every seat, and every seamless booking experience at Bajeko Cinema.</p>

    <div class="family-photo-wrap">
        <img
            src="${pageContext.request.contextPath}/resources/images/Team.jpg"
            alt="The Bajeko Cinema Team"
            class="family-photo"
            onerror="this.src='https://ui-avatars.com/api/?name=Bajeko+Cinema+Team&background=1a1a1c&color=fbbf24&size=800&font-size=0.2&length=3'"
        />
        <div class="family-photo-overlay">
            <span class="family-overlay-label">Bajeko Cinema — Est. 2026</span>
        </div>
    </div>

    <div class="family-stats">
        <div class="family-stat">
            <span class="family-stat-num">5</span>
            <span class="family-stat-label">Co-Founders</span>
        </div>
        <div class="family-stat-divider"></div>
        <div class="family-stat">
            <span class="family-stat-num">6+</span>
            <span class="family-stat-label">Years Together</span>
        </div>
        <div class="family-stat-divider"></div>
        <div class="family-stat">
            <span class="family-stat-num">50K+</span>
            <span class="family-stat-label">Guests Served</span>
        </div>
        <div class="family-stat-divider"></div>
        <div class="family-stat">
            <span class="family-stat-num">1</span>
            <span class="family-stat-label">Shared Vision</span>
        </div>
    </div>
</section>

<!-- Closing Banner --> 
<section class="closing-section">
	<img src="${pageContext.request.contextPath}/resources/images/ClosingBanner.jpg">
    <p class="closing-label">BAJEKO CINEMA</p>
    <h2 class="closing-quote">"Where Every Frame<br>Becomes a <span>Memory.</span>"</h2>
    <p class="closing-sub">The screen goes dark. The story stays with you forever.</p>
</section>

    </main>

    <jsp:include page="../common/Footer.jsp" />

</body>
</html>
