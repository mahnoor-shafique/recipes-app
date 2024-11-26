import 'package:flutter/material.dart';
import 'recipe_model.dart';
import 'recipe_detail_screen.dart';
import 'add_recipe_screen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Pasta Carbonara',
      imageUrl: 'https://example.com/pasta.jpg',
      description: 'A classic Italian pasta dish with creamy sauce.',
      ingredients: ['200g pasta', '100g bacon', '2 eggs', '50g Parmesan cheese', 'Salt and pepper'],
      steps: ['Cook pasta', 'Fry bacon', 'Mix eggs and Parmesan', 'Combine all', 'Serve'],
    ),
    // Add initial recipes here if needed
  ];

  void _addRecipe(Recipe recipe) {
    setState(() {
      recipes.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          var image = Image.network(recipe.imageUrl, width: 60, height: 60, fit: BoxFit.cover);
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: image,
              ),
              title: Text(recipe.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(recipe.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeDetailScreen(recipe: recipe)),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRecipeScreen(onAddRecipe: _addRecipe),
            ),
          );
        },
      ),
    );
  }
}
