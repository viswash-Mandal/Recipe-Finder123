import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String query = request.getParameter("query");
        if (query == null || query.trim().isEmpty()) {
            response.getWriter().write("{\"message\": \"Please enter a search term.\"}");
            return;
        }

        query = query.trim(); // Remove extra spaces
        List<Recipe> recipes = new ArrayList<>();

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");
                 PreparedStatement stmt = conn.prepareStatement(
                     "SELECT id, name, category, image FROM Recipes WHERE LOWER(name) LIKE LOWER(?) ORDER BY name ASC"
                 )) {

                String searchTerm = "%" + query + "%"; // Wildcard search
                stmt.setString(1, searchTerm);

                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String category = rs.getString("category");
                    String image = rs.getString("image");

                    recipes.add(new Recipe(id, name, category, image));
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return results in JSON format
        response.getWriter().write(new Gson().toJson(recipes));
    }

    // Inner class for Recipe
    public static class Recipe {
        int id;
        String name;
        String category;
        String image;

        Recipe(int id, String name, String category, String image) {
            this.id = id;
            this.name = name;
            this.category = category;
            this.image = image;
        }
    }
}
