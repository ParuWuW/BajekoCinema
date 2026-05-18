<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bajeko Cinema | Login</title>

<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

<!-- External CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/GlobalUser.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Login.css">
<style>
	a {
		text-decoration: none;
	}
	
	.hero-logo {
	    width: 300px !important;
	    height: auto;
	    object-fit: contain;
	    margin-top: 30px;
	    margin-bottom: 10px;
	}
	.tab.active {
    	color: var(--highlight-cyan);
    	border-bottom: 2px solid var(--highlight-cyan);
	}
	
</style>
</head>
<body>
	<jsp:include page = "../common/Header.jsp"/>
	<div class="page-shell">
		<!-- login area -->
		<main class="hero-section">
			<div class="hero-overlay"></div>

			<section class="login-section">
				<div class="hero-branding">
					<img
						src="${pageContext.request.contextPath}/resources/images/Logo.png"
						alt="Bajeko Cinema Logo" class="hero-logo">
					<p>THE LUMINESCENT GALLERY EXPERIENCE</p>
				</div>

				<div class="login-card">
					<div class="login-tabs">
						<a href="${pageContext.request.contextPath}/login"
							class="tab active">SIGN IN</a> <a
							href="${pageContext.request.contextPath}/register" class="tab">SIGN
							UP</a>
					</div>
					<c:if test="${not empty error}">
						<p style="color: red;">${error}</p>
					</c:if>
					<form action="${pageContext.request.contextPath}/login"
						method="POST" class="login-form">
						<div class="input-group">
							<input type="email" id="email" name="UserEmail" placeholder=" "
								> <label for="email">EMAIL ADDRESS</label>
						</div>

						<div class="input-group">
							<input type="password" id="password" name="Password"
								placeholder=" "> <label for="password">PASSWORD</label>
						</div>

						<div class="forgot-wrap">
							<a href="#">Forgot Password?</a>
						</div>

						<button type="submit" class="signin-btn">SIGN IN</button>

						<p class="terms-text">
							By entering, you agree to our <a
								href="${pageContext.request.contextPath}/termsOfService">Terms
								of Service</a> and <a
								href="${pageContext.request.contextPath}/privacyPolicy">Privacy
								Policy</a>.
						</p>
					</form>
				</div>

				<div class="join-line">
					<span>Don't have an account?</span> <a
						href="${pageContext.request.contextPath}/register">Join the
						Inner Circle</a>
				</div>
			</section>	
		</main>
	</div>

</body>
</html>