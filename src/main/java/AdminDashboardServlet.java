//import java.io.*;
//
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.sql.*;
//
//public class AdminDashboardServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Ensure only admin has access
//        HttpSession adminSession = request.getSession(false);
//        if (adminSession == null || !"admin".equals(adminSession.getAttribute("role"))) {
//            response.sendRedirect("Login.jsp?error=Unauthorized access");
//            return;
//        }
//
//        // Database connection
//        String url = "jdbc:mysql://localhost:3306/RecipeFinder";
//        String username = "root";
//        String password = "root";
//        
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        int vegetarianCount = 0;
//        int nonVegetarianCount = 0;
//        int bakingCount = 0;
//        int partyCount = 0;
//        int saladCount = 0;
//        int dessertsCount = 0;
//        int soupCount = 0;
//        int healthyCount = 0;
//        int sweetsCount = 0;
//        int userCount = 0;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(url, username, password);
//
//            String query = "SELECT category, COUNT(*) AS count FROM Recipes GROUP BY category";
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                String category = rs.getString("category");
//                int count = rs.getInt("count");
//                switch (category) {
//                    case "Vegetarian": vegetarianCount = count; break;
//                    case "Non-Vegetarian": nonVegetarianCount = count; break;
//                    case "Baking": bakingCount = count; break;
//                    case "Party": partyCount = count; break;
//                    case "Salad": saladCount = count; break;
//                    case "Desserts": dessertsCount = count; break;
//                    case "Soup": soupCount = count; break;
//                    case "Healthy": healthyCount = count; break;
//                    case "Sweets": sweetsCount = count; break;
//                }
//            }
//
//            // Query to count the number of users
//            String userQuery = "SELECT COUNT(*) AS userCount FROM Users";
//            ps = conn.prepareStatement(userQuery);
//            rs = ps.executeQuery();
//
//            if (rs.next()) {
//                userCount = rs.getInt("userCount");
//            }
//
//            // Set attributes for JSP page
//            request.setAttribute("vegetarianCount", vegetarianCount);
//            request.setAttribute("nonVegetarianCount", nonVegetarianCount);
//            request.setAttribute("bakingCount", bakingCount);
//            request.setAttribute("partyCount", partyCount);
//            request.setAttribute("saladCount", saladCount);
//            request.setAttribute("dessertsCount", dessertsCount);
//            request.setAttribute("soupCount", soupCount);
//            request.setAttribute("healthyCount", healthyCount);
//            request.setAttribute("sweetsCount", sweetsCount);
//            request.setAttribute("userCount", userCount);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
//            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
//            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
//        }
//
//        // Forward to the JSP page
//        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminPanel.jsp");
//        dispatcher.forward(request, response);
//    }
//}
