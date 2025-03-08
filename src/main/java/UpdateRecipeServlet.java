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
    private static final String IMAGE_UPLOAD_DIR = "C:/Users/Rohit/OneDrive/Desktop/RecipeFinder/uploads/images"; // Change to your image directory

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int recipeId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String ingredients = request.getParameter("ingredients");
        String instructions = request.getParameter("instructions");
        String videoLink = request.getParameter("videoLink");
        Part filePart = request.getPart("recipeImage");

        String fileName = "";
        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            File uploadsDir = new File(IMAGE_UPLOAD_DIR);
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }
            Path filePath = Paths.get(IMAGE_UPLOAD_DIR, fileName);
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
            }
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            String sql = "UPDATE Recipes SET name = ?, ingredients = ?, instructions = ?, video_link = ?" +
                         (fileName.isEmpty() ? "" : ", image = ?") + " WHERE id = ?";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, ingredients);
            stmt.setString(3, instructions);
            stmt.setString(4, videoLink);
            if (!fileName.isEmpty()) {
                stmt.setString(5, fileName);
                stmt.setInt(6, recipeId);
            } else {
                stmt.setInt(5, recipeId);
            }

            stmt.executeUpdate();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("RecipeList.jsp");
    }
}
