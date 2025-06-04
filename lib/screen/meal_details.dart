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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildListCard(String text, {int? stepNumber}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.primaryContainer),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Text(
        stepNumber != null ? 'Step $stepNumber: $text' : '• $text',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              height: 1.4,
            ),
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
  widget.meal.title,
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
    shadows: [
      Shadow(
        color: Colors.black26,
        blurRadius: 4,
        offset: Offset(1, 2),
      ),
    ],
  ),
),

            const SizedBox(height: 24),

            // Ingredients Section
            _buildSectionTitle("Ingredients"),
            ...widget.meal.ingredients.map((ingredient) => _buildListCard(ingredient)),

            const SizedBox(height: 24),

            // Steps Section
            _buildSectionTitle("Steps"),
            ...widget.meal.steps.asMap().entries.map(
                  (entry) => _buildListCard(entry.value, stepNumber: entry.key + 1),
                ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
