import 'package:flutter/material.dart';
import 'recipe_model.dart';

class AddRecipeScreen extends StatefulWidget {
  final Function(Recipe) onAddRecipe;

  const AddRecipeScreen({Key? key, required this.onAddRecipe}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String imageUrl = '';
  String description = '';
  List<String> ingredients = [];
  List<String> steps = [];
  final ingredientController = TextEditingController();
  final stepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Recipe')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Recipe Name'),
                  onSaved: (value) => name = value ?? '',
                  validator: (value) =>
                      value!.isEmpty ? 'Name is required' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  onSaved: (value) => imageUrl = value ?? '',
                  validator: (value) =>
                      value!.isEmpty ? 'Image URL is required' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                  validator: (value) =>
                      value!.isEmpty ? 'Description is required' : null,
                ),
                const SizedBox(height: 20),
                Text(
                  "Ingredients",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...ingredients.map((ingredient) =>
                    ListTile(title: Text(ingredient))),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: ingredientController,
                        decoration:
                            const InputDecoration(labelText: 'Add Ingredient'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (ingredientController.text.isNotEmpty) {
                            ingredients.add(ingredientController.text);
                            ingredientController.clear();
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Steps",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...steps.map((step) => ListTile(title: Text(step))),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: stepController,
                        decoration: const InputDecoration(labelText: 'Add Step'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (stepController.text.isNotEmpty) {
                            steps.add(stepController.text);
                            stepController.clear();
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Save Recipe'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final newRecipe = Recipe(
                        name: name,
                        imageUrl: imageUrl,
                        description: description,
                        ingredients: ingredients,
                        steps: steps,
                      );
                      widget.onAddRecipe(newRecipe);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
