import 'package:flutter/material.dart';
import 'package:io/models/Meals.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 243, 181, 202),
        title: Text(meal.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: Text("Ingredents",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 12,
            ),
            for (final ingre in meal.ingredients) Center(child: Text(ingre)),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: Text("steps",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            for (final steps in meal.steps) Center(child: Text(steps,textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
