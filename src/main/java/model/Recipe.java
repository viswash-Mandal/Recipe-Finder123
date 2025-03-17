package model;

public class Recipe {
    private int id;
    private String name;
    private String category;
    private String image;
    private String ingredients;
    private String instructions;
    private String youtubeLink;
    private String videoLink;

    // Default constructor
    public Recipe() {}

    // Parameterized constructor
    public Recipe(int id, String name, String category, String image, String ingredients, String instructions, String youtubeLink, String videoLink) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.image = image;
        this.ingredients = ingredients;
        this.instructions = instructions;
        this.youtubeLink = youtubeLink;
        this.videoLink = videoLink;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public String getImage() { return image; }
    public String getIngredients() { return ingredients; }
    public String getInstructions() { return instructions; }
    public String getYoutubeLink() { return youtubeLink; }
    public String getVideoLink() { return videoLink; }

    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setCategory(String category) { this.category = category; }
    public void setImage(String image) { this.image = image; }
    public void setIngredients(String ingredients) { this.ingredients = ingredients; }
    public void setInstructions(String instructions) { this.instructions = instructions; }
    public void setYoutubeLink(String youtubeLink) { this.youtubeLink = youtubeLink; }
    public void setVideoLink(String videoLink) { this.videoLink = videoLink; }
}
