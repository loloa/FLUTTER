import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/my/my_tabscreen_model.dart';

// Enum to manage tabs with a callback for screen creation
enum Tab {
  categories(title: 'Categories', icon: Icon(Icons.set_meal)),
  favorites(title: 'Favorites', icon: Icon(Icons.star));

  final String title;
  final Icon icon;

  const Tab({required this.title, required this.icon});
}

// Screen
class MyTabsScreen extends StatefulWidget {
  const MyTabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTabsScreenState();
  }
}

class _MyTabsScreenState extends State<MyTabsScreen> {
  final MyTabScreenViewModel _viewModel = MyTabScreenViewModel();
  Tab _selectedTab = Tab.values.first;

  void _selectPage(int index) {
    setState(() {
      _selectedTab = Tab.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(availableMeals: []);

    if (_selectedTab == Tab.favorites) {
      activePage = MealsScreens(meals: _viewModel.favoriteMeals);
    }

    return Scaffold(
      appBar: AppBar(title: Text(_selectedTab.title)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab.index,
        onTap: _selectPage,
        items:
            Tab.values.map((tab) {
              return BottomNavigationBarItem(icon: tab.icon, label: tab.title);
            }).toList(),
      ),
    );
  }
}
