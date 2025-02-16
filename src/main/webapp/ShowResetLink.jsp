<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password Link</title>
</head>
<body>
    <h2>Password Reset Link</h2>
    <p>Click the link below to reset your password:</p>
    <p><a href="<%= request.getAttribute("resetLink") %>"><%= request.getAttribute("resetLink") %></a></p>
</body>
</html>
