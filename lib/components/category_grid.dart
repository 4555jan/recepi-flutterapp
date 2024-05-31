import 'package:flutter/material.dart';
import 'package:io/models/Category.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.category, required this.onsele});

  final Category category;
  final void Function() onsele;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onsele,
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.9),
              category.color.withOpacity(0.9)
            ])),
        child: Text(category.title),
      ),
    );
  }
}
