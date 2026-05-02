<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Support - FAQs | Bajeko Cinema</title>
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

        /* FAQ Specific Styles */
        .faq-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 80px 40px 120px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 80px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .page-title {
            font-size: 56px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .page-title span {
            color: #fbbf24;
        }

        .page-desc {
            color: var(--text-muted);
            font-size: 16px;
            line-height: 1.6;
        }

        .category-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .category-title i {
            color: #fbbf24;
        }

        .faq-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .faq-card {
            background-color: var(--surface);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 12px;
            padding: 30px;
            position: relative;
            transition: background-color 0.3s ease;
        }

        .faq-card:hover {
            background-color: var(--surface-light);
        }

        .faq-question {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            cursor: pointer;
            margin-bottom: 0;
        }

        .faq-question h4 {
            font-size: 18px;
            font-weight: 600;
            color: #fbbf24;
            margin-bottom: 15px;
            padding-right: 40px;
        }

        .faq-icon {
            color: #fbbf24;
            font-size: 14px;
            position: absolute;
            right: 30px;
            top: 35px;
        }

        .faq-answer {
            color: var(--text-muted);
            font-size: 15px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    
    <main class="faq-container">
        
        <header class="page-header">
            <h1 class="page-title">Curated <span>Assistance</span></h1>
            <p class="page-desc">Experience the digital concierge. Detailed guidance for your cinematic journey at Bajeko Cinema.</p>
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

    <jsp:include page="Footer.jsp" />

</body>
</html>
