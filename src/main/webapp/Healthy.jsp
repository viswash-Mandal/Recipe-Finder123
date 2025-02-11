<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Healthy Meal</title>
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
         </style>
</head>
<body>
    <main>
        <div class= ' hea'>
        	<header>
            <h1>
                <i class="fas fa-arrow-left" onclick="history.back()"></i> Healthy Meal
            </h1>
        	</header>
        </div>

        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <img src="https://juliasalbum.com/wp-content/uploads/2015/07/egg-breakfast-casserole-recipe.jpg" alt="Strawberry & Apple Jam">
                    <div class="section-btn"><button>Broccoli and cheese egg bake</button></div>
                </div>
                <div class="recipe">
                    <img src="https://toasterovenlove.com/wp-content/uploads/loaded-avocado-toast-720x540.jpg" alt="Bisquick Spinach Quiche">
                    <div class="section-btn"><button>Loaded avocado toast</button></div>
                </div>
                <div class="recipe">
                    <img src="https://mommypotamus.com/wp-content/uploads/2022/03/overnight-oats-recipe.jpg" alt="Banana Nut Oatmeal Muffins">
                    <div class="section-btn"><button>Overnight oats</button></div>
                </div>
            </div>
        </div>

        <!-- Replicated Sections -->
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <img src="https://thewoodenskillet.com/wp-content/uploads/2016/07/zesty-italian-pasta-salad-1.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Italian pasta salad</button></div>
                </div>
                <div class="recipe">
                    <img src="https://www.goodlifeeats.com/wp-content/uploads/2022/06/Recipe-for-Veggie-Quesadillas-720x720.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button>Veggie quesadillas</button></div>
                </div>
                <div class="recipe">
                    <img src="https://www.easyhomemadelife.com/wp-content/uploads/2024/09/potato-bar-1-1024x768.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Baked potato bar with healthy toppings</button></div>
                </div>
            </div>
        </div>
        
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                   
                    <img src="https://thegirlonbloor.com/wp-content/uploads/2022/05/Caprese-Chicken-12.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Caprese chicken breasts</button></div>
                </div>
                <div class="recipe">
                    <img src="https://pinchofyum.com/wp-content/uploads/healthy-mac-and-cheese-square.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button>Healthy mac and cheese </button></div>
                </div>
                <div class="recipe">
                    <img src="https://www.eatingonadime.com/wp-content/uploads/2022/03/cp-beef-and-brocolli-4.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Slow cooker beef and broccoli</button></div>
                </div>
            </div>
        </div>
    </main>

    
    <%@ include file="Footer.jsp" %>
</body>
</html>