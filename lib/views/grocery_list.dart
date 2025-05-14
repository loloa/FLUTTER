import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/app_logger.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/views/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutter-prep-74de6-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final entry in listData.entries) {
      final itemCategory = categories.values.firstWhere(
        (category) => category.title == entry.value['category'],
      );

      final item = GroceryItem(
        id: entry.key,
        name: entry.value['name'],
        quantity: entry.value['quantity'],
        category: itemCategory,
      );
      loadedItems.add(item);
    }

    setState(() {
      _items = loadedItems;
    });
    /*
    final decodedResponse = jsonDecode(response.body);
    final prettyJson = const JsonEncoder.withIndent(
      '  ',
    ).convert(decodedResponse);

    AppLog.api.dLog(prettyJson);
    */
  }

  void _addNewitem() async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const NewItem()));

    // wait to come back after finishing writing to DB
    _loadItems();
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _items.remove(item);
    });
  }

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
