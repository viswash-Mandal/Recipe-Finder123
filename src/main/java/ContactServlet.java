import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get input values
        String email = request.getParameter("email");
        String comments = request.getParameter("comments");

        if (email == null || email.isEmpty() || comments == null || comments.isEmpty()) {
            response.getWriter().println("All fields are required!");
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Database connection (update credentials)
            String jdbcURL = "jdbc:mysql://localhost:3306/RecipeFinder";
            String dbUser = "root";
            String dbPassword = "root";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert query
            String sql = "INSERT INTO support_messages (email, message) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, comments);
            
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                // Redirect to support.jsp with a success message
                response.sendRedirect("support.jsp?message=success");
            } else {
                response.sendRedirect("support.jsp?message=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("support.jsp?message=error");
        } finally {
            // Close resources
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
