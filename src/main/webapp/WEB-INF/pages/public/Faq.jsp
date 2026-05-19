<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Support - FAQs | Bajeko Cinema</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/GlobalUser.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Faq.css">
</head>
<body>
    <jsp:include page="../common/Header.jsp"/>
    <main class="faq-container">

        <header class="faq-header">
            <h1 class="faq-title">Curated <span>Assistance</span></h1>
            <p class="faq-desc">Experience the digital concierge. Detailed guidance for your cinematic journey at Bajeko Cinema.</p>
        </header>

        <%-- BOOKING & TICKETS --%>
        <h2 class="category-title"><i class="fa-solid fa-ticket"></i> Booking &amp; Tickets</h2>
        <div class="faq-list">

            <div class="faq-card">
                <input type="checkbox" id="faq1" class="faq-toggle" />
                <label class="faq-question" for="faq1">
                    <h4>How do I access my digital concierge tickets?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Your digital tickets are available immediately after booking in the "My Screenings" section of your account dashboard. Each ticket is encrypted with a unique session token tied to your profile, ensuring only you can access it. You will also receive a beautifully formatted confirmation email containing your editorial pass with a scannable QR code for seamless, contactless theater entry. The QR code remains valid from the moment of booking until 15 minutes after the screening begins, after which it automatically expires for security. If you experience any issues accessing your tickets, our digital concierge team is available 24/7 via live chat to reissue your pass instantly.</p>
                    </div>
                </div>
            </div>

            <div class="faq-card">
                <input type="checkbox" id="faq2" class="faq-toggle" />
                <label class="faq-question" for="faq2">
                    <h4>Can I modify my seating arrangement after booking?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Seat modifications are permitted up to 4 hours before the scheduled screening time, subject to real-time availability in the auditorium. To relocate your seat, navigate to "My Bookings," select the relevant screening, and choose "Relocate Seat" to browse the interactive seating map. Premium seats such as Velvet Recliners and Couple Suites may carry a supplemental upgrade fee if you are moving from a standard tier. Please note that seat changes are limited to one modification per booking to maintain fairness across all guests. If you are part of a group booking, all seat changes must be coordinated under the primary account holder to avoid splitting the reservation.</p>
                    </div>
                </div>
            </div>

            <div class="faq-card">
                <input type="checkbox" id="faq3" class="faq-toggle" />
                <label class="faq-question" for="faq3">
                    <h4>What is the policy for premium private screenings?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Private screenings at Bajeko Cinema offer an exclusive, fully curated cinematic experience for individuals, families, or corporate events. Reservations require a minimum of 72 hours advance notice to allow our event concierge team to prepare the auditorium, arrange technical configurations, and coordinate your preferred catering menu. A refundable deposit of 30% of the total booking value is required at the time of confirmation, with the remaining balance due 24 hours before the event. Cancellations made more than 48 hours in advance receive a full deposit refund; cancellations within 48 hours forfeit the deposit.</p>
                    </div>
                </div>
            </div>

            <div class="faq-card">
                <input type="checkbox" id="faq4" class="faq-toggle" />
                <label class="faq-question" for="faq4">
                    <h4>Can I book tickets for someone else?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Yes, Bajeko Cinema fully supports gifted and proxy bookings. When completing your purchase, simply toggle "Book for a Guest" and enter the recipient's name and email address. The digital ticket and QR code will be dispatched directly to their inbox while the booking remains linked to your account for management purposes. Gift bookings can be scheduled for future dates and wrapped in a complimentary digital gift envelope with a personalized message. For group proxy bookings involving more than 5 guests, please contact our concierge desk directly for coordinated dispatch.</p>
                    </div>
                </div>
            </div>

        </div>

        <%-- PAYMENT --%>
        <h2 class="category-title"><i class="fa-solid fa-credit-card"></i> Payment</h2>
        <div class="faq-list">

            <div class="faq-card">
                <input type="checkbox" id="faq5" class="faq-toggle" />
                <label class="faq-question" for="faq5">
                    <h4>What payment methods are accepted?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Bajeko Cinema accepts a comprehensive range of payment methods to ensure a frictionless checkout experience. You may pay using all major credit and debit cards including Visa, Mastercard, and UnionPay, as well as Nepal's leading digital wallets — eSewa, Khalti, IME Pay, and ConnectIPS. Bank transfers via direct NEFT are also supported for bulk or corporate bookings. All transactions are processed through our PCI-DSS Level 1 certified payment gateway, ensuring your financial data is encrypted end-to-end and never stored on our servers. Cash payments are accepted exclusively at our physical box office counters.</p>
                    </div>
                </div>
            </div>

            <div class="faq-card">
                <input type="checkbox" id="faq6" class="faq-toggle" />
                <label class="faq-question" for="faq6">
                    <h4>How do refunds work if I cancel my booking?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Refunds are processed automatically to your original payment method upon successful cancellation. Cancellations made more than 24 hours before the screening are eligible for a full refund, minus a nominal platform convenience fee of 2%. Cancellations within 24 hours but more than 4 hours before showtime qualify for a 50% refund. Cancellations within 4 hours of the screening are non-refundable, though you may convert the value to a Bajeko Cinema credit valid for 90 days. Refund timelines vary by payment method — digital wallets typically reflect within 1 hour, while card refunds may take 3 to 5 business days depending on your bank.</p>
                    </div>
                </div>
            </div>

            <div class="faq-card">
                <input type="checkbox" id="faq7" class="faq-toggle" />
                <label class="faq-question" for="faq7">
                    <h4>Is my payment information stored securely?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Your financial security is our highest priority. Bajeko Cinema does not store any raw card numbers, CVVs, or banking credentials on its own servers. All sensitive payment data is handled exclusively by our certified third-party payment processors, which comply with the latest PCI-DSS standards and undergo regular independent security audits. When you save a card for faster future checkouts, only a secure encrypted token is retained. You can review and delete your saved payment methods at any time from your account security settings.</p>
                    </div>
                </div>
            </div>

        </div>

        <%-- ACCOUNT --%>
        <h2 class="category-title"><i class="fa-solid fa-user"></i> Account</h2>
        <div class="faq-list">

            <div class="faq-card">
                <input type="checkbox" id="faq8" class="faq-toggle" />
                <label class="faq-question" for="faq8">
                    <h4>How do I reset my password?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Resetting your password is a quick and fully automated process. On the login screen, click "Forgot Password" and enter the email address associated with your Bajeko Cinema account. You will receive a secure, time-limited reset link within 2 minutes. The link expires after 15 minutes for security purposes; if it expires, simply request a new one. Upon clicking the link, you will be directed to a secure page where you can create a new password. We recommend a strong password of at least 12 characters combining uppercase letters, numbers, and symbols. After resetting, all existing sessions on other devices will be automatically signed out to protect your account.</p>
                    </div>
                </div>
            </div>

            <div class="faq-card">
                <input type="checkbox" id="faq9" class="faq-toggle" />
                <label class="faq-question" for="faq9">
                    <h4>How do I update my profile and contact details?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>You can update your profile information at any time by navigating to "My Account" and selecting "Edit Profile." From there you may change your display name, phone number, date of birth, and preferred language. To update your registered email address, an additional verification step is required — a confirmation link will be sent to both your old and new email addresses simultaneously. Profile photos can be uploaded in JPG or PNG format up to 5MB. All profile updates are logged in your activity history, accessible under "Security & Privacy" in your account settings.</p>
                    </div>
                </div>
            </div>

            <div class="faq-card">
                <input type="checkbox" id="faq10" class="faq-toggle" />
                <label class="faq-question" for="faq10">
                    <h4>How do I permanently delete my account?</h4>
                    <i class="fa-solid fa-chevron-down faq-icon"></i>
                </label>
                <div class="faq-answer">
                    <div class="faq-answer-inner">
                        <p>Account deletion is permanent and irreversible. To initiate deletion, go to "My Account," select "Security & Privacy," and click "Delete My Account." You will be asked to confirm your identity via password and a one-time email verification code. Once confirmed, your account enters a 14-day grace period during which it is deactivated but not yet deleted — this allows you to recover it if you change your mind by simply logging back in. After 14 days, all personal data, booking history, saved preferences, and loyalty points are permanently purged from our systems. Any unused cinema credits must be redeemed before initiating deletion as they cannot be recovered afterward.</p>
                    </div>
                </div>
            </div>

        </div>

    </main>
    <jsp:include page="../common/Footer.jsp"/>
</body>
</html>