import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.UUID;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder1", "root", "root");

            // Check if the email exists
            String sql = "SELECT * FROM users WHERE email = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Generate a unique token
                String token = UUID.randomUUID().toString();

                // Store token in database
                String updateSql = "UPDATE users SET reset_token = ? WHERE email = ?";
                stmt = conn.prepareStatement(updateSql);
                stmt.setString(1, token);
                stmt.setString(2, email);
                stmt.executeUpdate();

                // Send a reset password link (For now, just print it)
                String resetLink = "http://localhost:8080/RecipeFinder/ResetPassword.jsp?token=" + token;
                System.out.println("Reset Link: " + resetLink);

                response.sendRedirect("Login.jsp?message=Password reset link sent to your email.");
            } else {
                response.sendRedirect("ForgetPage.jsp?error=Email not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ForgetPage.jsp?error=Database error, please try again.");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
            try { if (conn != null) conn.close(); } catch (SQLException e) {}
        }
    }
}
