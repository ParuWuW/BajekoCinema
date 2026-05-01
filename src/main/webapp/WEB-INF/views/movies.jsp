<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>

<%-- Temporary Mock Data --%>
<%
    List<String[]> movies = new ArrayList<>();
    movies.add(new String[]{"Neon Shadows", "Sci-Fi • 2h 14m", "Now Showing", "NRs. 45,200", "NRs. 16.00", "https://image.tmdb.org/t/p/w200/5OcsgeHk54J9H2s2bHihA57tXY1.jpg"});
    movies.add(new String[]{"Obsidian", "Sci-Fi • 2h 14m", "Now Showing", "NRs. 45,200", "NRs. 16.00", "https://image.tmdb.org/t/p/w200/n5A7brJCjejceZmHyujwUTVgQNC.jpg"});
    movies.add(new String[]{"The Silent Trail", "Thriller • 2h 05m", "Now Showing", "NRs. 12,800", "NRs. 14.00", "https://image.tmdb.org/t/p/w200/vVpEoPeCGY6171g4x2XQ2kZAYC0.jpg"});
    request.setAttribute("movieList", movies);
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tables.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Phosphor Icons -->
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
</head>
<body>
    <div class="app-container">
        
        <%-- SIDEBAR INCLUDE --%>
        <jsp:include page="sidebar.jsp" />

        <div class="main-container">
            
            <%-- HEADER INCLUDE --%>
            <jsp:include page="header.jsp" />

            <main class="page-content">
                
                <div class="page-header">
                    <div>
                        <h4>Management Overview</h4>
                        <h1>Movie Management</h1>
                    </div>
                    <div class="header-buttons">
                        <button class="btn btn-secondary">
                            Generate Report
                        </button>
                        <button class="btn btn-primary">
                            <i class="ph ph-plus"></i> Add New Movie
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

                <!-- Toolbar (Search & Filters) -->
                <div class="toolbar">
                    <div class="toolbar-search">
                        <i class="ph ph-magnifying-glass"></i>
                        <input type="text" placeholder="Search by title, genre or director...">
                    </div>
                    <div class="toolbar-filters">
                        <button class="btn-filter">
                            <i class="ph ph-faders"></i> Filter
                        </button>
                        <button class="btn-sort">
                            <i class="ph ph-sort-ascending"></i> Sort
                        </button>
                    </div>
                </div>

                <!-- Table -->
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Movie Detail</th>
                                <th>Status</th>
                                <th>Revenue</th>
                                <th>Price Control</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- JSP FOR-EACH LOOP PLACEHOLDER --%>
                            <%-- 
                                <c:forEach var="movie" items="${movieList}">
                            --%>
                            <%
                                List<String[]> listedMovies = (List<String[]>)request.getAttribute("movieList");
                                if(listedMovies != null) {
                                  for(String[] movie : listedMovies) {
                            %>
                            <tr>
                                <td>
                                    <div class="movie-cell">
                                        <img src="<%= movie[5] %>" alt="<%= movie[0] %>" class="movie-img">
                                        <div class="movie-info">
                                            <h5><%= movie[0] %></h5>
                                            <span><%= movie[1] %></span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge badge-showing"><%= movie[2] %></span>
                                </td>
                                <td>
                                    <div class="font-weight-500"><%= movie[3] %></div>
                                </td>
                                <td>
                                    <div class="price-control">
                                        <%= movie[4] %> <i class="ph ph-pencil-simple"></i>
                                    </div>
                                </td>
                                <td>
                                    <div class="actions">
                                        <button title="View"><i class="ph ph-image"></i></button>
                                        <button title="Edit"><i class="ph ph-pencil-simple"></i></button>
                                        <button title="Delete" class="delete"><i class="ph ph-trash"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <%
                                  }
                                }
                            %>
                            <%-- 
                                </c:forEach>
                            --%>
                        </tbody>
                    </table>

                    <div class="table-footer">
                        <span class="showing-text">Showing 1 to 10 of 156 Movies</span>
                        <div class="pagination">
                            <button class="page-btn"><i class="ph ph-caret-left"></i></button>
                            <button class="page-btn active">1</button>
                            <button class="page-btn">2</button>
                            <button class="page-btn">3</button>
                            <button class="page-btn"><i class="ph ph-caret-right"></i></button>
                        </div>
                    </div>
                </div>

            </main>

            <%-- FOOTER INCLUDE --%>
            <jsp:include page="footer.jsp" />

        </div>
    </div>
</body>
</html>
