<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RecipeDetails</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
	/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    line-height: 1.6;
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

header {
    text-align: center;
    padding: 0px;
}

header h1 {
    margin: 0;
    font-size: 2.5em;
}

.tags {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 10px;
}

.tags span {
    background-color: #ffcdd2;
    color: #d32f2f;
    padding: 5px 10px;
    border-radius: 15px;
    font-size: 0.9em;
}

/* Image Section */
.image-section {
    text-align: center;
    margin: 20px 0;
}

.recipe-image {
    width: 450px;
    height: 300px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Ingredients Section */
.ingredients-section {
    margin: 20px;
}

.ingredients-section h2 {
    padding-bottom: 5px;
}

.ingredient-container {
    display: flex;
    flex-direction: column;
}

.ingredient-item {
    display: flex;
    justify-content: space-between;
    background-color: transparent;
    padding: 10px;
    border: 1px solid black;
    border-radius: 5px;
    margin-left:230px;
    margin-right:260px;
}

.ingredient-name {
    font-weight: bold;
}

.ingredient-quantity {
    color: #555;
}

/* Instructions Section */
.instructions-section {
    margin: 20px;
}

.ingredients-section h2{
	margin-left: 60px;
}

.instructions-section h2 {
	margin-left: 60px;
    color: black;
    padding-bottom: 5px;
}

.instruction-list {
    list-style-type: decimal;
    padding-left: 20px;
}

.instruction-list li {
    mrgin-bottom: 10px;
    padding: 3px;
    margin-left: 100px;

</style>

</head>
<body>
	
<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

    <!-- Header Section -->
    <header>
        <h1>Strawberry & Apple Jam</h1>
        <p>Low Fat, Fat-Free, Low in Saturated Fat, Low Cholesterol, Cholesterol-Free, Trans-fat Free,
				Sodium-Free, Low Sodium</p>
    </header>

    <!-- Image Section -->
    <section class="image-section">
        <img src="https://idsb.tmgrup.com.tr/ly/uploads/images/2022/08/12/224234.jpg" alt="Strawberry & Apple Jam" class="recipe-image">
    </section>

    <!-- Ingredients Section -->
    <section class="ingredients-section">
        <h2>Ingredients need to make it</h2>
        <div class="ingredient-container">
            <div class="ingredient-item">
                <span class="ingredient-name">Strawberry</span>
                <span class="ingredient-quantity">500g</span>
            </div>
            <div class="ingredient-item">
                <span class="ingredient-name">Apples</span>
                <span class="ingredient-quantity">500g</span>
            </div>
            <div class="ingredient-item">
                <span class="ingredient-name">Lemon juice</span>
                <span class="ingredient-quantity">1/4 cup</span>
            </div>
            <div class="ingredient-item">
                <span class="ingredient-name">Water</span>
                <span class="ingredient-quantity">2 cups</span>
            </div>
            <div class="ingredient-item">
                <span class="ingredient-name">Sugar</span>
                <span class="ingredient-quantity">1 Kg</span>
            </div>
        </div>
    </section>

    <!-- Instructions Section -->
    <section class="instructions-section">
        <h2>Instructions</h2>
        <ol class="instruction-list">
            <li>Wash, hull and half the strawberries.</li>
            <li>Peel, core and quarter the apples. Then cut quarters into thin slices.</li>
            <li>Put all the ingredients, except the sugar, into a large pot.</li>
            <li>Cover and bring to a boil. Simmer until the fruit is tender.</li>
            <li>Add warmed sugar and stir until it has dissolved. Increase heat, stirring frequently and cook until setting point is reached.</li>
            <li>Remove from heat and let stand for 5 minutes.</li>
            <li>Pour into warm sterile jars and seal.</li>
        </ol>
    </section>
    
    <%@ include file="Footer.jsp" %>
</body>
</html>