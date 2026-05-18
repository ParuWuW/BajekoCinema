<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/userprofile.css">
    <style>
    a {
    text-decoration:none;}
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/pages/common/Header.jsp" />


<div class="profilepage-wrapper">
    <div class="profile-card">

        <div class="avatar-section">
            <img src="${pageContext.request.contextPath}/${user.image}" alt="Profile Picture" class="avatar-img" id="previewImg"/>
            <span class="avatar-name">${user.fullName}</span>
        </div>

        <hr class="divider" />

        <%-- Only one of these ever shows at a time --%>
        <c:if test="${not empty successMessage}">
            <div class="success-msg">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="error-msg">${errorMessage}</div>
        </c:if>

        <%-- VIEW MODE --%>
        <div id="viewMode">
            <div class="profile-fields">
                <div class="field-group">
                    <label class="field-label">Username</label>
                    <div class="field-value">${user.fullName}</div>
                </div>
                <div class="field-group">
                    <label class="field-label">Email Address</label>
                    <div class="field-value">${user.email}</div>
                </div>
                <div class="field-group">
                    <label class="field-label">Phone Number</label>
                    <div class="field-value">${user.phone}</div>
                </div>
                <div class="field-group">
                    <label class="field-label">Password</label>
                    <div class="field-value password-dots">••••••••</div>
                </div>
            </div>
            <div class="profile-actions">
                <button onclick="toggleEdit()" class="btn btn-primary">Edit Profile</button>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline">Logout</a>
            </div>
        </div>

        <%-- EDIT MODE --%>
        <div id="editMode" style="display: none;">
            <form action="${pageContext.request.contextPath}/userProfile"
                  method="post"
                  enctype="multipart/form-data">
                <div class="profile-fields">
                    <div class="field-group form-group">
                        <label class="field-label">Full Name</label>
                        <input type="text" name="fullName" value="${user.fullName}" required />
                    </div>
                    <div class="field-group form-group">
                        <label class="field-label">Email Address</label>
                        <input type="email" name="email" value="${user.email}" required />
                    </div>
                    <div class="field-group form-group">
                        <label class="field-label">Phone Number</label>
                        <input type="tel" name="phone" value="${user.phone}" />
                    </div>
                    <div class="field-group form-group">
                        <label class="field-label">New Password</label>
                        <input type="password" name="password" placeholder="Leave blank to keep current" />
                    </div>
                    <div class="field-group form-group">
                        <label class="field-label">Profile Picture</label>
                        <input type="file" name="image" accept="image/*" onchange="previewImage(this)" />
                    </div>
                </div>
                <div class="profile-actions">
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                    <button type="button" onclick="toggleEdit()" class="btn btn-outline">Cancel</button>
                </div>
            </form>
        </div>

    </div>
</div>

<script>
    // Open edit mode if servlet forwarded back due to an error
    var openEdit = "${not empty showEdit}";
    if (openEdit === "true") {
        document.getElementById('viewMode').style.display = 'none';
        document.getElementById('editMode').style.display = 'block';
    }

    function toggleEdit() {
        var view = document.getElementById('viewMode');
        var edit = document.getElementById('editMode');
        if (edit.style.display === 'none') {
            view.style.display = 'none';
            edit.style.display = 'block';
        } else {
            view.style.display = 'block';
            edit.style.display = 'none';
        }
    }

    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('previewImg').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
