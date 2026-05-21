<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BajekoCinema - Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Tables.css?v=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ResponsiveAdmin.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
<div class="app-container">

    <jsp:include page="../common/SidebarAdmin.jsp" />

    <div class="main-container">
        <main class="page-content">

            <%--============================================================
                DEFAULT VIEW — Theatres table + Halls table
            ============================================================--%>
            <c:if test="${empty showAddTheatreForm and empty showEditTheatreForm
                          and empty showTheatrePicker and empty showAddHallForm
                          and empty showEditHallForm}">

                <%-- ── THEATRE TABLE ── --%>
                <div class="page-header">
                    <div>
                        <h4>System Management</h4>
                        <h1>Theatres</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/management?form=add_theatre"
                           class="btn btn-primary">Add Theatre</a>
                    </div>
                </div>

                <div class="dashboard-content"
                     style="margin-top:24px; display:flex; flex-direction:column; flex-grow:0; overflow:hidden; margin-bottom:48px;">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Theatre Name</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty theatreList}">
                                        <c:forEach var="theatre" items="${theatreList}" varStatus="loop">
                                            <tr>
                                                <td>${loop.count}</td>
                                                <td>${theatre.theatreName}</td>
                                                <td>${theatre.address}</td>
                                                <td>${theatre.phone}</td>
                                                <td>${theatre.email}</td>
                                                <td>
                                                    <div class="actions">
                                                        <a href="${pageContext.request.contextPath}/admin/management?form=edit_theatre&theatreID=${theatre.theatreId}"
                                                           class="edit">Edit</a>
                                                        <form method="post"
                                                              action="${pageContext.request.contextPath}/admin/management"
                                                              style="display:inline;">
                                                            <input type="hidden" name="action" value="delete_theatre">
                                                            <input type="hidden" name="theatreID" value="${theatre.theatreId}">
                                                            <button type="submit" class="delete"
                                                                    onclick="return confirm('Delete theatre and all its halls?')">
                                                                Delete
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6" style="text-align:center;padding:30px;color:var(--text-muted);">
                                                No theatres found. Click <strong>Add Theatre</strong> to get started.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

                <%-- ── HALL TABLE ── --%>
                <div class="page-header" style="margin-top:8px;">
                    <div>
                        <h1>Halls</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/management?form=add_hall"
                           class="btn btn-primary">Add Hall</a>
                    </div>
                </div>

                <div class="dashboard-content"
                     style="margin-top:24px; display:flex; flex-direction:column; flex-grow:1; overflow:hidden;">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Hall Name</th>
                                    <th>Theatre</th>
                                    <th>Total Seats</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty hallList}">
                                        <c:forEach var="hall" items="${hallList}" varStatus="loop">
                                            <tr>
                                                <td>${loop.count}</td>
                                                <td>${hall.hallName}</td>
                                                <td>${hall.theatreName}</td>
                                                <td>${hall.totalSeats}</td>
                                                <td>
                                                    <div class="actions">
                                                        <a href="${pageContext.request.contextPath}/admin/management?form=edit_hall&hallID=${hall.hallId}"
                                                           class="edit">Edit</a>
                                                        <form method="post"
                                                              action="${pageContext.request.contextPath}/admin/management"
                                                              style="display:inline;">
                                                            <input type="hidden" name="action" value="delete_hall">
                                                            <input type="hidden" name="hallID" value="${hall.hallId}">
                                                            <button type="submit" class="delete"
                                                                    onclick="return confirm('Delete this hall?')">
                                                                Delete
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="5" style="text-align:center;padding:30px;color:var(--text-muted);">
                                                No halls found. Click <strong>Add Hall</strong> to get started.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

            </c:if>

            <%--============================================================
                ADD THEATRE FORM
            ============================================================--%>
            <c:if test="${showAddTheatreForm}">
                <div class="page-header">
                    <div>
                        <h4>Theatre Management</h4>
                        <h1>Add New Theatre</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/management" class="btn btn-secondary">Back</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/management">
                        <input type="hidden" name="action" value="add_theatre">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Theatre Name</label>
                                <input type="text" class="form-control" name="theatreName"
                                       placeholder="e.g. Civil Mall" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" name="theatreAddress"
                                       placeholder="e.g. Kathmandu" required>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Phone <span style="color:var(--text-muted);font-weight:400;">(optional)</span></label>
                                <input type="text" class="form-control" name="theatrePhone"
                                       placeholder="e.g. 014444444">
                            </div>
                            <div class="form-group">
                                <label>Email <span style="color:var(--text-muted);font-weight:400;">(optional)</span></label>
                                <input type="email" class="form-control" name="theatreEmail"
                                       placeholder="e.g. info@cinema.com">
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Add Theatre</button>
                    </form>
                </div>
            </c:if>

            <%--============================================================
                EDIT THEATRE FORM
            ============================================================--%>
            <c:if test="${showEditTheatreForm}">
                <div class="page-header">
                    <div>
                        <h4>Theatre Management</h4>
                        <h1>Edit Theatre — ${theatreToEdit.theatreName}</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/management" class="btn btn-secondary">Cancel</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/management">
                        <input type="hidden" name="action"    value="update_theatre">
                        <input type="hidden" name="theatreID" value="${theatreToEdit.theatreId}">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Theatre Name</label>
                                <input type="text" class="form-control" name="theatreName"
                                       value="${theatreToEdit.theatreName}" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" name="theatreAddress"
                                       value="${theatreToEdit.address}" required>
                            </div>
                        </div>

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Phone <span style="color:var(--text-muted);font-weight:400;">(optional)</span></label>
                                <input type="text" class="form-control" name="theatrePhone"
                                       value="${theatreToEdit.phone}">
                            </div>
                            <div class="form-group">
                                <label>Email <span style="color:var(--text-muted);font-weight:400;">(optional)</span></label>
                                <input type="email" class="form-control" name="theatreEmail"
                                       value="${theatreToEdit.email}">
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Save Changes</button>
                    </form>
                </div>
            </c:if>

            <%--============================================================
                ADD HALL — STEP 1: PICK A THEATRE
            ============================================================--%>
            <c:if test="${showTheatrePicker}">
                <div class="page-header">
                    <div>
                        <h4>Hall Management</h4>
                        <h1>Add Hall — Select Theatre</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/management" class="btn btn-secondary">Back</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="get"
                          action="${pageContext.request.contextPath}/admin/management">
                        <input type="hidden" name="form" value="add_hall_step2">

                        <div class="form-group">
                            <label>Select Theatre</label>
                            <c:choose>
                                <c:when test="${not empty theatreList}">
                                    <select class="form-control" name="theatreID" required>
                                        <option value="">— choose a theatre —</option>
                                        <c:forEach var="t" items="${theatreList}">
                                            <option value="${t.theatreId}">${t.theatreName} — ${t.address}</option>
                                        </c:forEach>
                                    </select>
                                </c:when>
                                <c:otherwise>
                                    <p style="color:var(--text-muted);">
                                        No theatres exist yet.
                                        <a href="${pageContext.request.contextPath}/admin/management?form=add_theatre">Add a theatre first.</a>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <c:if test="${not empty theatreList}">
                            <button type="submit" class="btn-save">Next →</button>
                        </c:if>
                    </form>
                </div>
            </c:if>

            <%--============================================================
                ADD HALL — STEP 2: FILL HALL DETAILS
            ============================================================--%>
            <c:if test="${showAddHallForm}">
                <div class="page-header">
                    <div>
                        <h4>Hall Management</h4>
                        <h1>Add Hall — ${selectedTheatre.theatreName}</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/management?form=add_hall"
                           class="btn btn-secondary">← Change Theatre</a>
                        <a href="${pageContext.request.contextPath}/admin/management"
                           class="btn btn-secondary">Cancel</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/management">
                        <input type="hidden" name="action"    value="add_hall">
                        <input type="hidden" name="theatreID" value="${selectedTheatreId}">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Hall Name</label>
                                <input type="text" class="form-control" name="hallName"
                                       placeholder="e.g. Hall A" required>
                            </div>
                            <div class="form-group">
                                <label>Total Seats</label>
                                <input type="number" class="form-control" name="hallCapacity"
                                       placeholder="e.g. 120" min="1" required>
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Add Hall</button>
                    </form>
                </div>
            </c:if>

            <%--============================================================
                EDIT HALL FORM
            ============================================================--%>
            <c:if test="${showEditHallForm}">
                <div class="page-header">
                    <div>
                        <h4>Hall Management</h4>
                        <h1>Edit Hall — ${hallToEdit.hallName} (${hallToEdit.theatreName})</h1>
                    </div>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/admin/management" class="btn btn-secondary">Cancel</a>
                    </div>
                </div>

                <div class="modal-content">
                    <form class="modal-body" method="post"
                          action="${pageContext.request.contextPath}/admin/management">
                        <input type="hidden" name="action" value="update_hall">
                        <input type="hidden" name="hallID" value="${hallToEdit.hallId}">

                        <div class="modal-form-row">
                            <div class="form-group">
                                <label>Hall Name</label>
                                <input type="text" class="form-control" name="hallName"
                                       value="${hallToEdit.hallName}" required>
                            </div>
                            <div class="form-group">
                                <label>Total Seats</label>
                                <input type="number" class="form-control" name="hallCapacity"
                                       value="${hallToEdit.totalSeats}" min="1" required>
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Save Changes</button>
                    </form>
                </div>
            </c:if>

        </main>

        <jsp:include page="../common/FooterAdmin.jsp" />
    </div>
</div>
</body>

</html> 