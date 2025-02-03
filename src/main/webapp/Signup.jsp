<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>

<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
 <style>
        body {
            font-family: 'Capriola', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .header {
            background-color: #e40046;
            color: white;
            padding: 9px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header img {
            width: 50px;
            height: 50px;
            margin-left: 20px;
        }
        .nav {
            display: flex;
            gap: 20px;
            margin-right: 20px;
        }
        .nav a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }
        .container {
            width: 35%;
            margin: auto;
            padding: 40px;
            border-radius: 10px;
            margin-top: 50px;
            text-align: center;
        }
        
        .sign {
            text-align: start;
        }
        h3 {
            margin-left: -40px;
        }
        
        input[type="text"], input[type="email"], input[type="password"] {
    		width: 75%;/* Match width with login page */
    		padding: 15px; /* Match padding for height */
    		margin: 12px 0; /* Adjust margin for spacing */
    		border: 1px solid #ccc;
    		border-radius: 20px;
    		font-size: 18px; /* Increase font size for better readability */
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
    		box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Updated box-shadow */
    		transition: box-shadow 0.3s ease-in-out; /* Smooth transition for shadow effect */
		}

		button:hover {
    		box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3); /* Increased shadow on hover */
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

<div class="header">
    <img src="logo.png" alt="Recipe Finder Logo">
    <div class="nav">
        <a href="Homepage.jsp">Home</a>
        <a href="recipe.jsp">Recipe</a>
        <a href="trending.jsp">Trending</a>
        <a href="search.jsp">Search</a>
    </div>
</div>

<div class="container">
    <div class= "sign">
    	<h3>Create your account</h3>
    </div>
    <form action="SignupServlet" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Sign up</button>
</form>

    <div class="login-link">
        Already got an account? <a href="login.jsp">Sign in</a>
    </div>
</div>

</body>
</html>
