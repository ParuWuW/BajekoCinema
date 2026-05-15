<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Bajeko Cinema</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Contact.css">
      

</head>
<body>
    <c:set var="activePage" value="customerSupport" scope="request" />
    <jsp:include page = "../common/Header.jsp"/>
    <main class="contact-container">
        <div class="contact-content">
            <span class="service-label">BAJEKO SERVICE</span>
            <h1 class="contact-title">The Cinematic<br>Connection.</h1>
            <p class="contact-desc">Whether you're inquiring about private screenings, membership perks, or feedback on your experience, our digital concierge is at your service.</p>
            
            <div class="contact-cards">
                
                <a href="tel:+97798233242324" class="contact-card">
                    <div class="card-icon">
                        <i class="fa-solid fa-phone-volume"></i>
                    </div>
                    <div class="card-info">
                        <span class="card-label">CALL OUR BOX OFFICE</span>
                        <span class="card-value">+977 98233242324</span>
                    </div>
                </a>

                <a href="mailto:bajekohelp@gmail.com" class="contact-card">
                    <div class="card-icon">
                        <i class="fa-regular fa-envelope"></i>
                    </div>
                    <div class="card-info">
                        <span class="card-label">INQUIRY DESK</span>
                        <span class="card-value">bajekohelp@gmail.com</span>
                    </div>
                </a>

            </div>
        </div>
    </main>

    <jsp:include page="../common/Footer.jsp" />

</body>
</html>
