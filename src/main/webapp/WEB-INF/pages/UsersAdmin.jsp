<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - User Management</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Components.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Tables.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="app-container">

        <%-- SIDEBAR INCLUDE --%>
        <jsp:include page="SidebarAdmin.jsp" />

        <div class="main-container">

            <main class="page-content">

                <div class="page-header">
                    <div>
                        <h4>System Settings</h4>
                        <h1>User Management</h1>
                    </div>
                </div>

                <!-- Users Table -->
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty userList}">
                                    <c:forEach var="u" items="${userList}">
                                        <tr>
                                            <td>${u.userID}</td>
                                            <td>${u.username}</td>
                                            <td>${u.userEmail}</td>
                                            <td>${u.userPhoneNumber}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" style="text-align:center; padding:30px; color: var(--text-muted);">
                                            No users found.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

            </main>

            <%-- FOOTER INCLUDE --%>
            <jsp:include page="FooterAdmin.jsp" />

        </div>
    </div>

</body>
</html>