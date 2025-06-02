import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/category_griditem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _SelectCategory(BuildContext context,Category category) {
    
    final filteredMeals= dummyMeals.where((meals) =>
    meals.categories.contains(category.id)
    ).toList();
    Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Meals(title: category.title, meals:filteredMeals )));

    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Categories'),
      ),
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