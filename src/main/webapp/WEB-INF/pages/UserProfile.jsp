<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - Bajeko Cinema</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/userprofile.css">
</head>
<body>



<div class="profile-wrapper">
    <div class="profile-card">

        <div class="avatar-section">
            <img src="${pageContext.request.contextPath}/${user.image}" alt="Profile Picture" class="avatar-img" />
            <span class="avatar-name">${user.username}</span>
        </div>

        <hr class="divider" />

        <div class="profile-fields">

            <div class="field-group">
                <label class="field-label">Username</label>
                <div class="field-value">${user.username}</div>
            </div>

            <div class="field-group">
                <label class="field-label">Email Address</label>
                <div class="field-value">${user.userEmail}</div>
            </div>

            <div class="field-group">
                <label class="field-label">Phone Number</label>
                <div class="field-value">${user.userPhoneNumber}</div>
            </div>

            <div class="field-group">
                <label class="field-label">Password</label>
                <div class="field-value password-dots">••••••••</div>
            </div>

        </div>

        <div class="profile-actions">
            <a href="editProfile" class="btn btn-primary">Edit Profile</a>
            <a href="logout" class="btn btn-outline">Logout</a>
        </div>

    </div>
</div>


</body>
</html>
