<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baked Meal</title>
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
                <i class="fas fa-arrow-left" onclick="history.back()"></i> Baked Meal
            </h1>
        	</header>
        </div>

        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <img src="https://www.onesarcasticbaker.com/wp-content/uploads/2024/07/caramelized-Honey-apple-cake-recipe_.jpg" alt="Strawberry & Apple Jam">
                    <div class="section-btn"><button>Apple Cake</button></div>
                </div>
                <div class="recipe">
                    <img src="https://i0.wp.com/www.biggerbolderbaking.com/wp-content/uploads/2020/06/Easy-Chocolate-Chip-Scones-WS-Thumb.jpg?fit=2000%2C1333&ssl=1" alt="Bisquick Spinach Quiche">
                    <div class="section-btn"><button>Hazelnut Chocolate Chip Scones</button></div>
                </div>
                <div class="recipe">
                    <img src="https://images.squarespace-cdn.com/content/v1/63ecf329e4e93d3adcd8a4a1/1677544547372-4TCKZSI0FVVWVAV7NAOQ/marblecherrycake3.jpg" alt="Banana Nut Oatmeal Muffins">
                    <div class="section-btn"><button>Cherry Chocolate Marble Cake</button></div>
                </div>
            </div>
        </div>

        <!-- Replicated Sections -->
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <img src="https://junifoods.com/wp-content/uploads/2024/06/Nepali-Doughnuts-picture.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Dutch Potato Doughnuts</button></div>
                </div>
                <div class="recipe">
                    <img src="https://cdn.tasteatlas.com/images/recipes/105a4e88dca44f4a81dbaf6ccb7b83bc.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button>Baklava</button></div>
                </div>
                <div class="recipe">
                    <img src="https://www.southernliving.com/thmb/SZYUJoMC7w_ZbvEdS51rEBEvEEU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/27277_Hand-Pies_CHERRY_HAND_PIES_147-1-d45bd145640944439b751910bf21acbf.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Cherry Hand Pies</button></div>
                </div>
            </div>
        </div>
        
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                   
                    <img src="https://onehotoven.com/wp-content/uploads/2022/05/sliced-cake-1.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Roasted Strawberry Sheet Cake</button></div>
                </div>
                <div class="recipe">
                    <img src="https://hips.hearstapps.com/hmg-prod/images/pumpkin-spice-cake-recipe-1627529125.jpg?crop=0.8891666666666667xw:1xh;center,top&resize=1200:*" alt="Avocado Toast">
                    <div class="section-btn"><button>Pumpkin Spice Cake</button></div>
                </div>
                <div class="recipe">
                    <img src="https://hips.hearstapps.com/hmg-prod/images/chocolate-chess-pie-recipe-2-1666838184.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Chocolate Chess Pie</button></div>
                </div>
            </div>
        </div>
    </main>

    
    <%@ include file="Footer.jsp" %>
</body>
</html>