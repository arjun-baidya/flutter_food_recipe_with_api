import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_with_api/models/recipe.api.dart';
import 'package:flutter_food_recipe_with_api/models/recipe.dart';
import 'package:flutter_food_recipe_with_api/views/widgets/recipe_card.dart';

class HomaePage extends StatefulWidget {

  const HomaePage({ Key? key }) : super(key: key);

  @override
  State<HomaePage> createState() => _HomaePageState();
}

class _HomaePageState extends State<HomaePage> {

  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // ignore: avoid_print
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Recipe'),
          ],
        ),
      ),
      body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));

  }
}