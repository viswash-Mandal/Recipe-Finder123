<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category Page</title>
<style>

h2{
	text-align: center;
}
/* Inspiration & Trending Recipes */
.inspiration-container, .trending-container {
    display: flex;
    justify-content: center;
    gap: 55px; /* Decreased gap */
    padding: 20px; /* Decreased padding */
    flex-wrap: wrap;

}

.category img, .recipe img {
    width: 350px; /* Adjusted size */
    height: 330px;
    border-radius: 10px;
}

.category p, .recipe p {
    text-align: center;
    font-weight: bold;
}

/* Buttons */
.section-btn {

    border-radius: 5px;
    border: 1px solid black;
    background-color: #0BA5A5;
    display: flex;
    justify-content: center;
    margin-top: 0.5px; /* Reduced margin */
}

.section-btn button {

    background-color: #0BA5A5;
    color: black;
    padding: 12px 28px; /* Increased padding for larger buttons */
    border: none;
    font-size: 18px; /* Increased font size */
    cursor: pointer;
    min-width: 200px; /* Set minimum width */
    height: 50px; /* Set fixed height */
    text-align: center;
}

	.section-btn button a{
		color: black;
		text-decoration: none;
	}

	.trending h2{
		margin-left: -62%;
	}
</style>

</head>
<body>
<%@ include file="BackButton.jsp" %>
<h2>Category</h2>
	<div class="inspiration-container">
            <div class="category">
                <img src="https://sukhis.com/app/uploads/2022/11/veggie-platter-1024x753.jpg" alt="Vegetarian Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Vegetarian">Vegetarian Recipes</a></button></div>
            </div>
            <div class="category">
                <img src="https://i.ytimg.com/vi/2u983B2wD1k/maxresdefault.jpg" alt="Non-Vegetarian Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Non-Vegetarian">Non-Vegetarian Recipes</a></button></div>
            </div>
            <div class="category">
                <img src="https://www.pamelasproducts.com/cdn/shop/files/PanPancakeMix.jpg?v=1694125550" alt="Baking Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Baking">Baking Recipes</a></button></div>
            </div>
        </div>
        
        	<div class="inspiration-container">
            <div class="category">
                <img src="https://www.parents.com/thmb/Pu3l5Cg8PfvKgbaF333cvOoSjHM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Parents-PRT-hassle-free-party-food-ideas-kids-will-love-that-wont-break-your-budget-Rachel-Vanni-hero-977-fc9760f172cf4c029ea71cb9c8935419.jpg" alt="Party Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Party">Party recipes</a></button></div>
            </div>
            <div class="category">
                <img src="https://www.allrecipes.com/thmb/XgWHycCFMP4eAvMfKXnX3pzC_DA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/ALR-14452-green-salad-VAT-hero-4x3-22eb1ac6ccd14e5bacf18841b9672313.jpg" alt="Salad Recipes">
				<div class="section-btn"><button><a href="RecipeServlet?category=Salad">Salad Recipes</a></button></div>
            </div>
            <div class="category">
                <img src="https://tb-static.uber.com/prod/image-proc/processed_images/8090beef6c8cd61a9c4c7ade90a08a91/445a4b2618e10f7db95d4f17a85b117d.jpeg" alt="Dessert Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Dessert">Desserts Recipes</a></button></div>
            </div>
        </div>
        
        	<div class="inspiration-container">
            <div class="category">
                <img src="https://www.whiskaffair.com/wp-content/uploads/2016/08/Clear-Chicken-Soup-2-3.jpg" alt="Soup Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Soup">Soup recipes</a></button></div>
            </div>
            <div class="category">
                <img src="https://hips.hearstapps.com/hmg-prod/images/harvest-bowls-index-66b3f14d6d5d4.jpg?crop=0.502xw:1.00xh;0,0&resize=640:*" alt="Step-by-Step Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Healthy">Healthy Meals</a></button></div>
            </div>
            <div class="category">
                <img src="https://www.vikhrolicucina.com/uploads/stories/1662465216_groupindianassortedsweetsmithaiwithdiya.jpg" alt="Sweets Recipes">
                <div class="section-btn"><button><a href="RecipeServlet?category=Sweets">Sweets Recipes</a></button></div>
            </div>
        </div>


</body>
</html>