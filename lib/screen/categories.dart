import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/category_griditem.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) toggleFavourite;
  final bool Function(Meal meal) isMealFavourite;
  final List<Meal> availableMeals;

  const CategoriesScreen({
    super.key,
    required this.toggleFavourite,
    required this.isMealFavourite,

    required this.availableMeals,
  });

  void _SelectCategory(BuildContext context,Category category) {
    
    final filteredMeals= availableMeals.where((meals) =>
    meals.categories.contains(category.id)
    ).toList();
    Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Meals(title: category.title, meals:filteredMeals ,toggleFavourite:toggleFavourite, isFavourite: isMealFavourite,)));

    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20 ), 
      children: 
       availableCategories.map((category) {
          return CategoryGrid(
            id: category.id,
            title: category.title,
            color: category.color,
            onSelectCategory: () {
              _SelectCategory(context, category);
            },
          );
        }).toList(),
      

      ),
    );
  }
}