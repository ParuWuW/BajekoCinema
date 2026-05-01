<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>

<%-- Temporary Mock Data for Users --%>
<%
    List<String[]> users = new ArrayList<>();
    users.add(new String[]{"JD", "purple", "John Doe", "john.doe@example.com", "System Admin", "ACTIVE", "badge-showing"});
    users.add(new String[]{"AS", "blue", "Alice Smith", "alice.smith@example.com", "Manager", "ACTIVE", "badge-showing"});
    users.add(new String[]{"BW", "gray", "Bob Wilson", "bob.wilson@example.com", "Staff", "INACTIVE", "badge-pending"});
    request.setAttribute("userList", users);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - User Management</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/components.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tables.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
</head>
<body>
    <div class="app-container">
        
        <%-- SIDEBAR INCLUDE --%>
        <jsp:include page="SidebarAdmin.jsp" />

        <div class="main-container">
            
            <%-- HEADER INCLUDE --%>
            <jsp:include page="HeaderAdmin.jsp" />

            <main class="page-content">
                
                <div class="page-header">
                    <div>
                        <h4>System Settings</h4>
                        <h1>User Management</h1>
                    </div>
                    <div class="header-buttons">
                        <button class="btn btn-primary"><i class="ph ph-user-plus"></i> Add New User</button>
                    </div>
                </div>

                <!-- Toolbar (Search & Filters) -->
                <div class="toolbar" style="margin-top: 32px;">
                    <div class="toolbar-search">
                        <i class="ph ph-magnifying-glass"></i>
                        <input type="text" placeholder="Search by name, email or role...">
                    </div>
                    <div class="toolbar-filters">
                        <button class="btn-filter"><i class="ph ph-faders"></i> Filter Role</button>
                    </div>
                </div>

                <!-- Users Table -->
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>User Info</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- JSP FOR-EACH LOOP PLACEHOLDER --%>
                            <%
                                List<String[]> userList = (List<String[]>)request.getAttribute("userList");
                                if(userList != null) {
                                  for(String[] u : userList) {
                            %>
                            <tr>
                                <td>
                                    <div class="movie-cell">
                                        <div class="user-avatar <%= u[1] %>"><%= u[0] %></div>
                                        <div class="user-info">
                                            <span><%= u[2] %></span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: var(--text-muted);"><%= u[3] %></div>
                                </td>
                                <td>
                                    <div style="font-weight: 600;"><%= u[4] %></div>
                                </td>
                                <td><span class="badge <%= u[6] %>"><%= u[5] %></span></td>
                                <td>
                                    <div class="actions">
                                        <button title="Edit"><i class="ph ph-pencil-simple"></i></button>
                                        <button title="Delete / Disable" class="delete"><i class="ph ph-trash"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <%
                                  }
                                }
                            %>
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
