<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions | Bajeko Cinema</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Front-base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Terms.css">
</head>
<body>
    <jsp:include page = "../common/Header.jsp"/>
    <main class="terms-container">
        
        <header class="terms-header">
            <span class="terms-label">LEGAL AGREEMENT</span>
            <h1 class="terms-title">Terms & Conditions</h1>
            <p class="terms-desc">By entering the Bajeko Cinema ecosystem, you agree to a standard of mutual respect, securing your uninterrupted luxury experience.</p>
        </header>

        <section class="terms-content">
            
            <!-- Block 01 -->
            <div class="terms-block">
                <div class="block-number">01</div>
                <div class="block-content">
                    <h2 class="block-title">Booking Policy <i class="fa-solid fa-ticket"></i></h2>
                    <p class="block-text">All reservations made via the Bajeko interface are considered definitive. Digital tickets are strictly non-transferable and must be accompanied by a valid secondary ID upon entry.</p>
                    
                    <div class="info-box">
                        <h5>Late Arrivals</h5>
                        <p>To ensure total immersion, entry is barred 15 minutes post-screening commencement.</p>
                    </div>
                </div>
            </div>

            <!-- Block 02 -->
            <div class="terms-block">
                <div class="block-number">02</div>
                <div class="block-content">
                    <h2 class="block-title">Ticket Cancellations <i class="fa-solid fa-arrow-rotate-left"></i></h2>
                    <p class="block-text">We process automated reimbursements directly to your initial payment method according to the following escalating penalty timeframe:</p>
                    
                    <div class="refund-grid">
                        <div class="refund-item">
                            <span class="pct">100%</span>
                            <span class="pct-time">24 HOURS PRIOR</span>
                        </div>
                        <div class="refund-item">
                            <span class="pct">75%</span>
                            <span class="pct-time">12 HOURS PRIOR</span>
                        </div>
                        <div class="refund-item">
                            <span class="pct">0%</span>
                            <span class="pct-time">POST 12 HOURS</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Block 03 -->
            <div class="terms-block">
                <div class="block-number">03</div>
                <div class="block-content">
                    <h2 class="block-title">Theater Conduct <i class="fa-solid fa-clapperboard"></i></h2>
                    <p class="block-text">The prestige of the Bajeko Experience relies on the atmosphere. Violations of conduct result in immediate expulsion without remittance.</p>
                    
                    <ul class="rules-list">
                        <li>Strict zero-tolerance policy on recording devices.</li>
                        <li>Digital devices must be set to 'Luminescent-Off' mode.</li>
                        <li>Auditorium seating limits must be respected at all times.</li>
                    </ul>
                </div>
            </div>

            <!-- Block 04 -->
            <div class="terms-block">
                <div class="block-number">04</div>
                <div class="block-content">
                    <h2 class="block-title">Membership Perquisites <i class="fa-solid fa-star"></i></h2>
                    <p class="block-text">Loyalty tiers and associated points within the digital concierge are managed at the sole discretion of the administration and hold no extraneous cash value.</p>
                </div>
            </div>

        </section>

    </main>

    <jsp:include page="../common/Footer.jsp" />

</body>
</html>
