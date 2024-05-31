import 'package:flutter/material.dart';
import 'package:io/components/meal_item.dart';
import 'package:io/models/Meals.dart';
import 'package:io/pages/deatls.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.meals, required this.title,});

  final String title;
  final List<Meal> meals;

 


  @override
  Widget build(BuildContext context) {
    Widget content=const Text("nothing");;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Details(
          meal: meal,
        
        ),
      ),
    );
  }


    if (meals.isNotEmpty) {
    content= ListView.builder(
      itemCount: meals.length,
          itemBuilder: (ctx, index) => miteam(meal: meals[index], io: (Meal meal) {selectMeal(context, meal); },));
  
    }
    if (meals.isEmpty) {
      content=const Text("nothing");
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text(title,style: TextStyle(color: Colors.black),),
      ),
      body:content
    );
  }
}
