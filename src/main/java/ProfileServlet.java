// ProfileServlet.java
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) 
public class ProfileServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/RecipeFinder";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        Part filePart = request.getPart("profileImage");

        if (filePart != null && filePart.getSize() > 0) {
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 InputStream inputStream = filePart.getInputStream()) {

                String checkSQL = "SELECT user_id FROM profile_images WHERE user_id = ?";
                PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
                checkStmt.setInt(1, userId);
                if (checkStmt.executeQuery().next()) {
                    String updateSQL = "UPDATE profile_images SET image = ? WHERE user_id = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                    updateStmt.setBlob(1, inputStream);
                    updateStmt.setInt(2, userId);
                    updateStmt.executeUpdate();
                } else {
                    String insertSQL = "INSERT INTO profile_images (user_id, image) VALUES (?, ?)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
                    insertStmt.setInt(1, userId);
                    insertStmt.setBlob(2, inputStream);
                    insertStmt.executeUpdate();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("Profile.jsp");
    }
}
