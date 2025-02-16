<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);
    String username = (userSession != null && userSession.getAttribute("username") != null) 
                        ? (String) userSession.getAttribute("username") 
                        : "Guest";

    String profileImage = (userSession != null && userSession.getAttribute("profileImage") != null) 
                        ? (String) userSession.getAttribute("profileImage") 
                        : "logo.png";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        body {
            font-family: 'Capriola', sans-serif;
            background-color: #f9f9f9;
            padding: 0;
            text-align: center;
        }

        .container {
            margin: auto;
            padding: 20px;
        }

        .back-arrow {
            text-align: left;
            padding: 10px;
            font-size: 22px;
        }

        .back-arrow a {
            text-decoration: none;
            color: black;
        }

        .profile-image img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px auto;
            font-size: 40px;
            object-fit: cover;
        }

        .username {
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }

        .menu {
            background: #f0f0f0;
            padding: 37px;
            border-radius: 10px;
            margin-top: 32px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 10px;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .menu-item i {
            margin-right: 10px;
            font-size: 20px;
        }

        .menu-item:hover {
            background: #ddd;
            border-radius: 5px;
        }
        
        .menu-item a {
        	text-decoration: none;
        	color: black;
        }
    </style>
</head>
<body>

<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

<div class="container">
<div class="profile-image">
    <img src="ProfileImageServlet" alt="Profile Image" width="100" height="100" style="border-radius: 50%;">
	<form action="ProfileServlet" method="post" enctype="multipart/form-data">
        <label for="fileInput">
            <i class="fas fa-camera" style="cursor: pointer;"></i>
        </label>
        <input type="file" name="profileImage" id="fileInput" style="display: none;" onchange="this.form.submit();">
    </form>
</div>


    <div class="username"><%= username %></div>

    <div class="menu">
        <div class="menu-item"><i class="fas fa-edit"></i><a href="EditName.jsp">Edit Name</a></div>
        <div class="menu-item"><i class="fas fa-heart"></i><a href="Favorites.jsp">Favorites</a></div>
        <div class="menu-item"><i class="fas fa-cog"></i><a href="ChangePassword.jsp">Settings</a></div>
        <div class="menu-item"><i class="fas fa-bullseye"></i> <a href="Ourgoals.jsp">Our Goals</a></div>
        <div class="menu-item"><i class="fas fa-info-circle"></i> <a href="About.jsp">About</a></div>
        <div class="menu-item"><i class="fas fa-user-friends"></i> <a href="support.jsp">Support</a></div>
    </div>
</div>

</body>
</html>
