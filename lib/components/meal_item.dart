import 'package:flutter/material.dart';
import 'package:io/components/mealit.dart';
import 'package:io/models/Meals.dart';


import 'package:transparent_image/transparent_image.dart';

class miteam extends StatelessWidget {
  const miteam({super.key, required this.meal,required this.io});
  final Meal meal;
 final void Function(Meal meal) io;
 // final void Function(Meal meal) onselectitem;
  String get cdd {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          io(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
                bottom: 0,
                left: 10,
                right: 10,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          meait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 12,
                          ),
                          
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
