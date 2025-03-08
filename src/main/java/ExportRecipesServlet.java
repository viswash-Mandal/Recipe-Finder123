import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;

import org.json.JSONObject;


@WebServlet("/ExportRecipesServlet")
public class ExportRecipesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String EXPORT_DIRECTORY = "C:\\Users\\Rohit\\OneDrive\\Desktop\\RecipeFinder\\From Database";  // Change to your preferred folder

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dbURL = "jdbc:mysql://localhost:3306/RecipeFinder?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Fetch all recipes
            String sql = "SELECT * FROM Recipes";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            JSONArray recipesArray = new JSONArray();

            while (rs.next()) {
                JSONObject recipe = new JSONObject();
                recipe.put("id", rs.getInt("id"));
                recipe.put("image", rs.getString("image"));
                recipe.put("ingredients", rs.getString("ingredients"));
                recipe.put("instructions", rs.getString("instructions"));
                recipe.put("created_at", rs.getString("created_at"));

                recipesArray.put(recipe);
            }

            // Check if there are recipes to export
            if (recipesArray.length() > 0) {
                // Ensure export directory exists
                File exportDir = new File(EXPORT_DIRECTORY);
                if (!exportDir.exists()) {
                    exportDir.mkdirs();
                }

                // Generate a unique filename
                String fileName = EXPORT_DIRECTORY + "\\recipes_" + System.currentTimeMillis() + ".json";

                // Write to JSON file
                FileWriter file = new FileWriter(fileName);
                file.write(recipesArray.toString(4)); // Pretty print with 4-space indentation
                file.flush();
                file.close();

                // **Delete all recipes after exporting**
                String deleteSql = "DELETE FROM Recipes";
                pstmt = conn.prepareStatement(deleteSql);
                pstmt.executeUpdate();

                response.getWriter().println("Recipes exported successfully to: " + fileName);
            } else {
                response.getWriter().println("No recipes found for export.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error exporting recipes.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
