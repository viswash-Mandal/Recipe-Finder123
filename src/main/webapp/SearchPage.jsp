<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Search</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Capriola, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            justify-content: center;
            align-items: center;
        }

        h1 {
            text-align: start;
            margin-left: 75px;
            font-size: 24px;
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .container {
            max-width: 1500px;
            margin: 20px auto;
            padding: 50px;
        }

        .search-box {
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px;
            background: #fff;
            border-radius: 25px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        input {
            width: 80%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
            font-size: 16px;
        }

        button {
            margin-left: 10px;
            padding: 12px 20px;
            border: none;
            background: #007BFF;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #0056b3;
        }

        .recipe-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .recipe-card {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
            width: 90%;
            max-width: 320px;
            margin: auto;
            height: auto;
        }

        .recipe-card:hover {
            transform: translateY(-5px);
        }

        .recipe-card img {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            object-fit: cover;
        }

        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>

<h1>🔍 Search Your Recipe</h1>

<div class="container">
    <div class="search-box">
        <form method="post">
            <input type="text" name="query" placeholder="Search recipes..." value="<%= request.getParameter("query") != null ? request.getParameter("query") : "" %>">
            <button type="submit">Search</button>
        </form>
    </div>

    <p class="section-title">Search Results</p>
    <div class="recipe-grid">
    <%
        String query = request.getParameter("query");
        boolean isSearchActive = query != null && !query.trim().isEmpty();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            // Search for recipes
            String sql = isSearchActive 
                ? "SELECT id, name, category, image FROM recipes WHERE LOWER(name) LIKE LOWER(?)"
                : "SELECT id, name, category, image FROM recipes";

            PreparedStatement stmt = conn.prepareStatement(sql);

            if (isSearchActive) {
                stmt.setString(1, "%" + query + "%");
            }

            ResultSet rs = stmt.executeQuery();
            boolean hasResults = false;

            while (rs.next()) {
                hasResults = true;
                int recipeId = rs.getInt("id");

                // ✅ Track the search in `search_activity`
                String searchQuery = "SELECT search_count FROM search_activity WHERE recipe_id = ?";
                PreparedStatement checkStmt = conn.prepareStatement(searchQuery);
                checkStmt.setInt(1, recipeId);
                ResultSet searchRs = checkStmt.executeQuery();

                if (searchRs.next()) {
                    // If recipe already searched, increase count
                    String updateSearch = "UPDATE search_activity SET search_count = search_count + 1 WHERE recipe_id = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSearch);
                    updateStmt.setInt(1, recipeId);
                    updateStmt.executeUpdate();
                } else {
                    // Insert new search record
                    String insertSearch = "INSERT INTO search_activity (recipe_id, search_count) VALUES (?, 1)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertSearch);
                    insertStmt.setInt(1, recipeId);
                    insertStmt.executeUpdate();
                }
    %>
                <a href="RecipeDetails.jsp?id=<%= recipeId %>">
                    <div class="recipe-card">
                        <img src="uploads/images/<%= rs.getString("image") %>" 
                            alt="<%= rs.getString("name") %>" 
                            onerror="this.onerror=null; this.src='uploads/images/default.jpg';">

                        <h3><%= rs.getString("name") %></h3>
                        <p>Category: <%= rs.getString("category") %></p>
                    </div>
                </a>
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
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
