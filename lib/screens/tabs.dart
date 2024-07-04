import 'package:flutter/material.dart';
import 'package:ud_meals_app/models/meal.dart';
import 'package:ud_meals_app/screens/categories.dart';
import 'package:ud_meals_app/screens/filters.dart';
import 'package:ud_meals_app/screens/meals.dart';
import 'package:ud_meals_app/widgets/main_drawer.dart';
// import 'package:ud_meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message),
    ));
    // ScaffoldMessenger(
    //   child: SnackBar(
    //     duration: const Duration(seconds: 3),
    //     content: Text(message),
    //   ),
    // );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showInfoMessage("Remove from Favourite");
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showInfoMessage("Add to Favourite");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == "filters") {
      Navigator.pop(context);
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeTabPage;
    // if (_selectPageIndex == 1) {
    //   activeTabPage = const MealsScreen(title: "Favourite", meals: []);
    // }
    activeTabPage = _selectPageIndex == 0
        ? CategoriesScreen(
            onToggleFavourite: _toggleMealFavouriteStatus,
          )
        : MealsScreen(
            title: "Favourite",
            meals: _favouriteMeals,
            onToggleFavourite: _toggleMealFavouriteStatus,
          );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your Category"),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeTabPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
