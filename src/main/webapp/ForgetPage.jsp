<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        body {
        	font-family: 'Capriola', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height:100vh;
            overflow:hidden;
            position: relative;
        }
        h3 {
            color: black;
            margin-bottom: 20px;
            margin-right: 238px;
        }
        form {
            background-color:transparent;
            padding: 20px;
            width: 300px;
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="email"] {
        	background: transparent;
            width: 44vh;
            padding: 15px;
            margin-bottom: 16px;
            border: 1px solid black;
            border-radius: 25px;
            text-align: center;
            box-sizing: border-box;
        }
        
        button {
    		width: 45%;
    		padding: 12px;
    		background-color: transparent;
    		border: 1px solid black;
    		border-radius: 20px;
    		font-size: 15px;
    		font-weight: bold;
    		cursor: pointer;
    		margin-top: 10px;
    		box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    		transition: box-shadow 0.3s ease-in-out;
		}
		
        p {
            margin: 10px 0;
            color: black;
            text-align: center;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: none;
        }
        
        .input[type="email"] {
    		background: transparent;
    		width: 44vh;
    		padding: 15px;
    		margin-bottom: 16px;
    		border: 1px solid black;
    		border-radius: 25px;
    		text-align: center;
    		box-sizing: border-box;
    		font-size: 18px;
}
        .header {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .header i {
            font-size: 24px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <i class="fas fa-arrow-left" onclick="history.back()"></i>
    </div>

    <h3>Forget Your Password</h3>
    <form action="ForgotPasswordServlet" method="post">
        <input type="email" id="email" name="email" placeholder="Enter your mail" required>
        <button type="submit">Send Request</button>
    </form>

    <p>Has your email address changed?</p>

    <p>Already got an account? <a href="Login.jsp">sign in</a></p>
    <p>Didn't have an account? <a href="Signup.jsp">sign up</a></p>
</body>
</html>