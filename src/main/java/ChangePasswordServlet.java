//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/ChangePasswordServlet")
//public class ChangePasswordServlet extends HttpServlet {
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/RecipeFinder";
//    private static final String DB_USER = "root";
//    private static final String DB_PASS = "root";
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("userId") == null) {
//            response.sendRedirect("Login.jsp");
//            return;
//        }
//
//        int userId = (int) session.getAttribute("userId");
//        String currentPassword = request.getParameter("currentPassword");
//        String newPassword = request.getParameter("newPassword");
//        String confirmPassword = request.getParameter("confirmPassword");
//
//        if (!newPassword.equals(confirmPassword)) {
//            response.sendRedirect("ChangePassword.jsp?error=Passwords do not match");
//            return;
//        }
//
//        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
//            // Check if current password is correct
//            String checkSql = "SELECT password FROM users WHERE id = ?";
//            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
//            checkStmt.setInt(1, userId);
//            ResultSet rs = checkStmt.executeQuery();
//
//            if (rs.next() && !rs.getString("password").equals(currentPassword)) {
//                response.sendRedirect("ChangePassword.jsp?error=Incorrect current password");
//                return;
//            }
//
//            // Update the password
//            String updateSql = "UPDATE users SET password = ? WHERE id = ?";
//            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
//            updateStmt.setString(1, newPassword);
//            updateStmt.setInt(2, userId);
//            updateStmt.executeUpdate();
//
//            response.sendRedirect("Profile.jsp?success=Password changed successfully");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("ChangePassword.jsp?error=Something went wrong");
//        }
//    }
//}
