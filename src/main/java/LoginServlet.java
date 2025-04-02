import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
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
        String rememberMe = request.getParameter("rememberMe");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // **Admin Login Check (Before DB Query)**
            if ("kalu@admin.com".equalsIgnoreCase(usernameOrEmail) && "123456".equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("userId", 0);
                session.setAttribute("username", "Admin");
                session.setAttribute("role", "admin");

                session.setMaxInactiveInterval(30 * 60);
                response.sendRedirect("AdminPanal.jsp");
                return;
            }

            // **Database Connection**
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

            // **SQL Query**
            String sql = "SELECT id, username FROM Users WHERE (email = ? OR username = ?) AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usernameOrEmail);
            stmt.setString(2, usernameOrEmail);
            stmt.setString(3, password);

            rs = stmt.executeQuery();

            if (rs.next()) {
                // **User Found - Create Session**
                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("role", "user");

                session.setMaxInactiveInterval(30 * 60);

                // **Remember Me - Save Email in Cookie**
                if ("on".equals(rememberMe)) {
                    Cookie loginCookie = new Cookie("userEmail", usernameOrEmail);
                    loginCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                    response.addCookie(loginCookie);
                } else {
                    // **Remove Cookie if Remember Me is unchecked**
                    Cookie loginCookie = new Cookie("userEmail", "");
                    loginCookie.setMaxAge(0); // Delete the cookie
                    response.addCookie(loginCookie);
                }

                response.sendRedirect("HomePage.jsp");
            } else {
                response.sendRedirect("Login.jsp?error=Invalid username or password.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp?error=Database error, please try again.");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
