import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Recipe;

public class RecipeDAO {
	public List<Recipe> getRecipesByCategory(String category) {
	    List<Recipe> recipes = new ArrayList<>();
	    String query = "SELECT * FROM recipes WHERE category = ?";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {
	         
	        stmt.setString(1, category);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Recipe recipe = new Recipe(
	                rs.getInt("id"),
	                rs.getString("name"),
	                rs.getString("category"),
	                rs.getString("image"),
	                rs.getString("ingredients"),
	                rs.getString("instructions"),
	                rs.getString("youtubeLink"),
	                rs.getString("video_link")
	            );

	            System.out.println("Recipe Found: " + recipe.getName()); // Debugging line
	            recipes.add(recipe);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return recipes;
	}

}
