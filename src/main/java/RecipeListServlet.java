import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Recipe;

@WebServlet("/RecipeListServlet")
public class RecipeListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/RecipeFinder";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Recipe> recipeList = new ArrayList<>();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String query = request.getParameter("query");
                String sql = "SELECT id, name FROM Recipes";

                if (query != null && !query.trim().isEmpty()) {
                    sql = "SELECT id, name FROM Recipes WHERE name LIKE ?";
                }

                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    if (query != null && !query.trim().isEmpty()) {
                        pstmt.setString(1, "%" + query + "%");
                    }

                    try (ResultSet rs = pstmt.executeQuery()) {
                        while (rs.next()) {
                            Recipe recipe = new Recipe(rs.getInt("id"), rs.getString("name"));
                            recipeList.add(recipe);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String json = new Gson().toJson(recipeList);
        response.getWriter().write(json);
    }
}
