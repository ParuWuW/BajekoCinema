<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Error </title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/GlobalUser.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Error.css">
</head>
<body>
	<!-- HEADER -->
	<jsp:include page = "../common/Header.jsp"/>
	
    <!-- MAIN -->
    <section class="main">
    
      <div class="error-title">
        <c:choose>
            <c:when test="${pageContext.errorData.statusCode == 404}">404 - PAGE NOT FOUND</c:when>
            <c:when test="${pageContext.errorData.statusCode == 500}">500 - INTERNAL SERVER ERROR</c:when>
            <c:otherwise>SOMETHING WENT WRONG</c:otherwise>
        </c:choose>
      </div>
    
      <div class="error-text">
        <c:choose>
            <c:when test="${pageContext.errorData.statusCode == 404}">
                Oops! Maybe you got lost. The page you were looking for doesn't exist.<br>
                It might have been renamed, removed, or is temporarily unavailable.
            </c:when>
            <c:otherwise>
                Uh oh! Our servers are taking a little nap.<br>
                Please refresh the page or check back soon.
            </c:otherwise>
          </c:choose>
      </div>

      <a href="${pageContext.request.contextPath}/home">
      <button class="home-btn">
        Take me to a safe place
      </button>
      </a>
    </section>
	
	
	<jsp:include page = "../common/Footer.jsp"/>
	
</body>
</html>