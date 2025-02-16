<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Recipes</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<Style> 
		body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}


.back-container a {

            padding: 20px;
            text-decoration: none;
            color: black;
            font-size: 22px;
        }
.container {
    width: 50%;
    margin: 50px auto;
}

h1 {
    text-align: center;
    color: black;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    color: #333;
}

.form-group input[type="text"],
.form-group textarea,
.form-group input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 10px;
}

.form-group textarea {
    resize: vertical;
}

.btn-container {
        display: flex;
        justify-content: center;
    }

    .btn {
        width: 30%;
        background-color: transparent;
        border: 1px solid black;
        border-radius: 10px; /* Ensures the button has rounded corners */
        padding: 10px;
        cursor: pointer;
    }

	</Style>
</head>
<body>

	<div class="back-container">
        <a href="AdminPanal.jsp"><i class="fas fa-arrow-left"></i></a> <!-- Updated Back Button -->
    </div>
    <div class="container">
        <h1>Update Recipes</h1>
        <form action="UpdateRecipeServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="recipeName">Name of Recipe:</label>
                <input type="text" id="recipeName" name="recipeName" required>
            </div>
            
            <div class="form-group">
                <label for="recipeImage">Choose the image:</label>
                <input type="file" id="recipeImage" name="recipeImage">
            </div>
            
            <div class="form-group">
                <label for="ingredients">Update Ingredient:</label>
                <textarea id="ingredients" name="ingredients" rows="4" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="instructions">Update Instruction:</label>
                <textarea id="instructions" name="instructions" rows="4" required></textarea>
            </div>
            
            <div class="btn-container">
    			<button type="submit" class="btn">Update</button>
			</div>	
        </form>
    </div>
</body>
</html>