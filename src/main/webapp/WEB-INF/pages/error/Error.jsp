<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BajekoCinemas | Error </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css">
<style>

:root {
    --bg-app: #0D0D0D;
    --surface: #131415;
    --surface-light: #1A1A1C;
    --text-main: #ffffff;
    --text-muted: #8e8e93;
    --accent-yellow: #fbbf24;
    --accent-yellow-dark: #d97706;
    --text-primary: #ffffff;
    --text-secondary: #b0b0b8;
    --text-muted: #6b6b75;
    --accent-gold: #d4a017;          
    --accent-gold-light: #e8b92d;    
    --accent-gold-dark: #b8890f;
    --highlight-cyan: #00e5e5;       /* Cyan/Teal for active indicators */
    --highlight-cyan-glow: rgba(0, 229, 229, 0.35);
}

.main {
    min-height: calc(100vh - 80px); /* adjust 80px to your header height */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 1.5rem;
    padding: 3rem 1.5rem;
    background-color: var(--bg-app);
    text-align: center;
}

.error-title {
    font-size: clamp(1.5rem, 4vw, 2.5rem);
    font-weight: 700;
    letter-spacing: 0.08em;
    color: var(--accent-gold);
    text-transform: uppercase;
}

.error-text {
    font-size: 1rem;
    color: var(--text-secondary);
    line-height: 1.75;
    max-width: 520px;
}

.home-btn {
    margin-top: 0.5rem;
    padding: 0.75rem 2rem;
    font-size: 0.95rem;
    font-weight: 600;
    letter-spacing: 0.04em;
    color: var(--bg-app);
    background-color: var(--accent-gold);
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
}

.home-btn:hover {
    background-color: var(--accent-gold-light);
}

.home-btn:active {
    background-color: var(--accent-gold-dark);
    transform: scale(0.97);
}

/* Remove default anchor styling around the button */
.main > a {
    text-decoration: none;
}
</style>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page = "../common/Header.jsp"/>
	
    <!-- MAIN -->
    <section class="main">
    
      <div class="error-text">
        <c:choose>
            <c:when test="${pageContext.errorData.statusCode == 404}">
                Oops! Maybe you got lost. The page you were looking for doesn't exist.<br>
                It might have been renamed, removed, or is temporarily unavailable.
            </c:when>
            <c:otherwise>
                "Uh oh! Our servers are taking a little nap.<br>
                Please refresh the page or check back soon.
            </c:otherwise>
          </c:choose>
      </div>


      <div class="error-title">
        <c:choose>
            <c:when test="${pageContext.errorData.statusCode == 404}">404 - PAGE NOT FOUND</c:when>
            <c:when test="${pageContext.errorData.statusCode == 500}">500 - INTERNAL SERVER ERROR</c:when>
            <c:otherwise>SOMETHING WENT WRONG</c:otherwise>
        </c:choose>
      </div>


      <a href="${pageContext.request.contextPath}/home">
      <button class="home-btn">
        Take me to a safe place
      </button>
      </a>
    </section>
	
	
	
</body>
</html>