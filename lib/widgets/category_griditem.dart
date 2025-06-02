import 'package:flutter/foundation.dart';
import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryGrid({
    super.key,
    required this.title,
    required this.color,
    required this.id,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color.withOpacity(0.7),
          color.withOpacity(0.9),
          
        ])
      ),
      child: Text(title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),),
      

    ) ;
  }
}