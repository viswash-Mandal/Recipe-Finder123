<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Search</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

        h1 i {
            cursor: pointer;
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
            display: flex;
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

        .recipe-card {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            cursor: pointer;
        }

        .recipe-card img {
            width: 100%;
            border-radius: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<h1>
    <i class="fas fa-arrow-left" onclick="history.back()"></i> Search Your Recipe
</h1>

<div class="container">
    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search recipes...">
        <button onclick="searchRecipe()">Search</button>
    </div>

    <p class="section-title">Search Results</p>
    <div class="recipe-grid" id="searchResults"></div>
</div>

<script>
function searchRecipe() {
    let query = document.getElementById("searchInput").value.trim();
    if (!query) {
        alert("Please enter a search term.");
        return;
    }

    const results = document.getElementById("searchResults");
    results.innerHTML = "";

    fetch(`SearchServlet?query=${query}`)
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                data.forEach(meal => {
                    const card = document.createElement("div");
                    card.classList.add("recipe-card");
                    card.innerHTML = `
                        <img src="${meal.image}" alt="${meal.name}">
                        <h3>${meal.name}</h3>
                        <p>Category: ${meal.category}</p>
                    `;
                    card.onclick = () => {
                        window.location.href = `RecipeDetails.jsp?recipeId=${meal.id}`;
                    };
                    results.appendChild(card);
                });
            } else {
                results.innerHTML = "<p style='text-align:center; font-size:18px;'>No recipes found. Try a different keyword!</p>";
            }
        })
        .catch(error => {
            console.error("Error fetching data:", error);
        });
}

</script>

<%@ include file= "Footer.jsp" %>

</body>
</html>
