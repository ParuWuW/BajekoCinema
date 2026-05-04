<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Bajeko Cinema</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        /* Contact Us Specific Styles */
        .contact-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 120px 40px;
            display: flex;
            justify-content: flex-start;
            position: relative;
        }

        .contact-container::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 40%;
            transform: translate(-50%, -50%);
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(251, 191, 36, 0.05) 0%, rgba(0, 0, 0, 0) 70%);
            z-index: -1;
            pointer-events: none;
        }

        .contact-content {
            max-width: 600px;
        }

        .service-label {
            color: #fbbf24;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-bottom: 20px;
            display: block;
        }

        .contact-title {
            font-size: 64px;
            font-weight: 700;
            line-height: 1.1;
            margin-bottom: 30px;
        }

        .contact-desc {
            color: var(--text-muted);
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 60px;
            max-width: 450px;
            margin-left: 40px;
        }

        .contact-cards {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .contact-card {
            background-color: #1a1a1c;
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 16px;
            padding: 30px;
            display: flex;
            align-items: center;
            gap: 25px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .contact-card:hover {
            background-color: var(--surface-light);
            border-color: rgba(251, 191, 36, 0.3);
            transform: translateY(-2px);
        }

        .card-icon {
            width: 50px;
            height: 50px;
            background-color: rgba(255, 255, 255, 0.03);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: #fbbf24;
            flex-shrink: 0;
        }

        .card-info {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .card-label {
            color: var(--text-muted);
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .card-value {
            color: var(--text-main);
            font-size: 20px;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .contact-title {
                font-size: 48px;
            }
            .contact-desc {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <c:set var="activePage" value="customerSupport" scope="request" />
    <jsp:include page = "Header.jsp"/>
    
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

    <jsp:include page="Footer.jsp" />

</body>
</html>
