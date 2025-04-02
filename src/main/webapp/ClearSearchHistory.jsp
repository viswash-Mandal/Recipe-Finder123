<%@ page import="java.sql.*, org.json.JSONObject" %>
<%@ page contentType="application/json" %>
<%
    JSONObject result = new JSONObject();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");
        
        // Clear all missing recipes
        PreparedStatement stmt = conn.prepareStatement("TRUNCATE TABLE MissingRecipes");
        stmt.executeUpdate();
        
        result.put("success", true);
        result.put("message", "Search history cleared successfully");
        
        stmt.close();
        conn.close();
    } catch (Exception e) {
        result.put("success", false);
        result.put("message", e.getMessage());
    }
    
    out.print(result.toString());
%>