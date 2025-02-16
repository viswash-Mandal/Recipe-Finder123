<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        padding: 20px;
    }
    .recipe {
        text-align: center;
        border: 1px solid #ddd;
        padding: 10px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease;
    }
    .recipe:hover {
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }
    .recipe img {
        width: 100%;
        height: 200px;
        border-radius: 10px;
        object-fit: cover;
    }
    .recipe p {
        font-weight: bold;
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
    %>
        <div class="recipe">
            <img src="<%= recipe.getImage() %>" alt="<%= recipe.getName() %>">
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
