<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family Meal</title>
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
                <i class="fas fa-arrow-left" onclick="history.back()"></i> Family Meal
            </h1>
        	</header>
        </div>

        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <img src="https://theskinnyishdish.com/wp-content/uploads/2016/07/IMG_2160-1024x1024.jpg" alt="Strawberry & Apple Jam">
                    <div class="section-btn"><button>White Chicken Enchiladas</button></div>
                </div>
                <div class="recipe">
                    <img src="https://mojo.generalmills.com/api/public/content/uS1qIP6yikCNgtjqlpDcZA_webp_base.webp?v=664c475b&t=191ddcab8d1c415fa10fa00a14351227" alt="Bisquick Spinach Quiche">
                    <div class="section-btn"><button>Manicotti</button></div>
                </div>
                <div class="recipe">
                    <img src="https://healthyfitnessmeals.com/wp-content/uploads/2020/08/Chicken-broccoli-casserole-SQ.jpg" alt="Banana Nut Oatmeal Muffins">
                    <div class="section-btn"><button>Broccoli Chicken Casserole</button></div>
                </div>
            </div>
        </div>

        <!-- Replicated Sections -->
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                    <img src="https://tmbidigitalassetsazure.blob.core.windows.net/wpconnatixthumbnailsprod/EggplantRollatiniDIYD41566011121H_thumbnail.jpeg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Eggplant Rollatini</button></div>
                </div>
                <div class="recipe">
                    <img src="https://images.getrecipekit.com/20231019221919-sticky-pineapple-christmas-ham_1080x1080.jpg?width=650&quality=90&" alt="Avocado Toast">
                    <div class="section-btn"><button>Pineapple Ham</button></div>
                </div>
                <div class="recipe">
                    <img src="https://hips.hearstapps.com/hmg-prod/images/delish-202104-birriatacos-033-1619806490.jpg?crop=0.8891228070175439xw:1xh;center,top&resize=1200:*" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Birria Tacos</button></div>
                </div>
            </div>
        </div>
        
        <div class="recipe-grid-wrapper">
            <div class="recipe-grids">
                <div class="recipe">
                   
                    <img src="https://www.inspiredtaste.net/wp-content/uploads/2024/02/Easy-Italian-Meatballs-Recipe-3.jpg" alt="Chocolate Chip Pancakes">
                    <div class="section-btn"><button>Homemade Meatballs</button></div>
                </div>
                <div class="recipe">
                    <img src="https://cdn.jwplayer.com/v2/media/I6LvfLRI/thumbnails/GvXUEl1Z.jpg" alt="Avocado Toast">
                    <div class="section-btn"><button>Beef Tenderloin</button></div>
                </div>
                <div class="recipe">
                    <img src="https://static01.nyt.com/images/2023/08/24/multimedia/LH-Goulash-kfmt/LH-Goulash-kfmt-superJumbo.jpg" alt="Blueberry Muffins">
                    <div class="section-btn"><button>Goulash</button></div>
                </div>
            </div>
        </div>
    </main>

    
    <%@ include file="Footer.jsp" %>
</body>
</html>