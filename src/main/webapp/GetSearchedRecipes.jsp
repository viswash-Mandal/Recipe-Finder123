<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Database connection
    String url = "jdbc:mysql://localhost:3306/RecipeFinder";
    String username = "root";
    String password = "root";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // Fetch the most frequently searched missing recipes
        String query = "SELECT query, search_count, last_searched FROM missing_recipes ORDER BY search_count DESC";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        out.println("<ul>");
        while (rs.next()) {
            String queryTerm = rs.getString("query");
            int searchCount = rs.getInt("search_count");
            String lastSearched = rs.getTimestamp("last_searched").toString();
            out.println("<li>" + queryTerm + " (Searched " + searchCount + " times, Last searched: " + lastSearched + ")</li>");
        }
        out.println("</ul>");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>