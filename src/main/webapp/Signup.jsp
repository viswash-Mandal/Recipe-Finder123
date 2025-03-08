<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>

<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    body {
    font-family: 'Capriola', sans-serif;
    //background-image: url('Signup.jpeg');
    margin: 0;
    padding: 0;
    text-align: center;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
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

    .container {
        width: 35%;
        margin: auto;
        padding: 40px;
        border-radius: 10px;
        margin-top: 20px;
        text-align: center;
    }

    .sign {
        text-align: start;
    }

    h3 {
        margin-left: -40px;
    }

    input[type="text"], input[type="email"], input[type="password"] {
        width: 75%;
        padding: 15px;
        margin: 12px 0;
        border: 1px solid #ccc;
        border-radius: 20px;
        font-size: 18px;
        text-align: center;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    button {
        width: 45%;
        padding: 12px;
        background-color: white;
        border: 1px solid black;
        border-radius: 20px;
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

    .login-link {
        margin-top: 15px;
        font-size: 14px;
    }

    .login-link a {
        color: blue;
        text-decoration: none;
    }
</style>
</head>
<body>

<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

<div class="container">
    <div class="sign">
        <h3>Create your account</h3>
    </div>
    <form action="SignUpServlet" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Sign up</button>
    </form>

    <div class="login-link">
        Already got an account? <a href="Login.jsp">Sign in</a>
    </div>
</div>

</body>
</html>
