<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Bajeko Cinema</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Internal CSS (Retaining external files as requested but injected here for now) -->
    <style>
        /* Base Styles for User Facing Pages */
        :root {
            --bg-app: #0D0D0D;
            --surface: #131415;
            --surface-light: #1A1A1C;
            --text-main: #ffffff;
            --text-muted: #8e8e93;
            --accent-yellow: #fbbf24;
            --accent-yellow-dark: #d97706;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-app);
            color: var(--text-main);
            line-height: 1.5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
        }

        /* Footer (Shared) */
        footer {
            background-color: #0b0c0d;
            padding: 60px 40px;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px;
        }

        .footer-col h5 {
            color: var(--text-main);
            font-size: 13px;
            letter-spacing: 1px;
            margin-bottom: 25px;
            text-transform: uppercase;
            font-weight: 600;
        }

        .footer-col h5.accent {
            color: var(--accent-yellow);
        }

        .footer-col ul {
            list-style: none;
        }

        .footer-col ul li {
            margin-bottom: 12px;
        }

        .footer-col a {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }

        .footer-col a:hover {
            color: var(--text-main);
        }

        .social-icons {
            display: flex;
            gap: 12px;
            margin-bottom: 25px;
        }

        .social-icons a {
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.03);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-main);
            transition: all 0.3s;
        }

        .social-icons a:hover {
            background-color: var(--accent-yellow);
            color: #000;
        }

        .contact-info {
            color: var(--text-muted);
            font-size: 14px;
            line-height: 1.8;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 40px;
            margin-top: 40px;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            color: rgba(251, 191, 36, 0.5); /* Faded yellow */
            font-size: 11px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        /* About Us Specific Styles */
        .about-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 80px 40px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 80px;
        }

        .page-title {
            font-size: 64px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .page-title span {
            color: var(--accent-yellow);
        }

        .page-desc {
            color: var(--text-muted);
            font-size: 18px;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            margin-bottom: 100px;
        }

        .feature-card {
            background-color: var(--surface);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            background-color: var(--surface-light);
        }

        .feature-icon {
            font-size: 32px;
            color: var(--accent-yellow);
            margin-bottom: 25px;
        }

        .feature-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .feature-text {
            color: var(--text-muted);
            font-size: 14px;
            line-height: 1.6;
        }

        .visionaries-section {
            text-align: center;
        }

        .visionaries-label {
            color: var(--text-muted);
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 10px;
            display: block;
        }

        .visionaries-title {
            font-size: 42px;
            font-weight: 600;
            margin-bottom: 60px;
        }

        .founders-grid-top {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            margin-bottom: 40px;
        }

        .founders-grid-bottom {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .founder-card {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .founder-img {
            width: 100%;
            aspect-ratio: 4/5;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 20px;
            background-color: #1a1a1c;
        }

        .founder-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .founder-role {
            color: var(--accent-yellow);
            font-size: 11px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    
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

        <section class="visionaries-section">
            <span class="visionaries-label">THE VISIONARIES</span>
            <h2 class="visionaries-title">Our Co-Founders</h2>

            <div class="founders-grid-top">
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/assets/img/julian.jpg" alt="Julian Vance" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Julian+Vance&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Julian Vance</h4>
                    <span class="founder-role">CREATIVE DIRECTOR</span>
                </div>
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/assets/img/elena.jpg" alt="Elena Moretti" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Elena+Moretti&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Pragun Bhattarai</h4>
                    <span class="founder-role">CHIEF OPERATIONS</span>
                </div>
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/assets/img/marcus.jpg" alt="Marcus Thorne" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Marcus+Thorne&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Marcus Thorne</h4>
                    <span class="founder-role">TECHNICAL LEAD</span>
                </div>
            </div>

            <div class="founders-grid-bottom">
                <div class="founder-card" style="width: 250px;">
                    <img src="${pageContext.request.contextPath}/assets/img/sasha.jpg" alt="Sasha Chen" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Sasha+Chen&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Sasha Chen</h4>
                    <span class="founder-role">EXPERIENCE DESIGNER</span>
                </div>
                <div class="founder-card" style="width: 250px;">
                    <img src="${pageContext.request.contextPath}/assets/img/arthur.jpg" alt="Arthur Sterling" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Arthur+Sterling&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Arthur Sterling</h4>
                    <span class="founder-role">STRATEGIC VISION</span>
                </div>
            </div>
        </section>

    </main>

    <jsp:include page="Front_Footer.jsp" />

</body>
</html>
