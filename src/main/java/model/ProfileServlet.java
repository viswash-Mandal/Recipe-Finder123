package model;

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

                String sql = "REPLACE INTO profile_images (user_id, image) VALUES (?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                stmt.setBlob(2, inputStream);
                stmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("Profile.jsp");
    }
}
