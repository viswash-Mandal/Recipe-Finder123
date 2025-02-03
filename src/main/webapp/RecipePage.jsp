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

        .favorite {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.8);
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
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Strawberry & Apple Jam">
                    <div class="section-btn"><button>Strawberry and Apple Jam</button></div>
                </div>
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Bisquick Spinach Quiche">
                    <div class="section-btn"><button>Bisquick Spinach Quiche</button></div>
                </div>
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Banana Nut Oatmeal Muffins">
                    <div class="section-btn"><button>Banana Nut Oatmeal Muffins</button></div>
                </div>
            </div>
        </div>

        <!-- Replicated Sections -->
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Chocolate Chip Pancakes</button></div>
                </div>
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button>Avocado Toast</button></div>
                </div>
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Blueberry Muffins</button></div>
                </div>
            </div>
        </div>
        
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Chocolate Chip Pancakes</button></div>
                </div>
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button>Avocado Toast</button></div>
                </div>
                <div class="recipe">
                    <div class="favorite" onclick="toggleFavorite(this)"><i class="fas fa-heart"></i></div>
                    <img src="https://www.truefoodkitchen.com/wp-content/uploads/2024/05/Home_WhatsNew_Brunch_623x398-100-1.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Blueberry Muffins</button></div>
                </div>
            </div>
        </div>
    </main>

    <script>
        function toggleFavorite(button) {
            button.classList.toggle('active');
        }
    </script>
    
    <%@ include file="Footer.jsp" %>
</body>
</html>