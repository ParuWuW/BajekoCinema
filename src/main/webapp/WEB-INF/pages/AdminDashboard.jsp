<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page isELIgnored = "false" %>

<%-- Temporary Mock Data for Bookings --%>
<%
    List<String[]> bookings = new ArrayList<>();
    bookings.add(new String[]{"EM", "purple", "Ram Tori", "Chakka Panja", "Oct 24, 19:45", "NRs. 24.00", "CONFIRMED", "badge-confirmed"});
    bookings.add(new String[]{"JS", "blue", "Darsheel Bomb", "Avengers First Game", "Oct 24, 21:15", "NRs. 18.50", "CANCELLED", "badge-cancelled"});
    bookings.add(new String[]{"AK", "green", "Prashun Padka", "Wai Wai Quicks", "Oct 23, 18:00", "NRs. 32.00", "CONFIRMED", "badge-confirmed"});
    bookings.add(new String[]{"DB", "gray", "Bungo Neupane", "Balen Shah", "Oct 23, 22:30", "NRs. 15.00", "PENDING", "badge-pending"});
    request.setAttribute("bookingList", bookings);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - Admin Dashboard</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/components.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tables.css">
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
                        <h4>Management Overview</h4>
                        <h1>Admin Dashboard</h1>
                    </div>
                    <div class="header-buttons">
                        <button class="btn btn-secondary">
                            Generate Report
                        </button>
                    </div>
                </div>

                <!-- Metrics Grid -->
                <div class="metrics-grid">
                    <div class="metric-card">
                        <div class="metric-header">
                            <div class="metric-icon yellow">
                                <i class="ph ph-money"></i>
                            </div>
                            <span class="trend up">+12.5%</span>
                        </div>
                        <div class="metric-label">Total Revenue</div>
                        <div class="metric-value">NRs. 142,850.00</div>
                    </div>

                    <div class="metric-card">
                        <div class="metric-header">
                            <div class="metric-icon cyan">
                                <i class="ph ph-ticket"></i>
                            </div>
                            <span class="trend up">+5.2%</span>
                        </div>
                        <div class="metric-label">Tickets Sold</div>
                        <div class="metric-value">12,402</div>
                    </div>

                    <div class="metric-card">
                        <div class="metric-header">
                            <div class="metric-icon blue">
                                <i class="ph ph-users"></i>
                            </div>
                            <span class="trend down">-2.1%</span>
                        </div>
                        <div class="metric-label">Active Users</div>
                        <div class="metric-value">8,920</div>
                    </div>

                    <div class="metric-card">
                        <div class="metric-header">
                            <div class="metric-icon purple">
                                <i class="ph ph-trend-up"></i>
                            </div>
                            <span class="trend up">+18.7%</span>
                        </div>
                        <div class="metric-label">Occupancy Rate</div>
                        <div class="metric-value">76.4%</div>
                    </div>
                </div>

                <!-- Recent Bookings Section -->
                <div class="dashboard-content" style="margin-top: 24px;">
                    <div class="section-title" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
                        <h2 style="font-size: 20px; font-weight: 600;">Recent Bookings</h2>
                        <a href="#" style="color: var(--accent-cyan); font-size: 12px; font-weight: 700; text-transform: uppercase; text-decoration: none; letter-spacing: 1px;">VIEW ALL</a>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>User</th>
                                    <th>Movie Title</th>
                                    <th>Date/Time</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- JSP FOR-EACH LOOP PLACEHOLDER --%>
                                <%
                                    List<String[]> listedBookings = (List<String[]>)request.getAttribute("bookingList");
                                    if(listedBookings != null) {
                                      for(String[] b : listedBookings) {
                                %>
                                <tr>
                                    <td>
                                        <div class="movie-cell">
                                            <div class="user-avatar <%= b[1] %>"><%= b[0] %></div>
                                            <div class="user-info">
                                                <span><%= b[2] %></span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="user-info">
                                            <span><%= b[3] %></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="user-info" style="color: var(--text-muted); font-size: 14px;">
                                            <%= b[4] %>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="font-weight: 600;"><%= b[5] %></div>
                                    </td>
                                    <td><span class="badge <%= b[7] %>"><%= b[6] %></span></td>
                                </tr>
                                <%
                                      }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>

            <%-- FOOTER INCLUDE --%>
            <jsp:include page="FooterAdmin.jsp" />

        </div>
    </div>
</body>
</html>
