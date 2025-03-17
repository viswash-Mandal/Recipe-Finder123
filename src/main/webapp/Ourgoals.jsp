<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Goals</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Capriola&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f8f8;
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
            background: url('https://dmlxzvnzyohme.cloudfront.net/Brand-imagery/newsletter-sign-up_bg.webp') center/cover no-repeat;
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

        /* Icon Section */
        .icon-section {
            display: flex;
            justify-content: center;
            gap: 40px;
            margin-top: 30px;
        }

        .icon-box {
            text-align: center;
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



    <!-- Hero Section -->
    <div class="hero">
        <h1>Our Goal: Inspire Your Inner Chef</h1>
    </div>

    <!-- Content Section -->
    <div class="container">
        <h2>What We Aim To Achieve</h2>
        <p>
            Our mission is to make delicious recipes accessible to everyone. By offering a carefully curated selection of dishes, 
            we aim to ignite your passion for cooking and help you create memorable meals at home.
        </p>

        <!-- Icon Section -->
        <div class="icon-section">
            <div class="icon-box">
                <i class="fas fa-utensils"></i>
                <h4>Easy Recipes</h4>
                <p>Simple steps to cook like a pro.</p>
            </div>

            <div class="icon-box">
                <i class="fas fa-seedling"></i>
                <h4>Healthy Choices</h4>
                <p>Nutritious meals for a better life.</p>
            </div>

            <div class="icon-box">
                <i class="fas fa-globe"></i>
                <h4>Global Cuisine</h4>
                <p>Explore flavors from around the world.</p>
            </div>
        </div>
    </div>

</body>
</html>
