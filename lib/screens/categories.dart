import 'package:flutter/material.dart';
import 'package:ud_meals_app/data/dummy_data.dart';
import 'package:ud_meals_app/models/meal.dart';
import 'package:ud_meals_app/screens/meals.dart';
import 'package:ud_meals_app/widgets/category_grid_item.dart';
import 'package:ud_meals_app/models/category.dart';
// import 'package:ud_meals_app/widgets/main_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavourite});
  final void Function(Meal meal) onToggleFavourite;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          onToggleFavourite: onToggleFavourite,
          title: category.title,
          meals: filteredMeal,
        ),
      ),
    );
  }

// void _setScreen(BuildContext context, String identifier) {
//     if (identifier == "filters") {
//     } else {
//       Navigator.pop(context);
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Pick your Category"),
      // ),
      // drawer: MainDrawer(onSelectScreen: _setScreen(context)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2 / 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCateory: () {
                    _selectCategory(context, category);
                  })
          ],
        ),
      ),
    );
  }
}
