<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Support - FAQs | Bajeko Cinema</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   	 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Faq.css">
</head>
<body>
    <jsp:include page = "../common/Header.jsp"/>
    <main class="faq-container">
        
        <header class="faq-header">
            <h1 class="faq-title">Curated <span>Assistance</span></h1>
            <p class="faq-desc">Experience the digital concierge. Detailed guidance for your cinematic journey at Bajeko Cinema.</p>
        </header>

        <h2 class="category-title"><i class="fa-solid fa-ticket"></i> Booking & Tickets</h2>

        <div class="faq-list">
            
            <div class="faq-card">
                <div class="faq-question">
                    <h4>How do I access my digital concierge tickets?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </div>
                <div class="faq-answer">
                    <p>Your digital tickets are available immediately after booking in the "My Screenings" section. You will also receive an encrypted editorial pass via email with a QR code for seamless theater entry.</p>
                </div>
            </div>

            <div class="faq-card">
                <div class="faq-question">
                    <h4>Can I modify my seating arrangement after booking?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </div>
                <div class="faq-answer">
                    <p>Modifications are permitted up to 4 hours before the screening. Simply navigate to your booking details and select 'Relocate Seat' to view real-time availability in the auditorium.</p>
                </div>
            </div>

            <div class="faq-card">
                <div class="faq-question">
                    <h4>What is the policy for premium private screenings?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </div>
                <div class="faq-answer">
                    <p>Private screenings require a 72-hour notice. Our event concierge will coordinate the technical specs and catering menu once your initial deposit is confirmed.</p>
                </div>
            </div>

        </div>

    </main>

    <jsp:include page="../common/Footer.jsp" />

</body>
</html>
