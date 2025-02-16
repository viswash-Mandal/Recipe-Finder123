<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        /* 1st Container - Back Button */
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

        /* 2nd Container - Setting Title */
        .setting-container {
            margin-top: -15%; /* Reduced gap between back arrow and title */
            text-align: center;
        }

        h2 {
            margin-left: -135vh;
            font-size: 30px;
        }

        /* 3rd Container - Change Password Form */
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
            width: 60%; /* Increased width */
            padding: 15px; /* Increased padding */
            background-color: #007bff;
            color: white; /* Changed text color to white */
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 18px;
            height: 50px; /* Increased height */
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- 1st Container - Back Button -->
    <div class="back-container">
        <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
    </div> 

    <!-- 2nd Container - Setting Title -->
    <div class="setting-container">
        <h2>Reset password</h2>
    </div>

    <!-- 3rd Container - Change Password Form -->
    <div class="main-container">
<form action="ResetPasswordServlet" method="post">
    <input type="hidden" name="token" value="<%= request.getParameter("token") %>">
    <div class="form-group">
        <input type="password" id="newPassword" name="newPassword" required placeholder="New Password">
    </div>
    <div class="form-group">
        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm Password">
    </div>
    <div class="btn-container">
        <button type="submit" class="btn">Reset it</button>
    </div>
</form>



    </div>

</body>
</html>