import 'package:flutter/material.dart';
import 'package:io/components/draw.dart';
import 'package:io/pages/categories.dart';
import 'package:io/pages/filters.dart';
import 'package:io/pages/meals.dart';
import 'package:io/providers/fav_provider.dart';
import 'package:io/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class tabs extends ConsumerStatefulWidget {
  const tabs({super.key});

  @override
  ConsumerState<tabs> createState() {
    return _TabsState();
  }
}

const kintialfilters = {
  filtr.gar: false,
  filtr.lactose: false,
  filtr.vegan: false,
  filtr.vegetarian: false
};

class _TabsState extends ConsumerState<tabs> {
  Map<filtr, bool> _jdj = kintialfilters;

  int page = 0;

// this fuction is actually called for like toggle between these pages so yeah...
  void pa(int index) {
    setState(() {
      page = index;
    });
  }

  void set(String iden) async {
    if (iden == 'filters') {
      Navigator.pop(context);
      final result = await Navigator.of(context).push<Map<filtr, bool>>(
          MaterialPageRoute(builder: (ctx) => const filter()));

      setState(() {
        _jdj = result ?? kintialfilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availble = meals.where((meal) {
      if (_jdj[filtr.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      if (_jdj[filtr.gar]! && !meal.isGlutenFree) {
        return false;
      }
      if (_jdj[filtr.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_jdj[filtr.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = categories(
      availablemeals: availble,
    );
    var activetitle = "categories";

    if (page == 1) {
      final faved = ref.watch(favmealpro);
      activepage = Meals(
        meals: faved,
        title: " ",
      );
      activetitle = "faviorites";
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95,
        backgroundColor: Colors.pink[100],
        title: Text(
          activetitle,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      drawer: DraW(
        onselect: set,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        currentIndex: page,
        onTap: (index) {
          pa(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
              color: Colors.black,
            ),
            label: "categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.black,
            ),
            label: "favoties",
          )
        ],
      ),
    );
  }
}
