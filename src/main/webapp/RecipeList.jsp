<%@ page import="java.util.List" %>
<%@ page import="model.Recipe" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Recipes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: auto;
            margin: auto;
            padding: 20px;
        }

        .search-box {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
            align-items: center;
        }

        .search-box input {
            padding: 8px;
            width: 70%;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-box button {
            padding: 8px 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .icon-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            color: #333;
        }

        .delete-icon {
            color: red;
        }

        .icon-btn:hover {
            opacity: 0.7;
        }

        .back-arrow {
            text-align: left;
            padding: 20px;
            font-size: 22px;
        }

        .back-arrow a {
            text-decoration: none;
            color: black;
        }

        .back-arrow a:hover {
            color: #555;
        }
    </style>
</head>
<body>

<!-- Back Arrow -->
<div class="back-arrow">
    <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
</div>

<div class="container">
    <!-- Search Box -->
    <div class="search-box">
        <form onsubmit="event.preventDefault(); searchRecipes();">
            <input type="text" id="searchInput" name="query" placeholder="Search recipe..." required>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>

    <!-- Recipe Table -->
    <table id="recipeTable">
        <tr>
            <th>Name</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <tbody id="recipeTableBody">
            <%
                List<Recipe> recipes = (List<Recipe>) request.getAttribute("recipeList");
                if (recipes != null && !recipes.isEmpty()) {
                    for (Recipe recipe : recipes) {
            %>
            <tr>
                <td><%= recipe.getName() %></td>
                <td><button class="icon-btn" onclick="editRecipe(<%= recipe.getId() %>)"><i class="fas fa-edit"></i></button></td>
                <td><button class="icon-btn delete-icon" onclick="confirmDelete(<%= recipe.getId() %>)"><i class="fas fa-trash-alt"></i></button></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="3">No recipes found.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<script>
function searchRecipes() {
    let query = document.getElementById("searchInput").value;

    fetch("RecipeListServlet?query=" + query)
        .then(response => response.json())
        .then(data => {
            let tableBody = document.getElementById("recipeTableBody");
            tableBody.innerHTML = ""; // Clear previous results

            if (data.length === 0) {
                tableBody.innerHTML = "<tr><td colspan='3'>No recipes found.</td></tr>";
                return;
            }

            data.forEach(recipe => {
                let row = `<tr>
                    <td>${recipe.name}</td>
                    <td><button class="icon-btn" onclick="editRecipe(${recipe.id})"><i class="fas fa-edit"></i></button></td>
                    <td><button class="icon-btn delete-icon" onclick="confirmDelete(${recipe.id})"><i class="fas fa-trash-alt"></i></button></td>
                </tr>`;
                tableBody.innerHTML += row;
            });
        })
        .catch(error => console.error('Error:', error));
}

</script>

</body>
</html>
