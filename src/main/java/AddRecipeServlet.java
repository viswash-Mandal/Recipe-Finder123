import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddRecipeServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 50, // 50MB
    maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class AddRecipeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String IMAGE_UPLOAD_DIRECTORY = "C:\\Users\\Rohit\\OneDrive\\Desktop\\RecipeFinder\\uploads\\images";
    private static final String VIDEO_UPLOAD_DIRECTORY = "C:\\Users\\Rohit\\OneDrive\\Desktop\\RecipeFinder\\uploads\\videos";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dbURL = "jdbc:mysql://localhost:3306/RecipeFinder?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Retrieve form data
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String ingredients = request.getParameter("ingredients");
            String instructions = request.getParameter("instructions");
            String videoLink = request.getParameter("videoLink"); // Optional video link
            Part imagePart = request.getPart("image");
            Part videoPart = request.getPart("video"); // Optional file upload

            if (name == null || category == null || ingredients == null || instructions == null || imagePart == null) {
                throw new Exception("Missing required fields");
            }

            // Handle image upload
            String imageFileName = saveUploadedFile(imagePart, IMAGE_UPLOAD_DIRECTORY);

            // Handle video upload (optional)
            String videoFileName = (videoPart != null && videoPart.getSize() > 0) ? 
                                    saveUploadedFile(videoPart, VIDEO_UPLOAD_DIRECTORY) : null;

            // Insert data into database
            String sql = "INSERT INTO Recipes (name, category, image, ingredients, instructions, youtubeLink, video_link) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, category);
            pstmt.setString(3, imageFileName);
            pstmt.setString(4, ingredients);
            pstmt.setString(5, instructions);
            pstmt.setString(6, (videoLink != null && !videoLink.isEmpty()) ? videoLink : null);
            pstmt.setString(7, videoFileName);
            pstmt.executeUpdate();

            response.sendRedirect("AddRecipe.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddRecipe.jsp?status=error");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    // Method to save uploaded files (image/video)
    private String saveUploadedFile(Part filePart, String uploadDir) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        String originalFileName = filePart.getSubmittedFileName();
        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String uniqueFileName = timeStamp + "_" + originalFileName;

        File directory = new File(uploadDir);
        if (!directory.exists()) directory.mkdirs();

        String filePath = uploadDir + File.separator + uniqueFileName;
        filePart.write(filePath);

        return uniqueFileName;
    }
}
