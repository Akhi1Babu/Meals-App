import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/data/dummy_data.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;
  const MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              "Ingedients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(height: 15),
            for (final ingrediant in meal.ingredients)
              Text(
                ingrediant, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              ),
            const SizedBox(height: 20),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
             const SizedBox(height: 15),
            ...meal.steps.map((step)=>
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Text(textAlign: TextAlign.center, step,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            )).toList(),
            
          ]),
        ));
  }
}
