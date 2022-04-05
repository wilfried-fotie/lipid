import 'dart:convert';

class Account {
  final int id;
  final int userId;
  final int age;
  final int currentSubscriptionId;
  final int physicalActivityId;

  final double weight;
  final double height;
  final String gender;
  final String createdAt;

  Account({
    required this.id,
    required this.userId,
    required this.age,
    required this.currentSubscriptionId,
    required this.physicalActivityId,
    required this.weight,
    required this.height,
    required this.gender,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'age': age,
      'currentSubscriptionId': currentSubscriptionId,
      'physicalActivityId': physicalActivityId,
      'weight': weight,
      'height': height,
      'gender': gender,
      'createdAt': createdAt,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      age: map['age']?.toInt() ?? 0,
      currentSubscriptionId: map['currentSubscriptionId']?.toInt() ?? 0,
      physicalActivityId: map['physicalActivityId']?.toInt() ?? 0,
      weight: map['weight']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      gender: map['gender'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));
}
