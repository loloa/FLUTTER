import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  const Mealitem({super.key, required this.model});

  final Meal model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(model.imageUrl),
        ),
      ),
    );
  }
}
