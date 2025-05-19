import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Plces'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      ),
      body: PlacesList(places: [Place(title: 'First')]),
    );
  }
}
