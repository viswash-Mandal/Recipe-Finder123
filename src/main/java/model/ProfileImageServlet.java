package model;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileImageServlet")
public class ProfileImageServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/RecipeFinder";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT image FROM profile_images WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next() && rs.getBytes("image") != null) {
                byte[] imageData = rs.getBytes("image");
                response.setContentType("image/jpeg");
                try (OutputStream os = response.getOutputStream()) {
                    os.write(imageData);
                }
            } else {
                response.sendRedirect("default_profile_image.png");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
