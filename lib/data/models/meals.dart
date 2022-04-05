import 'dart:convert';

class Meal {
  final String name;
  final String description;
  final String type;
  final double points;
  final String? createdAt;

  Meal({
    required this.name,
    required this.description,
    required this.type,
    required this.points,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'type': type,
      'points': points,
      'createdAt': createdAt,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));

  Meal copyWith({
    String? name,
    String? description,
    String? type,
    double? points,
    String? createdAt,
  }) {
    return Meal(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      points: points ?? this.points,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
