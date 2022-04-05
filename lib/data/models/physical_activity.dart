import 'dart:convert';

class PhysicalActivity {
  final String name;
  final String period;
  final String coefficient;
  final String? createdAt;

  PhysicalActivity({
    required this.name,
    required this.period,
    required this.coefficient,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'period': period,
      'coefficient': coefficient,
      'createdAt': createdAt,
    };
  }

  factory PhysicalActivity.fromMap(Map<String, dynamic> map) {
    return PhysicalActivity(
      name: map['name'] ?? '',
      period: map['period'] ?? '',
      coefficient: map['coefficient'] ?? '',
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicalActivity.fromJson(String source) =>
      PhysicalActivity.fromMap(json.decode(source));
}
