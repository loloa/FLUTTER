import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  const Mealitem({
    super.key,
    required this.model,
    required this.onTapToDetails,
  });
  final Meal model;
  final void Function(Meal meal) onTapToDetails;

  Widget titleView(Meal model) {
    return Text(
      model.title,
      maxLines: 2,
      textAlign: TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ), // ...
    );
  }

  Widget metadataView(Meal model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MealItemTrait(icon: Icons.schedule, label: '${model.duration} min'),
        const SizedBox(width: 12),
        MealItemTrait(icon: Icons.work, label: complexityText),
        const SizedBox(width: 12),
        MealItemTrait(
          icon: Icons.attach_money_outlined,
          label: affordabilityText,
        ),
      ],
    );
  }

  String get complexityText {
    return model.complexity.name[0].toUpperCase() +
        model.complexity.name.substring(1);
  }

  String get affordabilityText {
    return model.affordability.name[0].toUpperCase() +
        model.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onTapToDetails(model);
        },
        // z stack
        child: Stack(
          children: [
            Hero(
              tag: model.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(model.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    titleView(model),
                    SizedBox(height: 12),
                    metadataView(model),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
