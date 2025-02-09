<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

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
    padding: 5px;
    color: white;
}

.logo img {
    width: 50px;
    margin-left: 20px;
}

nav ul {
	align-items:center;
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


/* Signup & Sign-in Buttons */
.auth-buttons {
    display: flex;
    gap: 10px;
}

.auth-buttons a {
    background-color: white;
    color: #e40046;
    padding: 5px 10px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
}

/* Profile Section */
/* Profile Section */
.profile {
    position: relative;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #ffffff2e; /* Add a light background */
    padding: 10px;
    border-radius: 50%; /* Make it circular */
}

/* Profile Icon */
.profile-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 20px; /* Ensure proper sizing */
    height: 20px;
    border-radius: 50%;
    background-color: #ffffff4d; /* Light transparent background */
    border: 2px solid white;
}


/* Dropdown */
.dropdown {
    display: none;
    position: absolute;
    top: 50px;
    right: 0;
    background: white;
    border-radius: 5px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    padding: 10px;
    width: 150px;
    z-index: 1000;
}

.dropdown a {
    display: block;
    padding: 8px;
    color: black;
    text-decoration: none;
    font-size: 16px;
}

.dropdown a:hover {
    background: #f5f5f5;
}
/* Hero Section */
.hero {
    background-image: url('bg.jpg'); /* Set local image */
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

	.trending h2{
		margin-left: -62%;
	}

.more a {
    float: right;
    color: black;
    cursor: pointer;
    text-decoration: none;
    margin-right: 7%;
    margin-left: -15%;
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
            <li><a href="HomePage.jsp">Home</a></li>
            <li><a href="RecipePage.jsp">Recipes</a></li>
            <li><a href="Trending.jsp">Trending</a></li>
            <li><a href="SearchPage.jsp">Search</a></li>

            <%
                String user = (String) session.getAttribute("username");
                String role = (String) session.getAttribute("role");

                if (user == null) { 
            %>
                <!-- If No User Logged In -->
                <li class="auth-buttons">
                    <a href="Signup.jsp">Sign Up</a>
                    <a href="Login.jsp">Sign In</a>
                </li>
            <%
                } else {
            %>
                <!-- If User/Admin Logged In -->
                <li class="profile">
                    <div id="profileIcon" class="profile-icon">
                        <i class="fa-regular fa-user" alt="Profile Icon"></i> 
                    </div>
                    <div id="profileDropdown" class="dropdown">
                        <% if ("admin".equals(role)) { %>
                            <a href="AdminPanal.jsp">Admin Panel</a>
                        <% } %>
                        <a href="Profile.jsp">Manage Profile</a>
                        <a href="LogoutServlet">Logout</a>
                    </div>
                </li>
            <%
                }
            %>
        </ul>
    </nav>
</header>


<!-- hero section  -->
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
                <div class="section-btn"><button>Family Cooking</button></div>
            </div>
            <div class="category">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Step-by-Step Recipes">
                <div class="section-btn"><button>Healthy Meals</button></div>
            </div>
            <div class="category">
                <img src="https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Fish-Tacos-1337495.jpg?quality=90&resize=556,505" alt="Baking Recipes">
                <div class="section-btn"><button>Baking Recipe</button></div>
            </div>
        </div>
    </section>

    <section class="trending">
        <h2>Trending Recipes <span class="more"><a href="Trending.jsp">More></a></span></h2>
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
    
<!-- JavaScript -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    var profileIcon = document.getElementById("profileIcon");
    var dropdown = document.getElementById("profileDropdown");

    profileIcon.addEventListener("click", function(event) {
        event.stopPropagation();
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    });

    document.addEventListener("click", function(event) {
        if (!profileIcon.contains(event.target) && !dropdown.contains(event.target)) {
            dropdown.style.display = "none";
        }
    });
});
</script>
<%@ include file = "Footer.jsp" %>
</body>
</html>
