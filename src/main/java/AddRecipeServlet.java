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

    private static final String UPLOAD_DIRECTORY = "C:\\uploads";  

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dbURL = "jdbc:mysql://localhost:3306/RecipeFinder?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String ingredients = request.getParameter("ingredients");
            String instructions = request.getParameter("instructions");
            Part filePart = request.getPart("image");

            if (name == null || category == null || ingredients == null || instructions == null || filePart == null) {
                throw new Exception("Missing required fields");
            }

            String originalFileName = filePart.getSubmittedFileName();
            String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            String uniqueFileName = timeStamp + "_" + originalFileName;

            File uploadDir = new File(UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String filePath = UPLOAD_DIRECTORY + File.separator + uniqueFileName;
            filePart.write(filePath);

            String sql = "INSERT INTO Recipes (name, category, image, ingredients, instructions) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, category);
            pstmt.setString(3, uniqueFileName);
            pstmt.setString(4, ingredients);
            pstmt.setString(5, instructions);
            pstmt.executeUpdate();

            response.sendRedirect("AddRecipe.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddRecipe.jsp?status=error");
        }
    }
}
