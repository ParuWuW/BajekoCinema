<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy | Bajeko Cinema</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/GlobalUser.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Privacy.css">
</head>
<body>
    <jsp:include page = "../common/Header.jsp"/>
    <main class="privacy-container">
        
        <header class="privacy-header">
            <h1 class="privacy-title">Privacy Policy</h1>
            <p class="privacy-desc">At Bajeko Cinema, your privacy is our premiere priority. This policy outlines how we curate and protect your digital footprint within our cinematic ecosystem.</p>
            <div class="privacy-meta">LAST UPDATED: APRIL 2026</div>
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
                    <img src="${pageContext.request.contextPath}/resources/images/theatre.png" alt="Dark Cinema Seats" style="filter: grayscale(80%) brightness(0.6);">
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

    <jsp:include page="../common/Footer.jsp" />

</body>
</html>
