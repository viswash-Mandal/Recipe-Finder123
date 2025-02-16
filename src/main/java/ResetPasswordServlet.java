import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("ResetPassword.jsp?error=Passwords do not match.");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder1", "root", "root");

            // Check if the token is valid
            String sql = "SELECT * FROM users WHERE reset_token = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, token);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Update the password
                String updateSql = "UPDATE users SET password = ?, reset_token = NULL WHERE reset_token = ?";
                stmt = conn.prepareStatement(updateSql);
                stmt.setString(1, newPassword);
                stmt.setString(2, token);
                stmt.executeUpdate();

                response.sendRedirect("Login.jsp?message=Password successfully changed.");
            } else {
                response.sendRedirect("ResetPassword.jsp?error=Invalid or expired token.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ResetPassword.jsp?error=Database error, please try again.");
        } finally {
            try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
    }
}
