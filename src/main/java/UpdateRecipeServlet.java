import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UpdateRecipeServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class UpdateRecipeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // Change this to a path relative to your web application
    private static final String IMAGE_UPLOAD_DIR = "uploads/images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get application context path for file storage
        String appPath = request.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + IMAGE_UPLOAD_DIR;
        
        // Create upload directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        int recipeId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String ingredients = request.getParameter("ingredients");
        String instructions = request.getParameter("instructions");
        String videoLink = request.getParameter("videoLink");
        Part filePart = request.getPart("recipeImage");

        String fileName = "";
        boolean isNewImageUploaded = filePart != null && filePart.getSize() > 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            // First, get the current image name
            String fetchSql = "SELECT image FROM Recipes WHERE id=?";
            PreparedStatement fetchStmt = conn.prepareStatement(fetchSql);
            fetchStmt.setInt(1, recipeId);
            ResultSet rs = fetchStmt.executeQuery();
            
            if (rs.next()) {
                fileName = rs.getString("image"); // Keep existing image by default
            }
            rs.close();
            fetchStmt.close();

            if (isNewImageUploaded) {
                // Generate a unique file name to prevent overwriting
                String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                fileName = "recipe_" + recipeId + "_" + System.currentTimeMillis() + fileExtension;
                
                // Save the file
                Path filePath = Paths.get(uploadPath, fileName);
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                }
            }

            String sql = "UPDATE Recipes SET name=?, ingredients=?, instructions=?, video_link=?, image=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, ingredients);
            stmt.setString(3, instructions);
            stmt.setString(4, videoLink);
            stmt.setString(5, fileName);
            stmt.setInt(6, recipeId);

            int rowsUpdated = stmt.executeUpdate();
            stmt.close();
            conn.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("RecipeList.jsp?update=success");
            } else {
                response.sendRedirect("UpdateRecipe.jsp?id=" + recipeId + "&update=failure");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("UpdateRecipe.jsp?id=" + recipeId + "&update=error");
        }
    }
}