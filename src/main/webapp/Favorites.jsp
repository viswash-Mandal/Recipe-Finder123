<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Favorite Recipes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body { font-family: Capriola, sans-serif; background-color: #f9f9f9; text-align: center; }
        .recipe-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; padding: 20px; }
        .recipe-card {
    background: white;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
    position: relative;
    width: 80%;  /* Decrease width */
    height: 250px; /* Increase height */
    margin: auto;  /* Centering the card */
}

.recipe-card img {
    width: 100%;
    height: 180px; /* Adjusted height to fit inside */
    border-radius: 10px;
    object-fit: cover; /* Ensure images are scaled properly */
}

        .recipe-card h3 { margin: 10px 0; }
    </style>
</head>
<body>

<h1>❤️ Favorite Recipes</h1>

<div class="recipe-grid">
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            String sql = "SELECT r.id, r.name, r.image FROM favorites f JOIN recipes r ON f.recipe_id = r.id WHERE f.user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, 1);  // Replace with dynamic user ID if applicable

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
    %>
                <div class="recipe-card">
                    <a href="RecipeDetails.jsp?id=<%= rs.getInt("id") %>">
                        <img src="uploads/images/<%= rs.getString("image") %>" 
                             alt="<%= rs.getString("name") %>" 
                             onerror="this.onerror=null; this.src='uploads/images/default.jpg';">
                        <h3><%= rs.getString("name") %></h3>
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

</body>
</html>
