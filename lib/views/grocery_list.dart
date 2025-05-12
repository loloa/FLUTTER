import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/views/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addNewitem() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addNewitem, icon: Icon(Icons.add))],
      ),

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
