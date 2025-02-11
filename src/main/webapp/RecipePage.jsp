<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Page</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: Capriola, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            text-align: center;
        }
        
        
        header {
            padding: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        h1 {
            text-align: start;
            margin-left: 75px;
            font-size: 24px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        h1 i {
            cursor: pointer;
        }
        
        p{
        	margin-left: 130px;
        	text-align: start;
        }
        
        
        
        
        .recipe-grids {
            display: flex;
            justify-content: center;
            gap: 55px;
            padding: 20px;
            flex-wrap: wrap;
        }

        .recipe img {
            width: 350px;
            height: 330px;
            border-radius: 10px;
        }

        .recipe p {
            text-align: center;
            font-weight: bold;
        }

        .section-btn {
            border-radius: 5px;
            border: 1px solid black;
            background-color: #0BA5A5;
            display: flex;
            justify-content: center;
            margin-top: 0.5px;
        }

        .section-btn button {
            background-color: #0BA5A5;
            color: black;
            padding: 12px 28px;
            border: none;
            font-size: 18px;
            cursor: pointer;
            min-width: 200px;
            height: 50px;
            text-align: center;
        }
        
        .section-btn button a{
        text-decoration: none;
        color: black;
        }

        .favorite {
            position: absolute;
            background-color: grey;
            border-radius: 50%;
            padding: 5px;
            cursor: pointer;
        }

        .favorite i {
            color: white;
            font-size: 24px;
        }

        .favorite.active i {
            color: red;
        }
    </style>
</head>
<body>
    <main>
        <div class= ' hea'>
        	<header>
            <h1>
                <i class="fas fa-arrow-left" onclick="history.back()"></i> Dish Discoverer
            </h1>
        	</header>
        	<p>by ingredients, cooking time, nutrition facts, collections.</p>
        </div>

        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this, 'Strawberry and Apple Jam', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>
                    <img src="https://i.ytimg.com/vi/ILrPPQCfZsU/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDDV4X9LG68ZBJphw2SH_W4qAC-Ag" alt="Strawberry & Apple Jam">
                    <div class="section-btn"><button><a href="RecipeDetails.jsp">Strawberry and Apple Jam</a></button></div>
                </div>
                <div class="recipe">
					<div class="favorite" onclick="toggleFavorite(this, 'Bisquick Spinach Quiche', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Bisquick Spinach Quiche">
                    <div class="section-btn"><button><a href="RecipeDetails.jsp">Bisquick Spinach Quiche</a></button></div>
                </div>
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this, 'Banana Nut Oatmeal Muffins', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Banana Nut Oatmeal Muffins">
                    <div class="section-btn"><button><a href="RecipeDetails.jsp">Banana Nut Oatmeal Muffins</a></button></div>
                </div>
            </div>
        </div>

        <!-- Replicated Sections -->
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                <div class="favorite" onclick="toggleFavorite(this, 'Chocolate Chip Pancakes', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button><a href="RecipeDetails.jsp">Chocolate Chip Pancakes</a></button></div>
                </div>
                <div class="recipe">
                	<div class="favorite" onclick="toggleFavorite(this, 'Avocado Toast', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button><a href="RecipeDetails.jsp">Avocado Toast</a></button></div>
                </div>
                <div class="recipe">
<div class="favorite" onclick="toggleFavorite(this, 'Blueberry Muffins', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button><a href="RecipeDetails.jsp">Blueberry Muffins</a></button></div>
                </div>
            </div>
        </div>
        
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
					<div class="favorite" onclick="toggleFavorite(this, 'Chocolate Chip Pancakes', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Chocolate Chip Pancakes</button></div>
                </div>
                <div class="recipe">
					<div class="favorite" onclick="toggleFavorite(this, 'Avocado Toast', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button>Avocado Toast</button></div>
                </div>
                <div class="recipe">
					<div class="favorite" onclick="toggleFavorite(this, 'Blueberry Muffins', 'https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg')">
                        <i class="fas fa-heart"></i>
                    </div>                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Blueberry Muffins</button></div>
                </div>
            </div>
        </div>
    </main>

<script>
function toggleFavorite(button, recipeName, recipeImage) {
    button.classList.toggle("active");

    let favorites = JSON.parse(localStorage.getItem("favorites")) || [];

    if (button.classList.contains("active")) {
        // Add to favorites
        if (!favorites.some(recipe => recipe.name === recipeName)) {
            favorites.push({ name: recipeName, image: recipeImage });
        }
    } else {
        // Remove from favorites
        favorites = favorites.filter(recipe => recipe.name !== recipeName);
    }

    localStorage.setItem("favorites", JSON.stringify(favorites));
}
</script>

    
    <%@ include file="Footer.jsp" %>
</body>
</html>