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
            max-width: 800px;
            padding: 20px;
        }
        
        .search-box {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

.search-box input {
    width: 57vh;
    padding: 10px;
    border: 2px solid #ccc;
    border-radius: 25px;
    outline: none;
    transition: all 0.3s ease-in-out;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

.search-box input:focus {
    border-color: #007bff;
    box-shadow: 0px 0px 8px rgba(0, 123, 255, 0.5);
}

.search-box button {
    margin-left: 10px;
    padding: 10px 15px;
    border: none;
    background-color: #007bff;
    color: white;
    font-size: 16px;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

.search-box button:hover {
    background-color: #0056b3;
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
    </style>
</head>
<body>

<div class="container">
    <h2>Recipe List</h2>
</div>

<div class="container">
    <div class="search-box">
        <form method="GET" action="RecipeList.jsp">
            <input type="text" name="query" placeholder="Search recipe..." 
                   value="<%= request.getParameter("query") != null ? request.getParameter("query") : "" %>">
            <button type="submit">Search</button>
        </form>
    </div>
</div>

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
                String searchQuery = request.getParameter("query") == null ? "" : request.getParameter("query");

                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeFinder", "root", "root");
                     PreparedStatement stmt = conn.prepareStatement(
                         searchQuery.isEmpty() ? "SELECT id, name FROM Recipes" :
                         "SELECT id, name FROM Recipes WHERE name LIKE ?")) {

                    if (!searchQuery.isEmpty()) {
                        stmt.setString(1, "%" + searchQuery + "%");
                    }

                    ResultSet rs = stmt.executeQuery();
                    boolean hasResults = false;
                    
                    while (rs.next()) {
                        hasResults = true;
                        int recipeId = rs.getInt("id");
                        String recipeName = rs.getString("name");
            %>
                        <tr>
                            <td><%= recipeName %></td>
                            <td>
                                <button type="button" class="btn-action btn-edit" onclick="openUpdateModal(<%= recipeId %>)">
                                    <i class="fa fa-edit"></i>
                                </button>
                            </td>
                            <td>
                                <form method="POST" action="deleteRecipe.jsp" onsubmit="return confirmDelete();">
                                    <input type="hidden" name="id" value="<%= recipeId %>">
                                    <button type="submit" class="btn-action btn-delete">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </form>
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
                }
            %>
        </tbody>
    </table>
</div>

<!-- Update Recipe Modal -->
<div class="modal fade" id="updateRecipeModal" tabindex="-1" aria-labelledby="updateRecipeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateRecipeModalLabel">Update Recipe</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="updateRecipeContent">
                <!-- Content from UpdateRecipe.jsp will be loaded here -->
            </div>
        </div>
    </div>
</div>

<script>
    function openUpdateModal(recipeId) {
        var modalContent = document.getElementById("updateRecipeContent");
        modalContent.innerHTML = "<p>Loading...</p>";

        fetch("UpdateRecipe.jsp?id=" + recipeId)
            .then(response => response.text())
            .then(data => {
                modalContent.innerHTML = data;
            })
            .catch(error => {
                modalContent.innerHTML = "<p>Error loading recipe details.</p>";
            });

        var updateModal = new bootstrap.Modal(document.getElementById("updateRecipeModal"));
        updateModal.show();
    }

    function confirmDelete() {
        return confirm("Are you sure you want to delete this recipe?");
    }
</script>

</body>
</html>
