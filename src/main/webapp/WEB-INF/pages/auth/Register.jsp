<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bajeko Cinema | Register</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/GlobalUser.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Register.css">
<style>
	.hero-section {
	    position: relative;
	    min-height: 100vh;
	    background:
	        linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.6)),
	        url("https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=1600&q=80") center center / cover no-repeat;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    padding: 60px 20px 100px;
	}
	.tab-link.active {
	    color: var(--highlight-cyan);
	    border-bottom: 2px solid var(--highlight-cyan);
	}
	.hero-logo {
	    width: 300px !important;
	    height: auto;
	    object-fit: contain;
	    margin-top: 30px;
	    margin-bottom: 10px;
	}
	
	.profile-upload-label {
	    display: block;
	    font-size: 0.72rem;
	    color: var(--highlight-cyan);
	    letter-spacing: 1.5px;
	    margin-bottom: 10px;
	    font-weight: 500;
	}
	
	.profile-upload-box {
	    display: flex;
	    align-items: center;
	    width: 100%;
	    border: 1px dashed rgba(255, 255, 255, 0.22);
	    border-radius: 10px;
	    background: rgba(255, 255, 255, 0.04);
	    transition: border-color 0.25s ease;
	    box-sizing: border-box;
	    margin-bottom: 34px;
	    overflow: hidden;
	}
	
	.profile-upload-box:hover {
	    border-color: var(--highlight-cyan);
	}
	
	.profile-upload-box input[type="file"] {
	    width: 100%;
	    padding: 16px 18px;
	    background: transparent;
	    border: none;
	    color: rgba(255, 255, 255, 0.75);
	    font-size: 0.88rem;
	    cursor: pointer;
	    outline: none;
	}
	
	.profile-upload-box input[type="file"]::file-selector-button {
	    background: rgba(255, 255, 255, 0.08);
	    border: 1px solid rgba(255, 255, 255, 0.2);
	    border-radius: 6px;
	    color: rgba(255, 255, 255, 0.75);
	    font-size: 0.78rem;
	    letter-spacing: 1.5px;
	    padding: 6px 14px;
	    margin-right: 14px;
	    cursor: pointer;
	    transition: 0.2s ease;
	}
	
	.profile-upload-box input[type="file"]::file-selector-button:hover {
	    background: rgba(255, 255, 255, 0.14);
	    border-color: var(--highlight-cyan);
	    color: var(--highlight-cyan);
	}
</style>
</head>
<body>
	<jsp:include page = "../common/Header.jsp"/>
	<div class="page-shell">

		<!-- Main -->
		<main class="hero-section">
			<div class="hero-overlay"></div>

			<section class="register-section">
				<div class="hero-branding">
					<img
						src="${pageContext.request.contextPath}/resources/images/Logo.png"
						alt="Bajeko Cinema Logo" class="hero-logo">
					<p>THE LUMINESCENT GALLERY EXPERIENCE</p>
				</div>

				<div class="register-card">
					<div class="auth-tabs">
						<a href="${pageContext.request.contextPath}/login"
							class="tab-link">SIGN IN</a> <a
							href="${pageContext.request.contextPath}/register"
							class="tab-link active">SIGN UP</a>
					</div>
					<c:if test="${not empty error}">
						<p style="color: red;">${error}</p>
					</c:if>
					<form action="${pageContext.request.contextPath}/register"
						method="POST" class="register-form" enctype="multipart/form-data">
						<div class="input-group">
							<input type="email" id="email" name="UserEmail" placeholder=" ">
							<label for="email">EMAIL ADDRESS</label>
						</div>

						<div class="input-group">
							<input type="text" id="fullName" name="Username" placeholder=" ">
							<label for="fullName">FULL NAME</label>
						</div>

						<div class="input-group">
							<input type="text" id="phone" name="UserPhoneNumber"
								placeholder=" "> <label for="phone">PHONE NUMBER</label>
						</div>

						<div class="input-group">
							<input type="password" id="password" name="Password"
								placeholder=" "> <label for="password">PASSWORD</label>
						</div>
						
						<p class="profile-upload-label">PROFILE PICTURE</p>
						<div class="profile-upload-box">
						    <input type="file" id="profilePicture" name="image" accept="image/*">
						</div>

						<button type="submit" class="signup-btn">SIGN UP</button>

						<!-- image -->

						<p class="terms-text">
							By entering, you agree to our <a
								href="${pageContext.request.contextPath}/termsOfService">Terms
								of Service</a> and <a
								href="${pageContext.request.contextPath}/privacyPolicy">Privacy
								Policy</a>.
						</p>
					</form>
				</div>

				<div class="bottom-link">
					<span>Already have an account?</span> <a
						href="${pageContext.request.contextPath}/login">Log in</a>
				</div>
			</section>
		</main>

	</div>

</body>
</html>