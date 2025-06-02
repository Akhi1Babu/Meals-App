import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const Meals({
    super.key,
    required this.title,
    required this.meals,
  });
  void SelectMeal(BuildContext context,Meal meal){
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal)));
}
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index],onSelectMeal:SelectMeal),
      );
    

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals found',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 20),
            Text('Try selecting a different category!',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              
            ),
          ],
        ),
      );
    }

    // ✅ Always return Scaffold outside the if block
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
