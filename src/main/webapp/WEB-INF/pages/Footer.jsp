<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<footer>
    <div class="footer-content" style="display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 40px;">
        <div class="footer-logo">
            <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Bajeko Cinema Logo" style="height: 60px;">
        </div>

        <div class="footer-col">
            <h5 style="font-size: 12px; color: var(--text-main); letter-spacing: 1px; margin-bottom: 20px; text-transform: uppercase; font-weight: 600;">About</h5>
            <ul style="list-style: none; padding: 0;">
                <li style="margin-bottom: 12px;"><a href="${pageContext.request.contextPath}/About" style="color: var(--text-muted); text-decoration: none; font-size: 13px; transition: color 0.3s ease;">ABOUT US</a></li>
                <li style="margin-bottom: 12px;"><a href="${pageContext.request.contextPath}/Privacy" style="color: var(--text-muted); text-decoration: none; font-size: 13px; transition: color 0.3s ease;">PRIVACY POLICY</a></li>
                <li style="margin-bottom: 12px;"><a href="${pageContext.request.contextPath}/Terms" style="color: var(--text-muted); text-decoration: none; font-size: 13px; transition: color 0.3s ease;">TERMS AND CONDITIONS</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h5 style="font-size: 12px; color: var(--text-main); letter-spacing: 1px; margin-bottom: 20px; text-transform: uppercase; font-weight: 600;">Help & Support</h5>
            <ul style="list-style: none; padding: 0;">
                <li style="margin-bottom: 12px;"><a href="${pageContext.request.contextPath}/Faq" style="color: var(--text-muted); text-decoration: none; font-size: 13px; transition: color 0.3s ease;">FAQS</a></li>
                <li style="margin-bottom: 12px;"><a href="${pageContext.request.contextPath}/Contact" style="color: var(--text-muted); text-decoration: none; font-size: 13px; transition: color 0.3s ease;">CONTACT US</a></li>
            </ul>
        </div>

        <div class="footer-col" style="text-align: right;">
            <h5 style="color: #fbbf24; font-size: 12px; letter-spacing: 1px; margin-bottom: 20px; text-transform: uppercase; font-weight: 600;">Get Connected</h5>
            <div class="social-icons" style="display: flex; gap: 15px; margin-bottom: 20px; justify-content: flex-end;">
                <a href="#" style="color: var(--text-main); background-color: rgba(255, 255, 255, 0.05); width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; border-radius: 50%; text-decoration: none;"><i class="fa-brands fa-dribbble"></i></a>
                <a href="#" style="color: var(--text-main); background-color: rgba(255, 255, 255, 0.05); width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; border-radius: 50%; text-decoration: none;"><i class="fa-brands fa-instagram"></i></a>
                <a href="#" style="color: var(--text-main); background-color: rgba(255, 255, 255, 0.05); width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; border-radius: 50%; text-decoration: none;"><i class="fa-brands fa-tiktok"></i></a>
                <a href="#" style="color: var(--text-main); background-color: rgba(255, 255, 255, 0.05); width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; border-radius: 50%; text-decoration: none;"><i class="fa-brands fa-facebook-f"></i></a>
            </div>
            <div class="contact-info" style="color: var(--text-muted); font-size: 13px; line-height: 1.6;">
                +977 98254254232<br>
                01 - 5938292
            </div>
        </div>
    </div>
    <div class="footer-bottom" style="text-align: center; padding-top: 20px; border-top: 1px solid rgba(255, 255, 255, 0.05); color: #fbbf24; font-size: 12px;">
        &copy; 2024 BAJEKOCINEMA. THE LUMINESCENT GALLERY EXPERIENCE.
    </div>
</footer>
