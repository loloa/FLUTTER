import 'package:flutter/material.dart';
import 'package:meals/data/dammy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // every frame executed 60 times per second
      duration: const Duration(milliseconds: 300), // 0.3 sec
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = _filter(category.id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreens(title: category.title, meals: filteredMeals),
      ),
    );
  }

  List<Meal> _filter(String categoryId) {
    return widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),

      builder:
          (context, child) => SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut, // Smooth easing curve
              ),
            ),
            child: child,
          ),

      // builder:
      //     (context, child) => Padding(
      //       padding: EdgeInsets.only(
      //         top: 100 - _animationController.value * 100,
      //       ),
      //       child: child,
      //     ),
    );
  }
}
