<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Capriola', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
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
        input[type="text"], input[type="password"] {
    		width: 75%; /* Increase width to 85% */
    		padding: 15px; /* Increase padding for more height */
    		margin: 12px 0; /* Adjust margin for better spacing */
    		border: 1px solid #ccc;
    		text-align:center;
    		border-radius: 20px;
    		font-size: 18px; /* Increase font size for better readability */
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
    		box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Updated box-shadow */
    		transition: box-shadow 0.3s ease-in-out; /* Smooth transition for shadow effect */
		}

		button:hover {
    		box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3); /* Increased shadow on hover */
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

<div class="header">
    <img src="logo.png" alt="Recipe Finder Logo">
    <div class="nav">
        <a href="Homepage.jsp">Home</a>
        <a href="RecipePage.jsp">Recipe</a>
        <a href="trendingpage.jsp">Trending</a>
        <a href="searchpage.jsp">Search</a>
    </div>
</div>

<div class="container">
    <div class="sign">
        <h3>Sign in to your account</h3>
    </div>
    
     <!-- Display error or success messages -->
    <% String error = request.getParameter("error");
       String success = request.getParameter("success");
       if (error != null) 
       { %>
           <p class="error"><%= error %></p>
    <% }
       else if (success != null) 
       { %>
           <p class="success"><%= success %></p>
    <% 
    	}
       %>
    
    
    <form action="LoginServlet" method="post">
        <input type="text" name="email" placeholder="Username or Email" required>
        <input type="password" name="password" placeholder="Password" required>
        
        <div class="options">
            <div class="remember">
                <input type="checkbox" name="rememberMe"> Remember Me
            </div>
            <div class="forgot-password">
                <a href="forgot-password.jsp">Forget Password?</a>
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
