<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Capriola&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
        }

        /* Back Button */
        .back-arrow {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 22px;
        }

        .back-arrow a {
            text-decoration: none;
            color: white;
            padding: 10px;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0.6);
            transition: background 0.3s;
        }

        .back-arrow a:hover {
            background: rgba(0, 0, 0, 0.8);
        }

        /* Hero Section */
        .hero {
            width: 100%;
            height: 350px;
            background: url('https://as2.ftcdn.net/v2/jpg/07/72/54/07/1000_F_772540791_QKWmQ2gI4Yv6YYvZv8lqVg4bDKGoxgFZ.jpg') center/cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            position: relative;
        }

        .hero h1 {
            font-size: 40px;
            font-weight: 600;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
        }

        /* Content Section */
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h2 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .container p {
            font-size: 18px;
            color: #555;
            line-height: 1.8;
        }

        /* Sections */
        .section {
            margin-top: 30px;
            text-align: center;
        }

        .section h3 {
            font-size: 22px;
            color: #333;
            margin-bottom: 10px;
        }

        /* Icon Sections */
        .icon-section {
            display: flex;
            justify-content: center;
            gap: 40px;
            margin-top: 30px;
        }

        .icon-box {
            text-align: center;
            max-width: 300px;
        }

        .icon-box i {
            font-size: 50px;
            color: #007bff;
            margin-bottom: 10px;
        }

        .icon-box h4 {
            font-size: 20px;
            color: #333;
            margin: 10px 0 5px;
        }

        .icon-box p {
            font-size: 16px;
            color: #777;
        }
    </style>
</head>
<body>

    <!-- Back Button -->
    <div class="back-arrow">
        <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
    </div>

    <!-- Hero Section -->
    <div class="hero">
        <h1>About Us</h1>
    </div>

    <!-- Content Section -->
    <div class="container">
        <h2>Discover the Joy of Cooking</h2>
        <p>
            Our platform is designed for food enthusiasts to explore a wide variety of recipes curated by our expert team.
            Whether you’re a beginner or a seasoned cook, you’ll find dishes to inspire your culinary adventures. 
            Learn, create, and enjoy cooking like never before!
        </p>

        <!-- Activity Feed & Favorites -->
        <div class="icon-section">
            <div class="icon-box">
                <i class="fas fa-rss"></i>
                <h4>Activity Feed</h4>
                <p>See recent activity like "Tried a new recipe" or "Saved a favorite."</p>
            </div>

            <div class="icon-box">
                <i class="fas fa-heart"></i>
                <h4>Favorite Recipes</h4>
                <p>A section where you can easily view recipes you’ve favorited or saved.</p>
            </div>
        </div>
    </div>

</body>
</html>
