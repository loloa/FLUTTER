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
  var _glutenFilterSet = false;
  var _lactoseFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

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
            value: _glutenFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFilterSet = isChecked;
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
          // lactose
          SwitchListTile(
            value: _lactoseFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFilterSet = isChecked;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          // vegeterian
          SwitchListTile(
            value: _vegeterianFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegeterianFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegeterian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            subtitle: Text(
              'Only include vegeterian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          // vegan
          SwitchListTile(
            value: _veganFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            subtitle: Text(
              'Only include vegan meals',
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
