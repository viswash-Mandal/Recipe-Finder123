<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Recipe</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;

        }

        h2 {
            text-align: center;
            color: black;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .btn-container {
            text-align: center;
        }

        .btn {
            width: 30%;
            background-color: transparent;
            border: 1px solid black;
            border-radius: 10px;
            padding: 10px;
            cursor: pointer;
        }

        .back-container {
            margin-bottom: 15px;
        }

        .back-container a {
            text-decoration: none;
            font-size: 18px;
            color: black;
        }
    </style>
</head>
<body>

<div class="container">


    <% 
        String recipeId = request.getParameter("id");
        String name = "", ingredients = "", instructions = "", videoLink = "", image = "";
        
        if (recipeId != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");
                
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    name = request.getParameter("name");
                    ingredients = request.getParameter("ingredients");
                    instructions = request.getParameter("instructions");
                    videoLink = request.getParameter("videoLink");
                    
                    String updateSql = "UPDATE Recipes SET name=?, ingredients=?, instructions=?, video_link=? WHERE id=?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                    updateStmt.setString(1, name);
                    updateStmt.setString(2, ingredients);
                    updateStmt.setString(3, instructions);
                    updateStmt.setString(4, videoLink);
                    updateStmt.setInt(5, Integer.parseInt(recipeId));
                    updateStmt.executeUpdate();
                    updateStmt.close();
                }
                
                String sql = "SELECT * FROM Recipes WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(recipeId));
                ResultSet rs = stmt.executeQuery();
                
                if (rs.next()) {
                    name = rs.getString("name");
                    ingredients = rs.getString("ingredients");
                    instructions = rs.getString("instructions");
                    videoLink = rs.getString("video_link");
                    image = rs.getString("image");
                }
                
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>


    <form action="UpdateRecipeServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= recipeId %>">

        <div class="form-group">
            <label for="recipeName">Name of Recipe:</label>
            <input type="text" id="recipeName" name="name" value="<%= name %>" required>
        </div>

<div class="form-group">
    <label for="recipeImage">Current Image:</label>
    <br>
    <% if (image != null && !image.isEmpty()) { %>
        <img src="uploads/images/<%= image %>" 
             alt="<%= name %>" 
             onerror="this.onerror=null; this.src='uploads/images/default.jpg';" 
             style="width:100px; height:100px;">
    <% } else { %>
        <p>No image available</p>
    <% } %>
</div>


        <div class="form-group">
            <label for="recipeImage">Choose New Image:</label>
            <input type="file" id="recipeImage" name="recipeImage">
        </div>

        <div class="form-group">
            <label for="ingredients">Update Ingredients:</label>
            <textarea id="ingredients" name="ingredients" rows="4" required><%= ingredients %></textarea>
        </div>

        <div class="form-group">
            <label for="instructions">Update Instructions:</label>
            <textarea id="instructions" name="instructions" rows="4" required><%= instructions %></textarea>
        </div>

        <div class="form-group">
            <label for="videoLink">Video Link:</label>
            <input type="text" name="videoLink" id="videoLink" value="<%= videoLink %>">
        </div>

        <div class="btn-container">
            <button type="submit" class="btn">Update</button>
        </div>
    </form>
</div>

</body>
</html>
