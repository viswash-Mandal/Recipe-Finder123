<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


<style>
 body {
    font-family: 'Capriola', sans-serif;
    background-image: url('login.jpg');
    margin: 0;
    padding: 0;
    text-align: center;
    background-size: cover; /* Ensures the image covers the entire body */
    background-repeat: no-repeat; /* Prevents the image from repeating */
    background-position: center; /* Centers the image */
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

    input[type="text"], input[type="password"] {
        width: 75%;
        padding: 15px;
        margin: 12px 0;
        border: 1px solid #ccc;
        text-align: center;
        border-radius: 20px;
        font-size: 18px;
    }

    .options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 75%;
        margin: 10px auto;
        font-size: 14px;
    }

    .remember {
        display: flex;
        align-items: center;
    }

    .remember input {
        margin-right: 5px;
    }

    .forgot-password a {
        text-decoration: none;
        color: blue;
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

    .signup {
        margin-top: 15px;
        font-size: 14px;
    }

    .signup a {
        color: blue;
        text-decoration: none;
    }

    .error {
        color: red;
        font-size: 16px;
    }

    .success {
        color: green;
        font-size: 16px;
    }
</style>
</head>
<body>

<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

<div class="container">
    <div class="sign">
        <h3>Sign in to your account</h3>
    </div>
    
    <!-- Display error or success messages -->
    <% String error = request.getParameter("error");
       String success = request.getParameter("success");
       if (error != null) { %>
           <p class="error"><%= error %></p>
    <% } else if (success != null) { %>
           <p class="success"><%= success %></p>
    <% } %>
    
    <form action="LoginServlet" method="post">
        <input type="text" name="email" placeholder=" Email" required>
        <input type="password" name="password" placeholder="Password" required>
        
        <div class="options">
            <div class="remember">
                <input type="checkbox" name="rememberMe"> Remember Me
            </div>
            <div class="forgot-password">
                <a href="ForgetPage.jsp">Forget Password?</a>
            </div>
        </div>

        <button type="submit">Login</button>
    </form>

    <div class="signup">
        Didn't have an account? <a href="Signup.jsp">Sign Up</a>
    </div>
</div>

</body>
</html>
