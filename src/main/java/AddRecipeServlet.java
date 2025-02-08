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
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddRecipeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Define upload directory (Make sure this folder exists in Tomcat "webapps/uploads/")
    private static final String UPLOAD_DIRECTORY = "C:\\uploads";  // Change this to a valid folder

    public AddRecipeServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dbURL = "jdbc:mysql://localhost:3306/RecipeFinder?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Retrieve form data
            String ingredients = request.getParameter("ingredients");
            String instructions = request.getParameter("instructions");
            Part filePart = request.getPart("image");

            if (ingredients == null || instructions == null || filePart == null) {
                throw new Exception("Missing required fields");
            }

            String originalFileName = filePart.getSubmittedFileName();
            if (originalFileName == null || originalFileName.isEmpty()) {
                throw new Exception("Invalid image file");
            }

            // Generate unique file name
            String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            String uniqueFileName = timeStamp + "_" + originalFileName;

            // Ensure upload directory exists
            File uploadDir = new File(UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create the folder if not exists
            }

            // Save image in uploads directory
            String filePath = UPLOAD_DIRECTORY + File.separator + uniqueFileName;
            filePart.write(filePath);

            // Insert into database
            String sql = "INSERT INTO Recipes (image, ingredients, instructions) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uniqueFileName); // Store only the unique file name
            pstmt.setString(2, ingredients);
            pstmt.setString(3, instructions);
            pstmt.executeUpdate();

            // Redirect with success status
            response.sendRedirect("AddRecipe.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddRecipe.jsp?status=error");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
