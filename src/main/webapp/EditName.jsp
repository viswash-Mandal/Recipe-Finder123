<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    HttpSession userSession = request.getSession(false);
    String username = (userSession != null && userSession.getAttribute("username") != null) ? 
                      (String) userSession.getAttribute("username") : "Guest";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Name</title>
    <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        body {
            font-family: 'Capriola', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            width: 90%;
            max-width: 400px;
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
            background-color: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px auto;
            font-size: 40px;
            color: gray;
        }

        .username {
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }

        .edit-section {
            padding: 30px;
            margin-top: 20px;
        }

        .edit-section input {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border: 1px solid #ccc;
            border-radius: 15px;
            margin-top: 20px;
        }

        .button-container {
        	width: 60px;
        	height: 52px;
        	margin-top: 18px;
            display: flex;
            justify-content: center;
        }

        .save-btn {
            padding: 10px 20px;
            font-size: 18px;
            border: 2px solid #333; /* Reduced border thickness */
            border-radius: 5px;
            background-color: white; /* White background */
            color: black; /* Black text */
            cursor: pointer;
            height: 40px; /* Reduced height */
            width: 100px; /* Adjusted width */
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .save-btn:hover {
            background-color: #f0f0f0; /* Light gray background on hover */
            border-color: #555; /* Darker border on hover */
        }
    </style>
</head>
<body>

<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

<div class="container">
    <div class="profile-image">
        <i class="fas fa-user"></i>
    </div>
    <div class="username"><%= username %></div>

    <div class="edit-section">
        <form action="UpdateNameServlet" method="post">
            <label for="newName"><strong>Edit Name</strong></label><br>
            <input type="text" id="newName" name="newName" placeholder="Change Name" required>
            
            <div class="button-container">
            	<button type= "Submit">save it</button>
            </div>
            
            
        </form>
    </div>
</div>

</body>
</html>
