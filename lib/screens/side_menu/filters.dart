import 'package:flutter/material.dart';
// import 'package:meals/screens/side_menu/main_drawer.dart';
// import 'package:meals/screens/tabs.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _filterValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx) => const TabsScreen()),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: _filterValue,
            onChanged: (isChecked) {
              setState(() {
                _filterValue = isChecked;
              });
            },
            title: Text(
              'Glute-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            subtitle: Text(
              'Only include glute-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
