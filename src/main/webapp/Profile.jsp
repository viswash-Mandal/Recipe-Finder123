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

    // Get the first letter of the username
    String firstLetter = username.substring(0, 1).toUpperCase();
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

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            font-weight: bold;
            color: #fff;
            margin: 20px auto;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
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

<div class="container">
    <div class="profile-image">
        <% if (profileImage.equals("logo.png")) { %>
            <div><%= firstLetter %></div>
        <% } else { %>
            <img src="ProfileImageServlet?userId=<%= userSession.getAttribute("userId") %>" 
                 alt="Profile Image" onerror="this.onerror=null; this.src='uploads/images/default.jpg';">
        <% } %>
    </div>

    <form action="ProfileServlet" method="post" enctype="multipart/form-data">

        <input type="file" name="profileImage" id="fileInput" style="display: none;" onchange="this.form.submit();">
    </form>

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