<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>

<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    body {
        font-family: 'Capriola', sans-serif;
        background-color: #ffffff;
        margin: 0;
        padding: 20px;
    }

    .back-arrow {
        position: absolute;
        top: 10px;
        left: 10px;
        font-size: 22px;
    }

    .back-arrow a {
        text-decoration: none;
        color: black;
    }

    .container {
        max-width: 60%;
        margin: 40px auto;
        padding: 20px;
        text-align: left;
    }

    h2 {
        font-size: 24px;
        margin-bottom: 10px;
    }

    p {
        font-size: 16px;
        color: #333;
        line-height: 1.5;
    }

    h3 {
        font-size: 20px;
        margin-top: 20px;
    }
</style>
</head>
<body>

<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

<div class="container">
    <h2>About</h2>
    <p>
        Discover the joy of cooking! Our platform is designed for food enthusiasts to explore a wide variety of recipes curated by our expert team.
        Whether you’re a beginner or a seasoned cook, you’ll find dishes to inspire your culinary adventures. Learn, create, and enjoy cooking like never before!
    </p>

    <h3>Activity Feed</h3>
    <p>
        Display recent activity, like "Tried a new recipe" or "Saved a new favorite."
    </p>

    <h3>Favorite Recipes</h3>
    <p>
        A section where users can easily view recipes they’ve favorited or saved.
    </p>
</div>

</body>
</html>
