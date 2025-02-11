<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Favorites</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
        }
        
            .back-arrow {
        text-align: left;
        padding: 20px;
        font-size: 22px;
    }

    .back-arrow a {
        text-decoration: none;
        color: black;
    }

        .recipe-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .recipe-card {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            width: 250px;
            text-align: center;
        }

        .recipe-card img {
            width: 100%;
            height: 200px;
            border-radius: 10px;
        }

        .recipe-card p {
            font-weight: bold;
            margin: 10px 0;
        }
    </style>
</head>
<body>



<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>
    <h1>Your Favorite Recipes</h1>
    <div class="recipe-container" id="favoriteList"></div>

    <script>
    document.addEventListener("DOMContentLoaded", function () {
        let favorites = JSON.parse(localStorage.getItem("favorites")) || [];
        let favoriteList = document.getElementById("favoriteList");

        console.log("Favorites from localStorage:", favorites); // Debugging

        if (!favorites || favorites.length === 0) {
            favoriteList.innerHTML = "<p>No favorite recipes yet.</p>";
            return;
        }

        favorites.forEach(recipe => {
            let recipeCard = document.createElement("div");
            recipeCard.classList.add("recipe-card");
            recipeCard.innerHTML = `
                <img src="${recipe.image}" alt="${recipe.name}">
                <p>${recipe.name}</p>
            `;
            favoriteList.appendChild(recipeCard);
        });
    });
    </script>
</body>
</html>
