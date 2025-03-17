<%@ page import="java.sql.*" %>

<%
    String recipeId = request.getParameter("recipeId");
    String action = request.getParameter("action");
    String userId = "1"; // Replace with dynamic user ID if applicable

    if (recipeId != null && action != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            if (action.equals("add")) {
                // Add to favorites
                String insertSQL = "INSERT INTO favorites (user_id, recipe_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE recipe_id = recipe_id";
                PreparedStatement stmt = conn.prepareStatement(insertSQL);
                stmt.setString(1, userId);
                stmt.setString(2, recipeId);
                stmt.executeUpdate();
                stmt.close();
            } else if (action.equals("remove")) {
                // Remove from favorites
                String deleteSQL = "DELETE FROM favorites WHERE user_id = ? AND recipe_id = ?";
                PreparedStatement stmt = conn.prepareStatement(deleteSQL);
                stmt.setString(1, userId);
                stmt.setString(2, recipeId);
                stmt.executeUpdate();
                stmt.close();
            }

            conn.close();
            out.print("success");
        } catch (Exception e) {
            out.print("error: " + e.getMessage());
        }
    } else {
        out.print("invalid request");
    }
%>
