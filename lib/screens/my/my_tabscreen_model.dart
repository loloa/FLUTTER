import 'package:meals/models/meal.dart';

class MyTabScreenViewModel {
  final List<Meal> favoriteMeals = [];

  void toggleMealFavoriteStatus(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);

    if (isExisting) {
      favoriteMeals.remove(meal);
    } else {
      favoriteMeals.add(meal);
    }
  }
}
