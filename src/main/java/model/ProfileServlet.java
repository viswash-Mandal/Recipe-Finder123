package model;


import java.io.IOException;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet("/model/ProfileServlet") // Use a different URL
@MultipartConfig(maxFileSize = 16177215)  // 16MB file size limit
public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        Part filePart = request.getPart("profileImage");

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream();
                 Connection conn = DatabaseConnection.getConnection()) {

                // Insert or update the profile image
                String sql = "INSERT INTO profile_images (user_id, image) VALUES (?, ?) " +
                             "ON DUPLICATE KEY UPDATE image = VALUES(image)";
                
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, userId);
                    stmt.setBlob(2, inputStream);
                    stmt.executeUpdate();
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());  // Debugging output
            }
        }
        response.sendRedirect("Profile.jsp");
    }
}