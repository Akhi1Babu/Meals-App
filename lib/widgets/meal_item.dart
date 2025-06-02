import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {

  final Meal meal;
  const MealItem({super.key, required this.meal});

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
        onTap: (){},
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl)
            ,fit: BoxFit.cover, width: double.infinity,),
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
                      children: [
                        // Text(meal.)

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