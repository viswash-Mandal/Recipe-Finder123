<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Get recipe ID from the request
    String recipeId = request.getParameter("id");

    // Check if ID is valid
    if (recipeId != null && !recipeId.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            // Prepare SQL DELETE query
            String sql = "DELETE FROM Recipes WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(recipeId));

            // Execute deletion
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Redirect back to RecipeList.jsp with success message
                response.sendRedirect("RecipeList.jsp?msg=deleted");
            } else {
                // Redirect back with an error message
                response.sendRedirect("RecipeList.jsp?msg=notfound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("RecipeList.jsp?msg=error");
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    } else {
        response.sendRedirect("RecipeList.jsp?msg=invalid");
    }
%>
	

# delete recipe from database