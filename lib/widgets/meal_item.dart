import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/meal_item_traint.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealItem extends StatelessWidget {

  final Meal meal;
final void Function(BuildContext context,Meal meal)? onSelectMeal;
  const MealItem({super.key, required this.meal, this.onSelectMeal});
  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
        onTap: (){
          onSelectMeal!(context,meal);
        },
          
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl)
            ,fit: BoxFit.cover, width: double.infinity,height: 200,),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text( 
                      meal.title,maxLines: 2,textAlign: TextAlign.center, 
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                    const SizedBox(height: 10),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTraint(icon: Icons.schedule, label: '${meal.duration} min'),
                        SizedBox(width: 10),
                        MealItemTraint(icon: Icons.work, label: complexityText),
                         SizedBox(width: 10),
                        MealItemTraint(icon: FontAwesomeIcons.dollarSign, label: affordabilityText),


                      ],
                     )

                  ],
                ),
              )
              )
          ],
        ),
      ),
    );
  }
}