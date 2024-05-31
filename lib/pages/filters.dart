// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:io/components/draw.dart';
import 'package:io/pages/tabs.dart';

enum filtr {
  gar,
  lactose,
  vegetarian,
  vegan,
}

class filter extends StatefulWidget {
  const filter({super.key});

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  var gar = false;
  var lactose = false;
  var vegan = false;
  var vegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: const Text(
          "filters",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // drawer: DraW(onselect: (identifier) {
        //Navigator.of(context).pop();
      // if (identifier == 'meals') {
      //  Navigator.of(context)
        //    .pushReplacement(MaterialPageRoute(builder: (ctx) => const tabs()));
  //   }
      // }),
      body:   PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {


       if(didPop) return; 
          Navigator.of(context).pop({
            filtr.gar: gar,
            filtr.lactose: lactose,
            filtr.vegan: vegan,
            filtr.vegetarian: vegetarian
          });
        
          
        },
        child: Column(
          children: [
            SwitchListTile(
              value: gar,
              onChanged: (isChecked) {
                setState(() {
                  gar = isChecked;
                });
              },
              title: const Text(
                "gluten free",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: const Text(
                "only gluten free",
                style: TextStyle(color: Colors.black),
              ),
              activeColor: Colors.black,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            ),
            SwitchListTile(
              value: lactose,
              onChanged: (isChecked) {
                setState(() {
                  lactose = isChecked;
                });
              },
              title: const Text(
                "lactose free",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: const Text(
                "only lacose free",
                style: TextStyle(color: Colors.black),
              ),
              activeColor: Colors.black,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            ),
            SwitchListTile(
              value: vegan,
              onChanged: (isChecked) {
                setState(() {
                  vegan = isChecked;
                });
              },
              title: const Text(
                "vegan",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: const Text(
                "only vegan",
                style: TextStyle(color: Colors.black),
              ),
              activeColor: Colors.black,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            ),
            SwitchListTile(
              value: vegetarian,
              onChanged: (isChecked) {
                setState(() {
                  vegetarian = isChecked;
                });
              },
              title: const Text(
                "vegetarien",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: const Text(
                "only vegetarien",
                style: TextStyle(color: Colors.black),
              ),
              activeColor: Colors.black,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            )
          ],
        ),
      ),
    );
  }
}
