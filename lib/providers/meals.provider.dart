import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dammy_data.dart';

final mealsProvider = Provider((refProd) {
  return dummyMeals;
});
