package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/model/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String username = "Guest";

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT username FROM users WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("username", username);
        Cookie usernameCookie = new Cookie("username", username);
        usernameCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week
        response.addCookie(usernameCookie);
        
        response.sendRedirect("Profile.jsp");
    }
}
