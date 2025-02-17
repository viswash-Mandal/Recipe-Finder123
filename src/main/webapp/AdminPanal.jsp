<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || !"admin".equals(adminSession.getAttribute("role"))) {
        response.sendRedirect("Login.jsp?error=Unauthorized access");
        return;
    }

    // Database connection
    String url = "jdbc:mysql://localhost:3306/RecipeFinder";
    String username = "root";
    String password = "root";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    int vegetarianCount = 0;
    int nonVegetarianCount = 0;
    int bakingCount = 0;
    int partyCount = 0;
    int saladCount = 0;
    int dessertsCount = 0;
    int soupCount = 0;
    int healthyCount = 0;
    int sweetsCount = 0;
    int userCount = 0;  // Variable for the number of users

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        String query = "SELECT category, COUNT(*) AS count FROM Recipes GROUP BY category";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            String category = rs.getString("category");
            int count = rs.getInt("count");
            switch (category) {
                case "Vegetarian": vegetarianCount = count; break;
                case "Non-Vegetarian": nonVegetarianCount = count; break;
                case "Baking": bakingCount = count; break;
                case "Party": partyCount = count; break;
                case "Salad": saladCount = count; break;
                case "Desserts": dessertsCount = count; break;
                case "Soup": soupCount = count; break;
                case "Healthy": healthyCount = count; break;
                case "Sweets": sweetsCount = count; break;
            }
        }

        // Query to count the number of users
        String userQuery = "SELECT COUNT(*) AS userCount FROM Users";  // Assuming the users are stored in a table called "Users"
        ps = conn.prepareStatement(userQuery);
        rs = ps.executeQuery();

        if (rs.next()) {
            userCount = rs.getInt("userCount");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
            width: 250px;
            background-color: #ff3b5c;
            color: white;
            padding: 20px;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 40px;
            font-size: 24px;
            font-weight: 600;
        }

        .sidebar button {
            width: 100%;
            padding: 15px;
            background-color: #ff3b5c;
            color: white;
            border: none;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            transition: background-color 0.3s ease;
        }

        .sidebar button:hover {
            background-color: #1abc9c;
        }

        .sidebar button a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            margin-left: 10px;
        }

        .sidebar i {
            font-size: 20px;
            margin-right: 10px;
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
            width: 114px;
            padding: 10px;
            color:white;
            background-color: #ff3b5c;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: auto;
        }

        .chart-container {
            display: none; /* Hides the chart container */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>DashBoard</h2>
            <button>
                <i class="fas fa-tachometer-alt"></i> <!-- Dashboard Icon -->
                <a href="AdminPanal.jsp">Dashboard</a>
            </button>
            <button>
                <i class="fas fa-plus-circle"></i> <!-- Add Recipe Icon -->
                <a href="AddRecipe.jsp">Add Recipes</a>
            </button>
            <button>
                <i class="fas fa-list-ul"></i> <!-- Recipe List Icon -->
                <a href="RecipeList.jsp">List of all Recipes</a>
            </button>
            <form action="Login.jsp" method="post">
                <input type="submit" value="LogOut" class="logout">
            </form>
        </div>

        <div class="dashboard">
            <h1>DashBoard</h1>
            <div class="cards">
                <div class="card"><h3>Vegetarian</h3><p><%= vegetarianCount %></p></div>
                <div class="card"><h3>Non-Vegetarian</h3><p><%= nonVegetarianCount %></p></div>
                <div class="card"><h3>Baking</h3><p><%= bakingCount %></p></div>
                <div class="card"><h3>Party</h3><p><%= partyCount %></p></div>
                <div class="card"><h3>Salad</h3><p><%= saladCount %></p></div>
                <div class="card"><h3>Desserts</h3><p><%= dessertsCount %></p></div>
                <div class="card"><h3>Soup</h3><p><%= soupCount %></p></div>
                <div class="card"><h3>Healthy</h3><p><%= healthyCount %></p></div>
                <div class="card"><h3>Sweets</h3><p><%= sweetsCount %></p></div>
                <div class="card"><h3>No. of Users</h3><p><%= userCount %></p></div> <!-- New Card for No. of Users -->
            </div>
        </div>
    </div>
</body>
</html>
