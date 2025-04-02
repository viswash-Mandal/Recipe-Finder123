<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    HttpSession userSession = request.getSession(false);
    Object userId = (userSession != null) ? userSession.getAttribute("userId") : null;
    String successMessage = request.getParameter("success");
    String errorMessage = request.getParameter("error");

    if (userId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
# change password encrypted with sha256  askjfhygsyufgsui
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        /* Back Button */
        .back-container {
            width: 100%;
            position: absolute;
            top: 10px;
            left: 10px;
        }

        .back-container a {
            text-decoration: none;
            color: black;
            font-size: 22px;
        }

        /* Setting Title */
        .setting-container {
            margin-top: -15%;
            text-align: center;
        }

        h2 {
            font-size: 30px;
        }

        /* Change Password Form */
        .main-container {
            width: 350px;
        }

        h3 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input {
            text-align: center;
            width: 100%;
            padding: 8px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            height: 35px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn {
            width: 60%;
            padding: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 18px;
            height: 50px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        /* POPUP MODAL */
        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 300px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            display: none;
            opacity: 0;
            animation: fadeIn 0.3s forwards;
        }

        .popup h4 {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        .popup.success {
            border-left: 5px solid #28a745;
        }

        .popup.error {
            border-left: 5px solid #dc3545;
        }

        .popup i {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .popup.success i {
            color: #28a745;
        }

        .popup.error i {
            color: #dc3545;
        }

        .popup button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .popup button:hover {
            background: #0056b3;
        }

        /* Smooth Fade In Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translate(-50%, -55%);
            }
            to {
                opacity: 1;
                transform: translate(-50%, -50%);
            }
        }
    </style>
</head>
<body>


    <!-- Setting Title -->
    <div class="setting-container">
        <h2>Setting</h2>
    </div>

    <!-- Change Password Form -->
    <div class="main-container">
        <h3>Change Password</h3>
        <form action="ChangePasswordServlet" method="post">
            <div class="form-group">
                <input type="password" id="currentPassword" name="currentPassword" required placeholder="Current Password">
            </div>
            <div class="form-group">
                <input type="password" id="newPassword" name="newPassword" required placeholder="New Password">
            </div>
            <div class="form-group">
                <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm Password">
            </div>
            <div class="btn-container">
                <button type="submit" class="btn">Change it</button>
            </div>
        </form>
    </div>

    <!-- Success Popup -->
    <div class="popup success" id="successPopup">
        <i class="fas fa-check-circle"></i>
        <h4>Password Changed Successfully</h4>
        <button onclick="closePopup('successPopup')">Close</button>
    </div>

    <!-- Error Popup -->
    <div class="popup error" id="errorPopup">
        <i class="fas fa-times-circle"></i>
        <h4>Password Doesn't Match</h4>
        <button onclick="closePopup('errorPopup')">Close</button>
    </div>

    <script>
        function closePopup(id) {
            document.getElementById(id).style.display = 'none';
        }

        // Show popups if messages exist
        <% if (successMessage != null) { %>
            document.getElementById("successPopup").style.display = "block";
        <% } %>

        <% if (errorMessage != null) { %>
            document.getElementById("errorPopup").style.display = "block";
        <% } %>
    </script>

</body>
</html>
