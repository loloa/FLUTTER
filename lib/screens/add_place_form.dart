import 'package:flutter/material.dart';

class AddPlaceForm extends StatefulWidget {
  const AddPlaceForm({super.key});

  @override
  State<AddPlaceForm> createState() {
    return _AddPlaceFormState();
  }
}

class _AddPlaceFormState extends State<AddPlaceForm> {
  final _formkey = GlobalKey<FormState>();
  var _enteredName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add place form')),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (newValue) {
                  _enteredName = newValue!;
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'Title must be not empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
