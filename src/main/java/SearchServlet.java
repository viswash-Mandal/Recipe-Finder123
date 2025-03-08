//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import org.json.JSONArray;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/SearchServlet")
//public class SearchServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        String query = request.getParameter("query");
//        JSONArray recipeArray = new JSONArray();
//
//        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root")) {
//            // Load the JDBC driver
//            Class.forName("com.mysql.cj.jdbc.Driver");
//
//            String sql = (query != null && !query.trim().isEmpty()) 
//                ? "SELECT id, name, category, image FROM recipes WHERE LOWER(name) LIKE LOWER(?)" 
//                : "SELECT id, name, category, image FROM recipes";
//
//            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//                if (query != null && !query.trim().isEmpty()) {
//                    stmt.setString(1, "%" + query + "%");
//                }
//
//                try (ResultSet rs = stmt.executeQuery()) {
//                    while (rs.next()) {
//                        JSONObject recipe = new JSONObject();
//                        recipe.put("id", rs.getInt("id"));
//                        recipe.put("name", rs.getString("name"));
//                        recipe.put("category", rs.getString("category"));
//                        recipe.put("image", rs.getString("image"));
//                        recipeArray.put(recipe);
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        // Send JSON response
//        PrintWriter out = response.getWriter();
//        out.print(recipeArray);
//        out.flush();
//    }
//}
