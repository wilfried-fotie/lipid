import 'dart:convert';

import 'package:lipid/data/models/consumed_meal.dart';

class BatchConsumedMeals {
  final List<ConsumedMeal> consumedMeals;

  BatchConsumedMeals({
    required this.consumedMeals,
  });

  Map<String, dynamic> toMap() {
    return {
      'consumedMeals': consumedMeals.map((x) => x.toMap()).toList(),
    };
  }

  factory BatchConsumedMeals.fromMap(Map<String, dynamic> map) {
    return BatchConsumedMeals(
      consumedMeals: List<ConsumedMeal>.from(
          map['consumedMeals']?.map((x) => ConsumedMeal.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BatchConsumedMeals.fromJson(String source) =>
      BatchConsumedMeals.fromMap(json.decode(source));
}
