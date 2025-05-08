import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesProvider extends StateNotifier<List<Meal>> {
  FavoritesProvider() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((savedMeal) => savedMeal.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoritesmealprovider =
    StateNotifierProvider<FavoritesProvider, List<Meal>>((ref) {
      return FavoritesProvider();
    });
