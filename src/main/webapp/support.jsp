<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact / Support</title>

<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    body {
        font-family: 'Capriola', sans-serif;
        background-color: #ffffff;
        margin: 0;
        padding: 0;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }


    .back-arrow {
        position: absolute;
        top: 20px;
        left: 20px;
        font-size: 22px;
    }

    .back-arrow a {
        text-decoration: none;
        color: black;
    }

    h2 {
        font-size: 24px;
        margin-bottom: 10px;
    }

    p {
        font-size: 14px;
        color: #555;
        margin-bottom: 20px;
    }

    input[type="email"], textarea {
        width: 80%;
        padding: 15px;
        margin: 12px 0;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 16px;
        display: block;
        margin-left: auto;
        margin-right: auto;
        text-align: left;
    }

    textarea {
        height: 120px;
        resize: none;
    }

    button {
        width: 40%;
        padding: 12px;
        background-color: white;
        border: 1px solid black;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        transition: box-shadow 0.3s ease-in-out;
    }

    button:hover {
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
    }
</style>
</head>
<body>

<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

<div class="container">
    <h2>Contact / Support</h2>
    <p>Tell us what you like, what you would like to see, bug reports and support questions are all welcome!</p>

    <form action="ContactServlet" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <textarea name="comments" placeholder="Comments" required></textarea>
        <button type="submit">Send</button>
    </form>
</div>

</body>
</html>
