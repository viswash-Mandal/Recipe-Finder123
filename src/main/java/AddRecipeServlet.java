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
    maxFileSize = 1024 * 1024 * 50,      // 50MB
    maxRequestSize = 1024 * 1024 * 100   // 100MB
)
public class AddRecipeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Define upload directories for images and videos
    private static final String IMAGE_UPLOAD_DIRECTORY = "C:\\Users\\Rohit\\eclipse-workspace\\Recipe-Finder123\\src\\main\\webapp\\uploads\\images";
    private static final String VIDEO_UPLOAD_DIRECTORY = "C:\\Users\\Rohit\\OneDrive\\Desktop\\RecipeFinder\\uploads\\videos";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/RecipeFinder?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Retrieve form data
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String ingredients = request.getParameter("ingredients");
            String instructions = request.getParameter("instructions");
            String videoLink = request.getParameter("videoLink"); // Optional video link
            Part imagePart = request.getPart("image");
            Part videoPart = request.getPart("video"); // Optional video file upload

            // Validate required fields
            if (name == null || name.isEmpty() || 
                category == null || category.isEmpty() || 
                ingredients == null || ingredients.isEmpty() || 
                instructions == null || instructions.isEmpty() || 
                imagePart == null || imagePart.getSize() == 0) {
                throw new Exception("Missing required fields");
            }

            // Handle image upload
            String imageFileName = saveUploadedFile(imagePart, IMAGE_UPLOAD_DIRECTORY);

            // Handle video upload (optional)
            String videoFileName = null;
            if (videoPart != null && videoPart.getSize() > 0) {
                videoFileName = saveUploadedFile(videoPart, VIDEO_UPLOAD_DIRECTORY);
            }

            // Insert data into the database
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

            // Refresh Eclipse workspace
            refreshEclipseWorkspace();

            // Redirect to the form with a success status
            response.sendRedirect("AddRecipe.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to the form with an error status
            response.sendRedirect("AddRecipe.jsp?status=error");
        } finally {
            // Close database resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Saves an uploaded file to the specified directory and returns the unique file name.
     *
     * @param filePart   The file part from the request.
     * @param uploadDir  The directory where the file should be saved.
     * @return The unique file name.
     * @throws IOException If an I/O error occurs.
     */
    private String saveUploadedFile(Part filePart, String uploadDir) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        // Generate a unique file name using a timestamp
        String originalFileName = filePart.getSubmittedFileName();
        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String uniqueFileName = timeStamp + "_" + originalFileName;

        // Create the upload directory if it doesn't exist
        File directory = new File(uploadDir);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        // Save the file to the upload directory
        String filePath = uploadDir + File.separator + uniqueFileName;
        filePart.write(filePath);

        return uniqueFileName;
    }

    /**
     * Refreshes the Eclipse workspace using a system command.
     */
    private void refreshEclipseWorkspace() {
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("cmd.exe", "/c", "eclipse -refresh");
            processBuilder.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
