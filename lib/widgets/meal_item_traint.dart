import 'package:flutter/material.dart';

class MealItemTraint extends StatelessWidget {
  final IconData icon;
  final String label;
  const MealItemTraint({super.key,required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 16,color: Colors.white,),
        const SizedBox(width: 6),
        Text(label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );

  }
}