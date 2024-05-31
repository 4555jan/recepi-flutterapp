

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:io/models/Meals.dart';

class favNotifier extends StateNotifier<List<Meal>> {
  favNotifier() : super([]);
bool torfd(Meal bitch) {
    final nkd = state.contains(bitch);

    if (nkd) {
      state = state.where((m) => m.id != bitch.id).toList();
      return false;
    } else {
      state = [...state, bitch];
      return true;
    }
    
  }
}

final favmealpro = StateNotifierProvider<favNotifier, List<Meal>>((ref) {
  return favNotifier();
});
