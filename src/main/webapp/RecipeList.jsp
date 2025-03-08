<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Recipe List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        .container {
        	
        	border-radius:1px solid black;
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        
        .container1 {
        	border: 1px solid black;
        	border-radius: 10px;
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            color: black;
        }

        .search-box {
            margin-bottom: 20px;
        }

        .search-box input {
        	background: transparent;
            padding: 8px;
            width: 60%;
            border-radius: 10px;
            border: 1px solid black;
        }

        .search-box button {
            padding: 8px 15px;
            border-radius: 10px;
            font-weight: bold;
            background-color: white;
            color: black;
            border: 1px solid black;
            cursor: pointer;
        }

        .search-box button:hover {
            background-color: transparent;
        }

        .btn-action {
            border: none;
            background: none;
            cursor: pointer;
            font-size: 18px;
        }

        .btn-edit {
            color: #ffc107;
        }

        .btn-delete {
            color: #dc3545;
        }

        .btn-edit:hover {
            color: #d39e00;
        }

        .btn-delete:hover {
            color: #a71d2a;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Recipe List</h2>
</div>

<!-- Search Box Container -->
<div class="container">
    <div class="search-box">
        <form method="GET" action="RecipeList.jsp">
            <input type="text" name="query" placeholder="Search recipe..." 
                   value="<%= request.getParameter("query") != null ? request.getParameter("query") : "" %>">
            <button type="submit">Search</button>
        </form>
    </div>
</div>

<!-- Recipe Table Container -->
<div class="container1">
    <table>
        <thead>
            <tr>
                <th>Recipe Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                String searchQuery = request.getParameter("query");
                if (searchQuery == null) {
                    searchQuery = "";
                }

                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Database Connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");

                    // SQL Query to fetch only the 'name' column
                    String sql = "SELECT id, name FROM Recipes";
                    if (!searchQuery.trim().isEmpty()) {
                        sql = "SELECT id, name FROM Recipes WHERE name LIKE ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, "%" + searchQuery + "%");
                    } else {
                        stmt = conn.prepareStatement(sql);
                    }

                    // Execute Query
                    rs = stmt.executeQuery();
                    boolean hasResults = false;
                    
                    while (rs.next()) {
                        hasResults = true;
                        int recipeId = rs.getInt("id");
                        String recipeName = rs.getString("name");
            %>
                        <tr>
                            <td><%= recipeName %></td>
                            <td>
                                <!-- Edit Button -->
                                <a href="UpdateRecipe.jsp?id=<%= recipeId %>" class="btn-action btn-edit">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                            <td>
                                <!-- Delete Button (Triggers Modal) -->
                                <button type="button" class="btn-action btn-delete" 
                                        onclick="showDeleteModal(<%= recipeId %>, '<%= recipeName %>')">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </td>
                        </tr>
            <%
                    }
                    
                    if (!hasResults) {
            %>
                        <tr>
                            <td colspan="3">No recipes found.</td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>
</div>

<!-- DELETE CONFIRMATION MODAL -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete <strong id="recipeName"></strong>?</p>
            </div>
            <div class="modal-footer">
                <form id="deleteForm" method="POST" action="deleteRecipe.jsp">
                    <input type="hidden" name="id" id="deleteRecipeId">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function showDeleteModal(recipeId, recipeName) {
        document.getElementById("recipeName").textContent = recipeName;
        document.getElementById("deleteRecipeId").value = recipeId;
        var deleteModal = new bootstrap.Modal(document.getElementById("deleteModal"));
        deleteModal.show();
    }
</script>

</body>
</html>
