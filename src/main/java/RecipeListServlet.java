//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import model.Recipe;
//
//@WebServlet("/RecipeListServlet")
//public class RecipeListServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/RecipeFinder";
//    private static final String DB_USER = "root";
//    private static final String DB_PASS = "root";
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Recipe> recipeList = new ArrayList<>();
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
//                String sql = "SELECT id, name FROM Recipes";
//
//                try (PreparedStatement pstmt = conn.prepareStatement(sql);
//                     ResultSet rs = pstmt.executeQuery()) {
//                    while (rs.next()) {
//                        Recipe recipe = new Recipe();
//                        recipe.setId(rs.getInt("id"));
//                        recipe.setName(rs.getString("name"));
//                        recipeList.add(recipe);
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new ServletException(e);
//        }
//
//        // Set the recipe list as a request attribute and forward to RecipeList.jsp
//        request.setAttribute("recipeList", recipeList);
//        request.getRequestDispatcher("RecipeList.jsp").forward(request, response);
//    }
//}
