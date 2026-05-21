<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <style>
        .verified-checkbox {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: var(--primary, #e63946);
        }
    </style>
</head>
<body>
    <div class="app-container">

        <%-- SIDEBAR INCLUDE --%>
        <jsp:include page="../common/SidebarAdmin.jsp" />

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
                                <th>Role</th>
                                <th>Verified</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty userList}">
                                    <c:forEach var="u" items="${userList}">
                                        <tr>
                                            <td>${u.userID}</td>
                                            <td>${u.fullName}</td>
                                            <td>${u.email}</td>
                                            <td>${not empty u.phone ? u.phone : 'N/A'}</td>
                                            <td>${u.role}</td>
                                            <td>
                                                <form method="post"
                                                      action="${pageContext.request.contextPath}/admin/users"
                                                      style="display:inline;">
                                                    <input type="hidden" name="action" value="updateVerified">
                                                    <input type="hidden" name="userID" value="${u.userID}">
                                                    <input type="checkbox"
                                                           name="isVerified"
                                                           class="verified-checkbox"
                                                           ${u.verified ? 'checked' : ''}
                                                           onchange="this.form.submit()">
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6" style="text-align:center; padding:30px; color: var(--text-muted);">
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
            <jsp:include page="../common/FooterAdmin.jsp" />

        </div>
    </div>
</body>
</html>