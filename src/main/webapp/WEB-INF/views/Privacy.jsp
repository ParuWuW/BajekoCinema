<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy | Bajeko Cinema</title>
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

        /* Privacy Policy Specific Styles */
        .privacy-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 80px 40px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 60px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .page-title {
            font-size: 56px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .page-desc {
            color: var(--text-muted);
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .page-meta {
            font-size: 11px;
            color: #fbbf24;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: 600;
            display: inline-block;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 15px;
        }

        .policy-card {
            background-color: var(--surface);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            padding: 40px;
        }

        .policy-card h3 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .policy-card h3 i {
            color: #fbbf24;
            font-size: 20px;
        }

        .policy-card p {
            color: var(--text-muted);
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .privacy-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 80px;
        }

        .col-left {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .col-right {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .collection-list {
            list-style: none;
        }

        .collection-list li {
            font-size: 14px;
            color: var(--text-muted);
            margin-bottom: 15px;
            display: flex;
            gap: 10px;
            line-height: 1.5;
        }

        .collection-list li i {
            color: #fbbf24;
            margin-top: 3px;
        }

        .collection-list li strong {
            color: var(--text-main);
        }

        .image-card {
            background-color: transparent;
            padding: 0;
            border: none;
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            min-height: 200px;
        }

        .image-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.7;
        }

        .image-quote {
            position: absolute;
            bottom: 20px;
            left: 20px;
            right: 20px;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            text-shadow: 0 2px 4px rgba(0,0,0,0.8);
        }

        .usage-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .usage-item {
            background-color: #1a1a1c;
            border-radius: 12px;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .usage-num {
            color: #fbbf24;
            font-family: monospace;
            font-size: 18px;
            font-weight: 700;
        }

        .usage-text {
            font-size: 14px;
            color: var(--text-main);
        }

        .rights-item {
            margin-bottom: 25px;
        }

        .rights-item:last-child {
            margin-bottom: 0;
        }

        .rights-item h4 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .rights-item p {
            font-size: 13px;
            margin-bottom: 0;
        }

        .third-party-section {
            background-color: var(--surface);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            padding: 40px;
            display: flex;
            gap: 40px;
        }

        .third-party-content {
            flex: 1;
        }

        .third-party-content h3 {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .third-party-content p {
            color: var(--text-muted);
            font-size: 15px;
            line-height: 1.6;
        }

        .third-party-grid {
            flex: 2;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .tp-item {
            background-color: #1a1a1c;
            border-radius: 12px;
            padding: 20px;
        }

        .tp-item h5 {
            font-size: 11px;
            color: var(--text-main);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .tp-item h5 i {
            color: #fbbf24;
            font-size: 14px;
        }

        .tp-item p {
            color: var(--text-muted);
            font-size: 12px;
            line-height: 1.5;
        }

        @media (max-width: 900px) {
            .privacy-grid {
                grid-template-columns: 1fr;
            }
            .third-party-section {
                flex-direction: column;
            }
            .third-party-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    
    <main class="privacy-container">
        
        <header class="page-header">
            <h1 class="page-title">Privacy Policy</h1>
            <p class="page-desc">At Bajeko Cinema, your privacy is our premiere priority. This policy outlines how we curate and protect your digital footprint within our cinematic ecosystem.</p>
            <div class="page-meta">LAST UPDATED: APRIL 2026</div>
        </header>

        <div class="privacy-grid">
            
            <div class="col-left">
                <!-- Information Collection -->
                <div class="policy-card">
                    <h3>Information Collection</h3>
                    <p>We collect data to provide a seamless, bespoke cinematic experience. This includes:</p>
                    
                    <ul class="collection-list">
                        <li>
                            <i class="fa-regular fa-circle-check"></i>
                            <div><strong>Personal Identity:</strong> Full name, email address, and membership tier details for account curation.</div>
                        </li>
                        <li>
                            <i class="fa-regular fa-circle-check"></i>
                            <div><strong>Transaction History:</strong> Ticket bookings, refreshment orders, and luxury suite reservations.</div>
                        </li>
                        <li>
                            <i class="fa-regular fa-circle-check"></i>
                            <div><strong>Device Insights:</strong> IP addresses and browser configurations to optimize theater-grade streaming quality.</div>
                        </li>
                    </ul>
                </div>

                <!-- Data Usage -->
                <div class="policy-card">
                    <h3>Data Usage</h3>
                    <p>We utilize your data to refine the "Bajeko Experience." Your information drives our concierge algorithms to:</p>
                    
                    <div class="usage-list">
                        <div class="usage-item">
                            <span class="usage-num">01</span>
                            <span class="usage-text">Personalize movie recommendations based on genre affinity and viewing patterns.</span>
                        </div>
                        <div class="usage-item">
                            <span class="usage-num">02</span>
                            <span class="usage-text">Streamline seating preferences for your favorite cinematic auditoriums.</span>
                        </div>
                        <div class="usage-item">
                            <span class="usage-num">03</span>
                            <span class="usage-text">Enhance security protocols to prevent unauthorized access to your Bajeko account.</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-right">
                <!-- Compliance -->
                <div class="policy-card" style="padding: 30px 40px;">
                    <h3><i class="fa-solid fa-shield-halved"></i> Compliance</h3>
                    <p style="margin-bottom: 0;">Our practices are strictly aligned with global data protection standards, ensuring your private viewing remains truly private.</p>
                </div>

                <!-- Image Card -->
                <div class="policy-card image-card">
                    <img src="${pageContext.request.contextPath}/assets/img/theatre.png" alt="Dark Cinema Seats" style="filter: grayscale(80%) brightness(0.6);" onerror="this.src='https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=1000&auto=format&fit=crop'">
                    <div class="image-quote">"Privacy is the ultimate luxury."</div>
                </div>

                <!-- Your Rights -->
                <div class="policy-card">
                    <h3>Your Rights</h3>
                    
                    <div class="rights-item">
                        <h4>Right to Access</h4>
                        <p>Request a complete transcript of the data we hold about your profile.</p>
                    </div>
                    
                    <div class="rights-item">
                        <h4>Right to Erasure</h4>
                        <p>Request the permanent deletion of your account and personal history from our servers.</p>
                    </div>
                    
                    <div class="rights-item">
                        <h4>Right to Rectification</h4>
                        <p>Update or correct any inaccuracies in your personal membership record.</p>
                    </div>
                </div>
            </div>

        </div>

        <!-- Third Party Sharing -->
        <div class="third-party-section">
            <div class="third-party-content">
                <h3>Third-Party Sharing</h3>
                <p>We never sell your data to the highest bidder. We only share essential fragments with vetted partners to ensure your evening is flawless.</p>
            </div>
            
            <div class="third-party-grid">
                <div class="tp-item">
                    <h5><i class="fa-regular fa-credit-card"></i> Payment Processors</h5>
                    <p style="color: var(--text-muted); font-size: 12px; margin: 0;">Encrypted gateways for secure booking and concessions purchases.</p>
                </div>
                <div class="tp-item">
                    <h5><i class="fa-regular fa-envelope"></i> Communication</h5>
                    <p style="color: var(--text-muted); font-size: 12px; margin: 0;">Dispatching your digital tickets and exclusive premiere invitations.</p>
                </div>
                <div class="tp-item">
                    <h5><i class="fa-solid fa-chart-line"></i> Analytics</h5>
                    <p style="color: var(--text-muted); font-size: 12px; margin: 0;">Internal auditing to improve the Bajeko Cinema mobile and web platforms.</p>
                </div>
                <div class="tp-item">
                    <h5><i class="fa-solid fa-scale-balanced"></i> Legal Mandates</h5>
                    <p style="color: var(--text-muted); font-size: 12px; margin: 0;">Sharing only when legally compelled by court orders or governing bodies.</p>
                </div>
            </div>
        </div>

    </main>

    <jsp:include page="Front_Footer.jsp" />

</body>
</html>
