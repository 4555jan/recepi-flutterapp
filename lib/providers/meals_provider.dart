import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:io/data/dummby.dart';



final mealsProvider = Provider((ref) {
  return dummyMeals;
});

