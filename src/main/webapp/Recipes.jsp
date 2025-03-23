<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Recipe" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recipes</title>
    <style>
        .recipe-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }

        .recipe {
            text-align: center;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease-in-out;
            background-color: white;
        }

        .recipe:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .recipe img {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            object-fit: cover;
        }

        .recipe p {
            font-weight: bold;
            margin: 10px 0;
        }

        .recipe a {
            display: inline-block;
            padding: 8px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        .recipe a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<%@ include file="BackButton.jsp" %>

<%
    String category = (String) request.getAttribute("category");
    List<Recipe> recipes = (List<Recipe>) request.getAttribute("recipes");

    if (category == null || category.isEmpty()) {
        out.println("<h2>No category selected</h2>");
    } else {
        out.println("<h2>Recipes for " + category + "</h2>");

        if (recipes != null && !recipes.isEmpty()) {
%>

<div class="recipe-container">
    <%
        for (Recipe recipe : recipes) {
            String imagePath = (recipe.getImage() != null && !recipe.getImage().isEmpty()) 
                               ? request.getContextPath() + "/uploads/images/" + recipe.getImage() 
                               : request.getContextPath() + "/uploads/images/default.jpg";
    %>
        <div class="recipe">
            <img src="<%= imagePath %>" 
                 alt="<%= recipe.getName() %>" 
                 onerror="this.onerror=null; this.src='<%= request.getContextPath() %>/uploads/images/default.jpg';">
            <p><%= recipe.getName() %></p>
            <a href="RecipeDetails.jsp?id=<%= recipe.getId() %>">View Recipe</a>
        </div>
    <%
        }
    %>
</div>

<%
        } else {
            out.println("<p>No recipes found for this category.</p>");
        }
    }
%>

</body>
</html>
