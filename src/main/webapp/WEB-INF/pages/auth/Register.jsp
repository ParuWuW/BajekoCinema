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
	    margin-bottom: 20px;
	    font-weight: 500;
	}
	
	.profile-upload-box {
	    display: flex;
	    align-items: center;
	    gap: 14px;
	    width: 100%;
	    border: 1px dashed rgba(255, 255, 255, 0.22);
	    border-radius: 10px;
	    padding: 16px 18px;
	    cursor: pointer;
	    background: rgba(255, 255, 255, 0.04);
	    transition: border-color 0.25s ease;
	    box-sizing: border-box;
	    margin-bottom: 34px;
	}
	
	.profile-upload-box:hover {
	    border-color: rgba(var(--highlight-cyan-rgb), 0.5);
	    border-color: var(--highlight-cyan);
	    opacity: 0.7;
	}
	
	.profile-upload-avatar {
	    width: 44px;
	    height: 44px;
	    border-radius: 50%;
	    background: rgba(255, 255, 255, 0.08);
	    border: 1px solid rgba(255, 255, 255, 0.15);
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-shrink: 0;
	}
	
	.profile-upload-avatar i {
	    font-size: 20px;
	    color: rgba(255, 255, 255, 0.45);
	}
	
	.profile-upload-text p:first-child {
	    margin: 0;
	    font-size: 0.88rem;
	    color: rgba(255, 255, 255, 0.75);
	    font-weight: 500;
	}
	
	.profile-upload-text p:last-child {
	    margin: 4px 0 0;
	    font-size: 0.72rem;
	    color: rgba(255, 255, 255, 0.38);
	    letter-spacing: 0.5px;
	}
	
	.profile-upload-icon {
	    font-size: 18px;
	    color: rgba(255, 255, 255, 0.3);
	    margin-left: auto;
	}
	
	.profile-upload-hint {
	    font-size: 0.72rem;
	    color: rgba(255, 255, 255, 0.28);
	    text-align: center;
	    margin: -20px 0 34px;
	    letter-spacing: 0.3px;
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
						<label for="profilePicture" class="profile-upload-box">
						    <div class="profile-upload-avatar">
						        <i class="fa-regular fa-user"></i>
						    </div>
						    <div class="profile-upload-text">
						        <p>Choose a photo</p>
						        <p>JPG, PNG or GIF · Max 5 MB</p>
						    </div>
						    <i class="fa-regular fa-upload profile-upload-icon"></i>
						</label>
						<input type="file" id="profilePicture" name="image" accept="image/*" style="display: none;">

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