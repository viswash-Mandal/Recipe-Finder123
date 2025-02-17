<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<%
    response.setContentType("application/json");
    JSONArray categoriesArray = new JSONArray();

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Make sure to use the correct driver
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

        String sql = "SELECT category, COUNT(*) AS count FROM Recipes GROUP BY category";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()) {
            JSONObject categoryObj = new JSONObject();
            categoryObj.put("name", rs.getString("category"));
            categoryObj.put("count", rs.getInt("count"));
            categoriesArray.put(categoryObj);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    out.print(categoriesArray.toString());
%>
