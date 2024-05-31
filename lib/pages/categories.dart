import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:io/components/category_grid.dart';
import 'package:io/models/Category.dart';

import 'package:io/data/dummby.dart';
import 'package:io/models/Meals.dart';
import 'package:io/pages/meals.dart';

// ignore: camel_case_types
class categories extends StatefulWidget {
  const categories({super.key, required this.availablemeals});

  final List<Meal> availablemeals;

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories>
    with SingleTickerProviderStateMixin {
  late AnimationController _ajimef;

  @override
  void initState() {
    super.initState();
    _ajimef =
        AnimationController(vsync: this, duration: Duration(milliseconds: 89),
      
        
        );
  }

  void _selectcategory(context, Category category) {
    final items = widget.availablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Meals(
              meals: items,
              title: category.title,
            )));
  }

  @override
  
  void dispose() {
    _ajimef.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(), ScaleEffect()],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            //displaying the list
            for (final categories in availableCategories)
              Item(
                category: categories,
                onsele: () {
                  _selectcategory(context, categories);
                },
              )
          ],
        ),
      ),
    );
  }
}
