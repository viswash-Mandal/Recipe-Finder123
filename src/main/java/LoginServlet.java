import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usernameOrEmail = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            // SQL Query to find user by email or username and match password
            String sql = "SELECT id, username, role FROM users WHERE (email = ? OR username = ?) AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usernameOrEmail);
            stmt.setString(2, usernameOrEmail);
            stmt.setString(3, password); // ⚠️ Password stored as plain text

            rs = stmt.executeQuery();

            if (rs.next()) {
                // ✅ User authenticated, store details in session
                HttpSession session = request.getSession();
                int userId = rs.getInt("id"); // Step 2: Store `userId`
                String username = rs.getString("username");
                String role = rs.getString("role");

                session.setAttribute("userId", userId); // Step 2: Ensure `userId` is set
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // Step 4: Set session timeout and enable cookies
                session.setMaxInactiveInterval(30 * 60); // 30 minutes timeout
                response.addCookie(new jakarta.servlet.http.Cookie("JSESSIONID", session.getId()));

                // 🔥 Redirect based on role
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("AdminPanal.jsp");
                } else {
                    response.sendRedirect("HomePage.jsp");
                }
            } else {
                // ❌ Invalid login
                response.sendRedirect("Login.jsp?error=Invalid username or password.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp?error=Database error, please try again.");
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
