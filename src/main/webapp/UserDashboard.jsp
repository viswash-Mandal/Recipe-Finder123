<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || !"user".equals(userSession.getAttribute("role"))) {
        response.sendRedirect("Login.jsp?error=Unauthorized access");
        return;
    }
%>
<h1>Welcome, <%= session.getAttribute("username") %></h1>
<a href="LogoutServlet">Logout</a>
	
</body>
</html>