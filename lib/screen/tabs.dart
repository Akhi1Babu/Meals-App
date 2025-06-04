import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> favouriteMeals = [];

  void _toggleFavourite(Meal meal) {
    final isExisting = favouriteMeals.contains(meal);
    setState(() {
      if (isExisting) {
        favouriteMeals.remove(meal);
      } else {
        favouriteMeals.add(meal);
      }
    });
  }

  bool _isFavourite(Meal meal) {
    return favouriteMeals.contains(meal);
  }

  int _selectedIndex = 0;

  void _selectPageIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String activePageTitle = "Categories";
    Widget activePage = CategoriesScreen(
      toggleFavourite: _toggleFavourite,
      isMealFavourite: _isFavourite,
    );

    if (_selectedIndex == 1) {
      activePageTitle = "Your Favourite Meals";
      activePage = Meals(
        meals: favouriteMeals,
        toggleFavourite: _toggleFavourite,
        isFavourite: _isFavourite,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
        onTap: _selectPageIndex,
      ),
    );
  }
}
