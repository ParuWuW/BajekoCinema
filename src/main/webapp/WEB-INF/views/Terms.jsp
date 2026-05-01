<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions | Bajeko Cinema</title>
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

        /* Terms & Conditions Specific Styles */
        .terms-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 80px 40px;
        }

        .page-header {
            margin-bottom: 60px;
        }

        .page-label {
            color: #fbbf24;
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
        }

        .page-title {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .page-desc {
            color: var(--text-muted);
            font-size: 16px;
            line-height: 1.6;
            max-width: 600px;
        }

        .terms-block {
            background-color: var(--surface);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 16px;
            padding: 40px;
            margin-bottom: 30px;
            display: flex;
            gap: 30px;
        }

        .block-number {
            font-family: monospace;
            font-size: 32px;
            font-weight: 700;
            color: #fbbf24;
            line-height: 1;
        }

        .block-content {
            flex: 1;
        }

        .block-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .block-title i {
            color: var(--text-muted);
            font-size: 20px;
        }

        .block-text {
            color: var(--text-muted);
            font-size: 15px;
            line-height: 1.6;
        }

        .info-box {
            background-color: #1a1a1c;
            border-radius: 12px;
            padding: 20px;
            margin-top: 20px;
        }

        .info-box h5 {
            color: #fbbf24;
            font-size: 13px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .info-box p {
            color: var(--text-muted);
            font-size: 14px;
            margin-bottom: 0;
        }

        .refund-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 25px;
        }

        .refund-item {
            background-color: #1a1a1c;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.02);
        }

        .pct {
            font-size: 32px;
            font-weight: 700;
            color: #fbbf24;
            display: block;
            margin-bottom: 10px;
        }

        .pct-time {
            color: var(--text-muted);
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .rules-list {
            margin-top: 20px;
            list-style: none;
        }

        .rules-list li {
            position: relative;
            padding-left: 20px;
            margin-bottom: 10px;
            color: var(--text-muted);
            font-size: 14px;
        }

        .rules-list li::before {
            content: '•';
            position: absolute;
            left: 0;
            color: #fbbf24;
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .terms-block {
                flex-direction: column;
                gap: 15px;
            }
            .refund-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    
    <main class="terms-container">
        
        <header class="page-header">
            <span class="page-label">LEGAL AGREEMENT</span>
            <h1 class="page-title">Terms & Conditions</h1>
            <p class="page-desc">By entering the Bajeko Cinema ecosystem, you agree to a standard of mutual respect, securing your uninterrupted luxury experience.</p>
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

    <jsp:include page="Front_Footer.jsp" />

</body>
</html>
