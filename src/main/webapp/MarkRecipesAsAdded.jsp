<%@ page import="java.sql.*, org.json.JSONObject" %>
<%@ page contentType="application/json" %>
<%
    String recipeIds = request.getParameter("recipe_ids");
    JSONObject result = new JSONObject();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");
        
        // Delete the marked recipes from MissingRecipes table
        PreparedStatement stmt = conn.prepareStatement(
            "DELETE FROM MissingRecipes WHERE id IN (" + recipeIds + ")");
        int rowsAffected = stmt.executeUpdate();
        
        result.put("success", rowsAffected > 0);
        result.put("message", "Marked " + rowsAffected + " recipes as added");
        
        stmt.close();
        conn.close();
    } catch (Exception e) {
        result.put("success", false);
        result.put("message", e.getMessage());
    }
    
    out.print(result.toString());
%>