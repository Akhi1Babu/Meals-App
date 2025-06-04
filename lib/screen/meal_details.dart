import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatefulWidget {
  final Meal meal;
  final void Function(Meal meal) toggleFavourite;
  final bool Function(Meal meal) isFavourite;

  const MealDetails({
    super.key,
    required this.meal,
    required this.toggleFavourite,
    required this.isFavourite,
  });

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  late bool _isFav;

  @override
  void initState() {
    super.initState();
    _isFav = widget.isFavourite(widget.meal);
  }

  void _handleToggle() {
    setState(() {
      widget.toggleFavourite(widget.meal);
      _isFav = widget.isFavourite(widget.meal);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFav ? 'Added to favourites!' : 'Removed from favourites!',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            icon: Icon(_isFav ? Icons.star : Icons.star_border),
            onPressed: _handleToggle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.meal.imageUrl),
            const SizedBox(height: 16),
            Text(
              textAlign: TextAlign.center,
              widget.meal.title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(height: 15),
            for (final ingredient in widget.meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
            ...widget.meal.steps.map(
              (step) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
