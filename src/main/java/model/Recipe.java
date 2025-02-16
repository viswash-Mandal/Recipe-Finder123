package model;

public class Recipe {
    private int id;
    private String name;
    private String category;
    private String image;
    private String ingredients;
    private String instructions;

    // Default constructor (required for DAO)
    public Recipe() {}

    // Parameterized constructor
    public Recipe(int id, String name, String category, String image, String ingredients, String instructions) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.image = image;
        this.ingredients = ingredients;
        this.instructions = instructions;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public String getImage() { return image; }
    public String getIngredients() { return ingredients; }
    public String getInstructions() { return instructions; }

    // Optional: Add setters if needed
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setCategory(String category) { this.category = category; }
    public void setImage(String image) { this.image = image; }
    public void setIngredients(String ingredients) { this.ingredients = ingredients; }
    public void setInstructions(String instructions) { this.instructions = instructions; }
}
