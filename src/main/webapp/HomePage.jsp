<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<style>
	/* Global Styles */
body {
    font-family: Capriola, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #F5F5F5;
}

h1, h2, h3, p {
    text-align: center;
    color: #333;
}

/* Navigation Bar */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #e40046;
    padding: 9px;
    color: white;
}

.logo img {
    width: 50px;
    margin-left: 20px;
}

nav ul {
    list-style: none;
    display: flex;
    margin: 0;
    padding: 0;
}

nav ul li {
    margin: 0 15px;
}

nav ul li a {
    text-decoration: none;
    color: white;
    font-weight: bold;
}

.sign-in {
    background-color: white;
    color: #f50057;
    padding: 5px 10px;
    border-radius: 5px;
}

/* Hero Section */
.hero {
    background-image: url('recipe.jpg'); /* Set local image */
    background-size: cover;
    height: 300px;
    background-position: center;
    color: black;
    text-align: center;
    padding: 70px;
}

.hero-container {
    background-color: #f3456c;
    width: 1300px;
    height: 180px;
    padding: 30px;
    border-radius: 10px;
    display: inline-block;
}

.hero-container h1 {
    color: white;
    font-size: 35px;
    text-align: start;
}

.hero-container p {
    color: white;
    font-size: 20px;
    text-align: start;
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

.more {
    float: right;
    color: black;
    cursor: pointer;
}
</style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="logo.png" alt="Recipe Finder Logo">
        </div>
        <nav>
            <ul> 	
                <li><a href="Homepage.jsp">Home</a></li>
                <li><a href="RecipePage.jsp">Recipe</a></li>
                <li><a href="#">Trending</a></li>
                <li><a href="#">Search</a></li>
                <li><a href="login.jsp" class="sign-in">Login</a></li>
            </ul>
        </nav>
    </header>

    <section class="hero">
        <div class="hero-container">
            <h1>What can I make with.....</h1>
            <p>Our recipe finder tool will show you all the things you can make, 
				So none of your food goes to waste, with only a few added ingredients needed.</p>
        </div>
    </section>

    <section class="inspiration">
        <h2>Looking for inspiration?</h2>
        <p> To make something new...</p>
        <div class="inspiration-container">
            <div class="category">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Top 10">
                <div class="section-btn"><button>Top 10</button></div>
            </div>
            <div class="category">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Step-by-Step Recipes">
                <div class="section-btn"><button>Step-By-Step Recipes</button></div>
            </div>
            <div class="category">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Baking Recipes">
                <div class="section-btn"><button>Baking Recipe</button></div>
            </div>
        </div>
    </section>

    <section class="trending">
        <h2>Trending Recipes <span class="more">More></span></h2>
        <div class="trending-container">
            <div class="recipe">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Strawberry & Apple Jam">
                <div class="section-btn"><button>Strawberry and Apple Jam</button></div>
            </div>
            <div class="recipe">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Bisquick Spinach Quiche">
                <div class="section-btn"><button>Bisquick Spinach Quiche</button></div>
            </div>
            <div class="recipe">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Banana Nut Oatmeal Muffins">
                <div class="section-btn"><button>Banana Nut Oatmeal Muffins</button></div>
            </div>
        </div>
    </section>
=
</body>
</html>
