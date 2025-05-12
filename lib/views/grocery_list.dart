import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/views/grocery_cell.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Groceries')),

      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final model = groceryItems[index];
          return ListTile(
            leading: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: model.category.color),
            ),
            title: Text(model.name),
            trailing: Text(model.quantity.toString()),
          );
          // GroceryCell(model: groceryItems[index]);
        },
      ),
    );
  }
}
