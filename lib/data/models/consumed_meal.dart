import 'dart:convert';

class ConsumedMeal {
  final int? id;
  final int mealId;
  final int userId;
  final String date;
  final String reference;
  final String quantity;

  ConsumedMeal({
    this.id,
    required this.mealId,
    required this.userId,
    required this.date,
    required this.reference,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mealId': mealId,
      'userId': userId,
      'date': date,
      'reference': reference,
      'quantity': quantity,
    };
  }

  factory ConsumedMeal.fromMap(Map<String, dynamic> map) {
    return ConsumedMeal(
      id: map['id']?.toInt(),
      mealId: map['mealId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      date: map['date'] ?? '',
      reference: map['reference'] ?? '',
      quantity: map['quantity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConsumedMeal.fromJson(String source) =>
      ConsumedMeal.fromMap(json.decode(source));
}
