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
            // **Admin Login Check (Before DB Query)**
            if ("kalu@admin.com".equalsIgnoreCase(usernameOrEmail) && "123456".equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("userId", 0);  // Admin does not exist in DB, so set a default ID
                session.setAttribute("username", "Admin");
                session.setAttribute("role", "admin");

                session.setMaxInactiveInterval(30 * 60); // 30-minute session timeout
                response.sendRedirect("AdminDashboard.jsp"); // Redirect Admin
                return; // ✅ **Exit method to prevent unnecessary DB query**
            }

            // **Database Connection**
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            // **SQL Query for Regular Users**
            String sql = "SELECT id, username FROM Users WHERE (email = ? OR username = ?) AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usernameOrEmail);
            stmt.setString(2, usernameOrEmail);
            stmt.setString(3, password); // ⚠️ Plaintext password - Consider hashing!

            rs = stmt.executeQuery();

            if (rs.next()) {
                // **User Found - Store in Session**
                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("role", "user");  // Regular users have no role column in DB

                session.setMaxInactiveInterval(30 * 60); // 30-minute session timeout
                response.sendRedirect("Home.jsp"); // Redirect User
            } else {
                // **Invalid Login**
                response.sendRedirect("Login.jsp?error=Invalid username or password.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp?error=Database error, please try again.");
        } finally {
            // **Close Database Resources**
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

}
