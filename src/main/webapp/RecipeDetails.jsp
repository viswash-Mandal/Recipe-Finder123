<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Details</title>

    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            color: #000000;
            text-align: center;
        }
        
        img {
            height: 500px;
            width: 500px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        /* Styling the back arrow */
        .back-arrow {
            cursor: pointer;
            font-size: 24px;
            color: #333;
            transition: color 0.3s ease;
        }

        .back-arrow:hover {
            color: #007bff;
        }

        h2 {
            text-align: start;
            font-size: 1.5rem;
            margin: 20px 0 10px;
        }
        p {
            margin: 10px 0;
        }
        .ingredient-container {
            margin: 15px 0;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .ingredient-con {
            justify-content: center;
            align-items: center;
            margin-right: 150px;
            margin-left: 150px; /* Center the container horizontally */
        }
        
        .instruction-container {
            margin: 15px 0;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        .instruction-container p {
            margin: 0;
            line-height: 1.5;
        }

        .ingredient-container span {
            font-weight: bold;
        }
    </style>
</head>
<body>

    <!-- Back arrow added with proper class for visibility -->
    <h1>
        <i class="fas fa-arrow-left back-arrow" onclick="history.back()"></i> Recipe Details
    </h1>

    <div class="container">
        <h1 id="mealTitle">Recipe Title</h1>
        <img id="mealImage" alt="Meal Image">

        <h2>Ingredients</h2>
        <div class="ingredient-con">
            <div id="mealIngredients">
                <!-- Individual ingredient containers will be dynamically inserted here -->
            </div>
        </div>

        <h2>Instructions</h2>
        <div id="mealInstructions">
            <!-- Individual instruction containers will be dynamically inserted here -->
        </div>
    </div>

    <script>
        function getMealDetails() {
            const urlParams = new URLSearchParams(window.location.search);
            const mealId = urlParams.get("mealId");

            console.log("Extracted mealId:", mealId); // Debugging
            
            if (!mealId) {
                alert("Meal ID is missing!");
                return;
            }

            fetch(`https://www.themealdb.com/api/json/v1/1/lookup.php?i=${mealId}`)
                .then(response => response.json())

                .then(data => {
                    if (!data.meals) {
                        document.body.innerHTML = "<h2>Meal not found!</h2>";
                        return;
                    }

                    const meal = data.meals[0];
                    document.getElementById("mealTitle").innerText = meal.strMeal;
                    document.getElementById("mealImage").src = meal.strMealThumb;

                    // Display Ingredients
                    const ingredientsContainer = document.getElementById("mealIngredients");
                    for (let i = 1; i <= 20; i++) {
                        const ingredient = meal[`strIngredient${i}`];
                        const measure = meal[`strMeasure${i}`];
                        if (ingredient && ingredient.trim() !== "") {
                            const ingredientDiv = document.createElement("div");
                            ingredientDiv.classList.add("ingredient-container");
                            ingredientDiv.innerHTML = `<span>${ingredient}</span><span>${measure}</span>`;
                            ingredientsContainer.appendChild(ingredientDiv);
                        }
                    }

                    // Display Instructions
                    const instructionsContainer = document.getElementById("mealInstructions");
                    const instructions = meal.strInstructions.split(". ");
                    instructions.forEach((step, index) => {
                        if (step.trim() !== "") {
                            const instructionDiv = document.createElement("div");
                            instructionDiv.classList.add("instruction-container");
                            instructionDiv.innerHTML = `<p><strong>Step ${index + 1}:</strong> ${step.trim()}.</p>`;
                            instructionsContainer.appendChild(instructionDiv);
                        }
                    });
                });
        }

        window.onload = getMealDetails;
    </script>

</body>
</html>
