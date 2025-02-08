<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags for character set and responsive design -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Search</title>
    
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <style>
        /* General body styling */
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

        /* Container for the whole content */
        .container {
        	margin-bottom: 50px;
            width: 90%;
            max-width: 1500px;
            margin: 20px auto;
            padding: 50px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Styling for the search box */
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

        /* Input field inside search box */
        input {
            width: 80%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
            font-size: 16px;
        }

        /* Button inside search box */
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

        /* Title of each section */
        .section-title {
            font-weight: bold;
            margin: 20px 0 10px;
            font-size: 18px;
            color: #333;
        }

        /* Recipe grid container */
        .recipe-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            padding: 0;
        }

        /* Styling of each recipe card */
        .recipe-card {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }

        /* Hover effect for recipe cards */
        .recipe-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Image inside recipe card */
        .recipe-card img {
            width: 100%;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        /* Hidden class for elements that are hidden (e.g., suggestions) */
        .hidden {
            display: none;
        }

        /* Recent search item styling */
        .recent-search-item {
            width: 100px;
            padding: 10px;
            display: inline-block;
            text-align: center;
            background: #f1f1f1;
            border-radius: 10px;
            cursor: pointer;
            margin: 5px;
        }
    </style>
</head>
<body>

		<h1>
                <i class="fas fa-arrow-left" onclick="history.back()"></i> Search your Recipe
            </h1>
    <!-- Main container -->
    <div class="container">
        <!-- Search box for searching recipes -->
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search recipes...">
            <button onclick="searchRecipe()">Search</button>
        </div>

        <!-- Recent searches section -->
        <div id="recentAndSuggestions">
            <p class="section-title">Recent Searches</p>
            <div id="recentSearches"></div>
        </div>

        <!-- Search results section -->
        <p class="section-title">Search Results</p>
        <div class="recipe-grid" id="searchResults"></div>
    </div>



    <script>
        /* Retrieve search history from localStorage */
        let userSearchHistory = JSON.parse(localStorage.getItem("userSearchHistory")) || [];

        /* Display recent searches from user history */
        function displayRecentSearches() {
            const recentSearches = document.getElementById("recentSearches");
            recentSearches.innerHTML = "";
            userSearchHistory.slice(0, 5).forEach(search => {
                const searchBox = document.createElement("div");
                searchBox.classList.add("recent-search-item");
                searchBox.textContent = search;
                searchBox.onclick = () => {
                    document.getElementById("searchInput").value = search;
                    searchRecipe();
                };
                recentSearches.appendChild(searchBox);
            });
        }
        displayRecentSearches();

        /* Function to search recipes based on user input or category */
        function searchRecipe(category = null) {
            let query = category ? category : document.getElementById("searchInput").value.trim();
            if (!query) {
                alert("Please enter a search term.");
                return;
            }

            /* Save new search term to history and update localStorage */
            if (!userSearchHistory.includes(query)) {
                userSearchHistory.unshift(query);
                if (userSearchHistory.length > 10) {
                    userSearchHistory.pop();
                }
                localStorage.setItem("userSearchHistory", JSON.stringify(userSearchHistory));
                displayRecentSearches();
            }

            /* Hide recent searches and suggestions */
            document.getElementById("recentAndSuggestions").classList.add("hidden");
            const results = document.getElementById("searchResults");
            results.innerHTML = "";

            /* Fetch recipes from API based on the search term */
            fetch(`https://www.themealdb.com/api/json/v1/1/search.php?s=${query}`)
                .then(response => response.json())
                .then(data => {
                    if (data.meals) {
                        data.meals.forEach(meal => {
                            /* Create recipe card for each meal */
                            const card = document.createElement("div");
                            card.classList.add("recipe-card");
                            card.innerHTML = `
                                <img src="${meal.strMealThumb}" alt="${meal.strMeal}">
                                <h3>${meal.strMeal}</h3>
                            `;
                            
                            /* Create and style the "View Recipe" button */
                            const recipeButton = document.createElement("button");
                            recipeButton.textContent = "View Recipe";
                            recipeButton.style.backgroundColor = "#539aa3"; 
                            recipeButton.style.color = "black"; // Black text
                            recipeButton.style.padding = "10px 20px";
                            //recipebutton.style.width = '55px';
                            recipeButton.style.borderRadius = "5px";
                            recipeButton.style.border = "none";
                            recipeButton.style.cursor = "pointer";

                            /* Redirect to recipe details page on button click */
                         recipeButton.onclick = () => {
    if (meal.idMeal) {
        window.location.href = `RecipeDetails.html?mealId=${meal.idMeal}`;
    } else {
        alert("Meal ID not available.");
    }
};

                            /* Append the button to the recipe card */
                            card.appendChild(recipeButton);

                            results.appendChild(card);
                        });
                    } else {
                        results.innerHTML = "<div class='recipe-card'>No results found</div>";
                    }
                });
        }
    </script>
    
    <%@ include file= "Footer.jsp" %>
</body>
</html>
