<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<style>
    /* Global Styles for Navbar */
    body {
        font-family: Capriola, sans-serif;
        margin: 0; /* Remove default margin */
        padding-top: 50px; /* Add space to avoid content hiding under navbar */
    }

    header {
        position: fixed; /* Fix the navbar to the top */
        top: 0; /* Ensure it is at the top */
        left: 0; /* Align it to the left */
        width: 100%; /* Make it span the full width of the page */
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #e40046;
        padding: 9px;
        color: white;
        z-index: 1000; /* Ensure it stays on top of other content */
    }

    .logo img {
        width: 50px;
        margin-left: 20px;
    }

    nav ul {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
    }

    nav ul li {
        margin: 0 15px;
    }

    nav ul li a {
        text-decoration: none;
        color: white;
        font-weight: bold;
    }

    .sign-in {
        background-color: white;
        color: #f50057;
        padding: 5px 10px;
        border-radius: 5px;
    }

    /* Adding hover effects */
    nav ul li a:hover {
        color: #f50057;
    }

    .sign-in:hover {
        background-color: #f50057;
        color: white;
    }
</style>
</head>
<body>

<header>
    <div class="logo">
        <img src="logo.png" alt="Recipe Finder Logo">
    </div>
    <nav>
        <ul>
            <li><a href="Homepage.jsp">Home</a></li>
            <li><a href="RecipePage.jsp">Recipe</a></li>
            <li><a href="Trending.jsp">Trending</a></li>
            <li><a href="Search.jsp">Search</a></li>
            <li><a href="Login.jsp" class="sign-in">Login</a></li>
        </ul>
    </nav>
</header>

</body>
</html>
