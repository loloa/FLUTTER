import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/views/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _items = [];

  static const _emptyStateMessage = Center(
    child: Text(
      'Your list is empty...\nUse \' + \' to add a new item.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 147, 229, 250)),
    ),
  );

  Widget _buildListItem(GroceryItem item) {
    return Dismissible(
      key: ValueKey(item.id),
      onDismissed: (direction) {
        _removeItem(item);
      },
      background: Container(
        color: Colors.red,
        margin: Theme.of(context).cardTheme.margin,
      ),
      child: ListTile(
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(color: item.category.color),
        ),
        title: Text(item.name),
        trailing: Text(item.quantity.toString()),
      ),
    );
  }

  Widget _buildcontent() {
    if (_items.isEmpty) {
      return _emptyStateMessage;
    }
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) => _buildListItem(_items[index]),
    );
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _items.remove(item);
    });
  }

  void _addNewitem() async {
    final item = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const NewItem()));

    if (item == null) {
      return;
    }
    setState(() {
      _items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addNewitem, icon: Icon(Icons.add))],
      ),

      body: _buildcontent(),
    );
  }
}
