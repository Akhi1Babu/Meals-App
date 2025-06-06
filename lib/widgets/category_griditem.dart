import 'package:flutter/foundation.dart';
import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final Function onSelectCategory;
  const CategoryGrid({
    super.key,
    required this.title,
    required this.color,
    required this.id,
    required this.onSelectCategory,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        onSelectCategory();

      },
      splashColor: Theme.of(context).colorScheme.onSecondary,
      borderRadius: BorderRadius.circular(20),
     
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color.withOpacity(0.9),
            
          ])
        ),
        child: Text(title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),),
        
      
      ),
    ) ;
  }
}