import 'package:flutter/material.dart';
import 'package:meals/data/dammy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
    required this.onToggleFavorites,
  });

  final List<Meal> availableMeals;
  final void Function(Meal meal) onToggleFavorites;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = _filter(category.id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreens(
              title: category.title,
              meals: filteredMeals,
              onToggleFavorites: onToggleFavorites,
            ),
      ),
    );
  }

  List<Meal> _filter(String categoryId) {
    return availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...availableCategories.map(
          (category) => CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
        ),
      ],
    );
  }
}
