<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bajeko Cinema | Register</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Register.css">
</head>
<body>

<div class="page-shell">
	<jsp:include page="Header.jsp"/>

    <!-- Main -->
    <main class="hero-section">
        <div class="hero-overlay"></div>

        <section class="register-section">
            <div class="hero-branding">
                <img src="images/logo.png" alt="Bajeko Cinema Logo" class="hero-logo">
                <h1>BAJEKO <span>Cinema</span></h1>
                <p>THE LUMINESCENT GALLERY EXPERIENCE</p>
            </div>

            <div class="register-card">
                <div class="auth-tabs">
                    <a href="login.jsp" class="tab-link">SIGN IN</a>
                    <a href="register.jsp" class="tab-link active">SIGN UP</a>
                </div>

                <form action="${pageContext.request.contextPath}/register" method="POST" class="register-form" enctype="multipart/form-data">
                    <div class="input-group">
					    <input type="email" id="email" name="UserEmail" placeholder=" ">
					    <label for="email">EMAIL ADDRESS</label>
					</div>
					
					<div class="input-group">
					    <input type="text" id="fullName" name="Username" placeholder=" ">
					    <label for="fullName">FULL NAME</label>
					</div>
					
					<div class="input-group">
					    <input type="text" id="phone" name="UserPhoneNumber" placeholder=" ">
					    <label for="phone">PHONE NUMBER</label>
					</div>
					
					<div class="input-group">
					    <input type="file" id="profilePicture" name="UserProfilePicture" placeholder=" ">
					    <label for="profilePicture">Profile Picture</label>
					</div>
					
					<div class="input-group">
					    <input type="password" id="password" name="Password" placeholder=" ">
					    <label for="password">PASSWORD</label>
					</div>

                    <button type="submit" class="signup-btn">SIGN UP</button>
                    
                    <!-- image -->

                    <p class="terms-text">
                        By entering, you agree to our
                        <a href="#">Terms of Service</a>
                        and
                        <a href="#">Privacy Policy</a>.
                    </p>
                </form>
            </div>

            <div class="bottom-link">
                <span>Already have an account?</span>
                <a href="login.jsp">Log in</a>
            </div>
        </section>
    </main>

    <jsp:include page="Footer.jsp"/>

</div>

</body>
</html>