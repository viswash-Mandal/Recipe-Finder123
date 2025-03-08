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
            width: 90%;
            max-width: 1500px;
            margin: 20px auto;
            padding: 50px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

@keyframes floatAnimation {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-5px); }
    100% { transform: translateY(0px); }
}

.recipe-card {
    background: #fff;
    padding: 35px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    cursor: pointer;
    transition: transform 0.3s ease-in-out;
}

.recipe-card:hover {
    transform: translateY(-5px);
}

.recipe-card.float {
    animation: floatAnimation 1s infinite ease-in-out;
}




        .recipe-card img {
            width: 100%;
            border-radius: 10px;
            margin-bottom: 10px;
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

            // Check if the searched recipe exists in the database
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
    %>
                <div class="recipe-card">
                    <img src="uploads/images/<%= rs.getString("image") %>" 
                        alt="<%= rs.getString("name") %>" 
                        onerror="this.onerror=null; this.src='uploads/images/default.jpg';">

                    <h3><%= rs.getString("name") %></h3>
                    <p>Category: <%= rs.getString("category") %></p>
                </div>
    <%
            }

            // If no results are found and a search was performed, insert the query into missing_recipes
            if (!hasResults && isSearchActive) {
                String checkMissingQuery = "SELECT id FROM missing_recipes WHERE query = ?";
                PreparedStatement checkStmt = conn.prepareStatement(checkMissingQuery);
                checkStmt.setString(1, query);
                ResultSet missingRs = checkStmt.executeQuery();

                if (missingRs.next()) {
                    // If the search term already exists, increment the search_count
                    String updateQuery = "UPDATE missing_recipes SET search_count = search_count + 1, last_searched = CURRENT_TIMESTAMP WHERE id = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                    updateStmt.setInt(1, missingRs.getInt("id"));
                    updateStmt.executeUpdate();
                } else {
                    // If the search term doesn't exist, insert a new record
                    String insertQuery = "INSERT INTO missing_recipes (query) VALUES (?)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                    insertStmt.setString(1, query);
                    insertStmt.executeUpdate();
                }

                out.println("<p style='text-align:center; font-size:18px;'>No recipes found. Try a different keyword!</p>");
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let hoverTimeout;

        document.querySelectorAll(".recipe-card").forEach(card => {
            card.addEventListener("mouseenter", function () {
                hoverTimeout = setTimeout(() => {
                    card.classList.add("float");
                }, 1000); // 1 second delay before starting animation
            });

            card.addEventListener("mouseleave", function () {
                clearTimeout(hoverTimeout);
                card.classList.remove("float");
            });
        });
    });
</script>

</body>
</html>