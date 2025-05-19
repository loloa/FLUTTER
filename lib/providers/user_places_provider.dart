import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesProvider extends StateNotifier<List<Place>> {
  UserPlacesProvider() : super(const []);

  void addPlace(String title, File pickedImage) {
    final newPlace = Place(title: title, image: pickedImage);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesProvider, List<Place>>(
      (ref) => UserPlacesProvider(),
    );
