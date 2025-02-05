//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.ArrayList;
//import java.util.List;
//
//import org.json.JSONObject;
//
///**
// * Servlet implementation class SearchRecipeServlet
// */
//@WebServlet("/SearchRecipeServlet")
//public class SearchRecipeServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public SearchRecipeServlet() {
//        super();
//    }
//
//    /**
//     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//     */
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Get the search query from the request
//        String query = request.getParameter("query");
//        if (query == null || query.isEmpty()) {
//            request.setAttribute("errorMessage", "Please enter a search term.");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/searchpage.jsp");
//            dispatcher.forward(request, response);
//            return;
//        }
//
//        // Make the API call to fetch recipes
//        String apiUrl = "https://www.themealdb.com/api/json/v1/1/search.php?s=" + query;
//        HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
//        connection.setRequestMethod("GET");
//        connection.setConnectTimeout(5000);
//        connection.setReadTimeout(5000);
//
//        // Read the response from the API
//        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//        StringBuilder jsonResponse = new StringBuilder();
//        String line;
//        while ((line = reader.readLine()) != null) {
//            jsonResponse.append(line);
//        }
//        reader.close();
//
//        // Parse the JSON response
//        JSONObject json = new JSONObject(jsonResponse.toString());
//        List<Recipe> recipes = new ArrayList<>();
//        if (json.has("meals")) {
//            json.getJSONArray("meals").forEach(item -> {
//                JSONObject meal = (JSONObject) item;
//                Recipe recipe = new Recipe(
//                    meal.getString("strMeal"),
//                    meal.getString("strMealThumb"),
//                    meal.getString("idMeal")
//                );
//                recipes.add(recipe);
//            });
//        }
//
//        // Check if no results were found
//        if (recipes.isEmpty()) {
//            request.setAttribute("errorMessage", "No results found for '" + query + "'.");
//        }
//
//        // Set the recipe list as a request attribute
//        request.setAttribute("recipes", recipes);
//        
//        // Forward the request to the JSP page
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/searchpage.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    /**
//     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//     */
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//    
//    // Inner class to store recipe data
//    class Recipe {
//        String name;
//        String imageUrl;
//        String id;
//
//        public Recipe(String name, String imageUrl, String id) {
//            this.name = name;
//            this.imageUrl = imageUrl;
//            this.id = id;
//        }
//
//        public String getName() {
//            return name;
//        }
//
//        public String getImageUrl() {
//            return imageUrl;
//        }
//
//        public String getId() {
//            return id;
//        }
//    }
//}
