<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || !"admin".equals(adminSession.getAttribute("role"))) {
        response.sendRedirect("Login.jsp?error=Unauthorized access");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
 <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: Capriola, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }
        .container {
            display: flex;
        }
        .sidebar {
            width: 300px;
            background-color: #F11B4A;
            color: white;
            padding: 20px;
            height: 100vh;
        }
        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .sidebar button {
        	height: 55px;
            width: 100%;
            margin: 33px 0;
            border: none;
            background-color: white;
            color: black;
            font-size: 16px;
            cursor: pointer;
            border-radius: 10px;
        }
        
        .sidebar button a{
        	text-decoration: none;
        	color: black;
        	font-size: 20px;
        }
        
        .dashboard {
            flex: 1;
            padding: 30px;
            background-color: white;
        }
        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .card {
            width: 200px;
            padding: 20px;
            background-color: #ff3b5c;
            color: white;
            text-align: center;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }
        .logout {
            margin-left: 63px;
            width: 114px;
            padding: 10px;
            background-color: white;
            color: black;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 20px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Admin</h2>
            <button><a href="Dashboard.jsp">Dashboard</a></button>
            <button><a href="AddRecipe.jsp">Add Recipes</a></button>
            <button><a href="RecipeList.jsp">List of all Recipes</a></button>
            <form action="Login.jsp" method="post">
                <input type="submit" value="LogOut" class="logout">
            </form>
        </div>

        <!-- Dashboard -->
        <div class="dashboard">
            <h1>Admin Panel</h1>
            <div class="cards">
                <div class="card">
                    <h3>No. of Recipes</h3>
                    <p id="noOfRecipes">0</p>
                </div>
                <div class="card">
                    <h3>No. of Users</h3>
                    <p>255</p>
                </div>
                <div class="card">
                    <h3>Healthy Meal</h3>
                    <p id="vegetarianRecipes">0</p>
                </div>
                <div class="card">
                    <h3>Non-Vegetarian Recipes</h3>
                    <p id="nonVegetarianRecipes">0</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        async function fetchRecipes() {
            try {
                const response = await fetch('https://www.themealdb.com/api/json/v1/1/search.php?');
                const data = await response.json();
                const meals = data.meals || [];
                const vegetarianCount = meals.filter(meal => meal.strCategory === "Vegetarian").length;
                const nonVegetarianCount = meals.length - vegetarianCount;

                document.getElementById('noOfRecipes').innerText = meals.length;
                document.getElementById('vegetarianRecipes').innerText = vegetarianCount;
                document.getElementById('nonVegetarianRecipes').innerText = nonVegetarianCount;
            } catch (error) {
                console.error("Error fetching recipes:", error);
            }
        }

        window.onload = fetchRecipes;
    </script>
</body>
</html>
