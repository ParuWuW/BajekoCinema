<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<header class="navbar">
		<div class="nav-container">
			<div class="nav-logo">
				<img
					src="${pageContext.request.contextPath}/resources/images/Logo.png"
					alt="BAJEKO Logo"
					onerror="this.src='https://via.placeholder.com/40x40/FFD700/000000?text=B'">
			</div>

			<nav class="nav-menu">
				<a href="${pageContext.request.contextPath}/home"
					class="nav-link ${activePage == 'home' ? 'active' : ''}">Home</a> <a
					href="${pageContext.request.contextPath}/aboutUs"
					class="nav-link ${activePage == 'aboutUs' ? 'active' : ''}">About
					Us</a> <a href="${pageContext.request.contextPath}/contactUs"
					class="nav-link ${activePage == 'customerSupport' ? 'active' : ''}">Customer
					Support</a>
			</nav>

			<div class="nav-actions">
				<div class="search-bar">
					<i class="fa-solid fa-search"></i> <input type="text"
						placeholder="Search films...">
				</div>

				<c:choose>
					<c:when test="${not empty loggedInUser}">
						<!-- user logged in popup -->
						<div class="profile-wrapper">
							<!-- not clicked just on nav -->
							<button class="profile-btn" id="profileBtn">
								<c:choose>
									<c:when test="${not empty loggedInUser.image}">
										<img src="${loggedInUser.image}" alt="Profile"
											class="profile-photo">
									</c:when>
									<c:otherwise>
										<i class="fa-solid fa-user"></i>
									</c:otherwise>
								</c:choose>
							</button>

							<!-- clicked on profile picture -->

							<div class="profile-popup" id="profilePopup">
								<div class="popup-header">
									<c:choose>
										<c:when test="${not empty loggedInUser.image}">
											<img src="${loggedInUser.image}" alt="Profile"
												class="popup-avatar">
										</c:when>
										<c:otherwise>
											<div class="popup-avatar">
												<i class="fa-solid fa-user"></i>
											</div>
										</c:otherwise>
									</c:choose>
									<span class="popup-name">${loggedInUser.fullName}</span>
								</div>

								<hr class="popup-divider">

								<a href="${pageContext.request.contextPath}/userProfile"
									class="popup-link"> <i class="fa-regular fa-user"></i> View
									Profile
								</a> <a href="${pageContext.request.contextPath}/logout"
									class="popup-link popup-logout"> <i
									class="fa-solid fa-right-from-bracket"></i> Logout
								</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- user not logged in, direct to login-->
						<a href="${pageContext.request.contextPath}/login"
							class="profile-btn"> <i class="fa-solid fa-user"></i>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>



	</header>
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		const btn = document.getElementById("profileBtn");
		const popup = document.getElementById("profilePopup");
		
		console.log("btn:", btn);
        console.log("popup:", popup);

		if (btn && popup) {
			
			//document.body.appendChild(popup); //moving popup outside nav
			
			btn.addEventListener('click', function(e) {
				e.stopPropagation(); //like break in switch case
				
				console.log("btn clicked!");
                console.log("popup classes before:", popup.className);
				
				const rect = btn.getBoundingClientRect();
	            popup.style.top = (rect.bottom + 10) + 'px';
	            popup.style.right = (window.innerWidth - rect.right) + 'px';
	            
				popup.classList.toggle('show');
				console.log("popup classes after:", popup.className);
			});

			document.addEventListener('click', function(e) {
	            // Don't close if clicking inside the popup itself
	            if (!popup.contains(e.target) && !btn.contains(e.target)) {
	                popup.classList.remove('show');
	                console.log("closed");
	            }
			});
		}
	});
</script>
