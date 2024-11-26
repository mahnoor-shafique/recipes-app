// lib/recipe_model.dart

class Recipe {
  final String name;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
  });
}
