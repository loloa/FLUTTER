import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals.provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

const Map<Filter, bool> kInitialfilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super(kInitialfilters);

  // method to manupulate state in imutable way

  void setChosenFilters(Map<Filter, bool> chosenfilters) {
    state = chosenfilters;
  }

  void setFilter(Filter key, bool isActive) {
    state = {...state, key: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
