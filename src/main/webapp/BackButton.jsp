<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Back Arrow Button</title>

<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


<style>
	
    .back-arrow {
    	position:fixed;
        text-align: left;
        padding: 20px;
        font-size: 22px;
    }

    .back-arrow a {
        text-decoration: none;
        color: black;
    }
</style>
</head>
<body>
	
	<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>
</body>
</html>