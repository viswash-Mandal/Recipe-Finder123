<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Recipes</title>
    <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            font-family: Capriola, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            text-align: start;
            margin-left: 75px;
            font-size: 24px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .recipe-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }

        .recipe-card {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
            width: 90%;
            max-width: 320px;
            margin: auto;
            height: auto;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        /* 🔥 Hover Effect */
        .recipe-card:hover {
            transform: scale(1.05); /* Slightly enlarges the card */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Adds a stronger shadow */
        }

        .recipe-card img {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            object-fit: cover;
        }

        .recipe-card h3 {
            margin: 10px 0;
        }

        .fav-icon {
            font-size: 24px;
            position: absolute;
            top: 22px;
            right: 22px;
            cursor: pointer;
            color: gray;
            z-index: 10;
        }

        .fav-icon.active {
            color: red;
        }
    </style>
</head>
<body>

<h1>🍽️ All Recipes</h1>

<div class="recipe-grid">
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            // Fetch all recipes
            String sql = "SELECT id, name, image FROM recipes ORDER BY id DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int recipeId = rs.getInt("id");
                String recipeName = rs.getString("name");
                String recipeImage = rs.getString("image");

                // Check if the image exists, else use default image
                String imagePath = (recipeImage != null && !recipeImage.isEmpty()) ? "uploads/images/" + recipeImage : "uploads/images/default.jpg";

                // Check if the recipe is already in favorites
                String favQuery = "SELECT * FROM favorites WHERE recipe_id = ?";
                PreparedStatement favStmt = conn.prepareStatement(favQuery);
                favStmt.setInt(1, recipeId);
                ResultSet favRs = favStmt.executeQuery();
                boolean isFavorite = favRs.next();

                favRs.close();
                favStmt.close();
    %>
                <div class="recipe-card">
                    <i class="fa fa-heart fav-icon <%= isFavorite ? "active" : "" %>" 
                       onclick="toggleFavorite(this, <%= recipeId %>)"></i>

                    <a href="RecipeDetails.jsp?id=<%= recipeId %>">
                        <img src="<%= imagePath %>" 
                             alt="<%= recipeName %>" 
                             onerror="this.onerror=null; this.src='uploads/images/default.jpg';">
                        <h3><%= recipeName %></h3>
                    </a>
                </div>
    <%
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    %>
</div>

<%@ include file="Footer.jsp" %>

<script>
    function toggleFavorite(element, recipeId) {
        let isFavorite = element.classList.contains("active");
        element.classList.toggle("active");

        // Send AJAX request to update favorite status
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "UpdateFavorite.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("recipeId=" + recipeId + "&action=" + (isFavorite ? "remove" : "add"));
    }
</script>

</body>
</html>
