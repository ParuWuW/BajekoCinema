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

        <section class="visionaries-section">
            <span class="visionaries-label">THE VISIONARIES</span>
            <h2 class="visionaries-title">Our Co-Founders</h2>

            <div class="founders-grid-top">
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/assets/resources/images/marcus.jpg" alt="Julian Vance" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Julian+Vance&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Khushi Shrestha</h4>
                    <span class="founder-role">CREATIVE DIRECTOR</span>
                </div>
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/assets/resources/images/marcus.jpg" alt="Elena Moretti" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Elena+Moretti&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Pragun Bhattarai</h4>
                    <span class="founder-role">CHIEF OPERATIONS</span>
                </div>
                <div class="founder-card">
                    <img src="${pageContext.request.contextPath}/assets/resources/images/marcus.jpg" alt="Marcus Thorne" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Marcus+Thorne&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Darsheel Bam</h4>
                    <span class="founder-role">TECHNICAL LEAD</span>
                </div>
            </div>

            <div class="founders-grid-bottom">
                <div class="founder-card" style="width: 250px;">
                    <img src="${pageContext.request.contextPath}/assets/img/sasha.jpg" alt="Sasha Chen" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Sasha+Chen&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Sichu Maharjan</h4>
                    <span class="founder-role">EXPERIENCE DESIGNER</span>
                </div>
                <div class="founder-card" style="width: 250px;">
                    <img src="${pageContext.request.contextPath}/assets/img/arthur.jpg" alt="Arthur Sterling" class="founder-img" onerror="this.src='https://ui-avatars.com/api/?name=Arthur+Sterling&background=1c1d21&color=fff&size=250'">
                    <h4 class="founder-name">Aviyaan Shrestha</h4>
                    <span class="founder-role">STRATEGIC VISION</span>
                </div>
            </div>
        </section>
        

    </main>

    <jsp:include page="../common/Footer.jsp" />

</body>
</html>
