<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Recipe</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        
        

        h1 {
            text-align: center;
            color: #333;
        }

        .back-container a {
        	padding: 15px;
            text-decoration: none;
            color: black;
            font-size: 22px;
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="file"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="back-container">
        <a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
    </div>

    <h1>Add Recipe</h1>

    <form action="AddRecipeServlet" method="post" enctype="multipart/form-data">
        <label for="image">Image:</label>
        <input type="file" name="image" id="image" required><br>

        <label for="ingredients">Ingredients:</label>
        <textarea name="ingredients" id="ingredients" required></textarea><br>

        <label for="instructions">Instructions:</label>
        <textarea name="instructions" id="instructions" required></textarea><br>

        <input type="submit" value="Add Recipe">
    </form>

    <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    Recipe added successfully!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="redirect()">OK</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Error Modal -->
    <div class="modal fade" id="errorModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Error</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    Error adding recipe. Please try again.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" onclick="redirect()">OK</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function redirect() {
            window.location.href = "AddRecipe.jsp"; // Redirect back to the form
        }

        // Show modal based on URL parameters
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('status') === 'success') {
                new bootstrap.Modal(document.getElementById('successModal')).show();
            } else if (urlParams.get('status') === 'error') {
                new bootstrap.Modal(document.getElementById('errorModal')).show();
            }
        };
    </script>

</body>
</html>
