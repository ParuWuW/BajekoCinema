<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bajeko Cinema | Login</title>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

    <!-- External CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Login.css">
</head>
<body>

    <!-- Page wrapper with cinema background -->
    <div class="page-shell">

        <%--<jsp:include page="Header.jsp">  --%>

        <!-- Main hero/login area -->
        <main class="hero-section">
            <div class="hero-overlay"></div>

            <section class="login-section">
                <div class="hero-branding">
                    <img src="images/logo.png" alt="Bajeko Cinema Logo" class="hero-logo">
                    <h1>BAJEKO <span>Cinema</span></h1>
                    <p>THE LUMINESCENT GALLERY EXPERIENCE</p>
                </div>

                <div class="login-card">
                    <div class="login-tabs">
                        <a href="#" class="tab active">SIGN IN</a>
                        <a href="#" class="tab">SIGN UP</a>
                    </div>

                    <form action="" method="POST" class="login-form">
                        <div class="input-group">
						    <input type="email" id="email" name="UserEmail" placeholder=" " required>
						    <label for="email">EMAIL ADDRESS</label>
						</div>

                        <div class="input-group">
						    <input type="password" id="password" name="Password" placeholder=" " required>
						    <label for="password">PASSWORD</label>
						</div>

                        <div class="forgot-wrap">
                            <a href="#">Forgot Password?</a>
                        </div>

                        <button type="submit" class="signin-btn">SIGN IN</button>

                        <p class="terms-text">
                            By entering, you agree to our
                            <a href="#">Terms of Service</a>
                            and
                            <a href="#">Privacy Policy</a>.
                        </p>
                    </form>
                </div>

                <div class="join-line">
                    <span>Don't have an account?</span>
                    <a href="#">Join the Inner Circle</a>
                </div>
            </section>
        </main>

        <%--<jsp:include page="Footer.jsp" />--%>

    </div>

</body>
</html>